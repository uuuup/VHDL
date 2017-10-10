----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:51 07/17/2017 
-- Design Name: 
-- Module Name:    compute - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compute is
port (
		
		t1      : in  std_logic; 
		Rupdata : in  std_logic; -- 数据回写信号
		Cupdata : in  std_logic; -- 进位回写信号
		--Mupdata : in  std_logic; --mvi/mov回写信号
		Rdata   : in  std_logic_vector(7 downto 0);
		Cyin    : in  std_logic;--回写的进位信号
		Cyout   : out std_logic;
		IRin    : in  std_logic_vector(15 downto 0);
		Aluout  : out std_logic_vector( 7 downto 0);
		addr    : out std_logic_vector(15 downto 0);
		pcjmp   : out std_logic_vector(15 downto 0);
		pcjz    : out std_logic_vector(15 downto 0);
		Regout0,Regout1,Regout2,Regout3,Regout4,Regout5,Regout6,Regout7:out std_logic_vector(7 downto 0);
		IODBin    : IN std_logic_vector( 7 downto 0);
		IODBout    : out std_logic_vector( 7 downto 0);
		IOAB    : OUT   std_logic_vector( 1 downto 0);
		IOI     : OUT std_logic;
		IOO    : OUT std_logic;
		npreq   : OUT std_logic;
		reset   : in  std_logic
		);
end compute;

architecture Behavioral of compute is
subtype reg is std_logic_vector(7 downto 0);
subtype num is integer range 0 to 7;
type regarray is array (num) of reg;  -- 定义多维数组
signal myreg : regarray:=(others=>"00000000");--内部寄存器
--signal myreg : regarray;
signal cy :std_logic;
SIGNAL A,B,ans,ana:std_logic_vector(8 downto 0);
		
begin
			A <= '0' & myreg(conv_integer(irin(10 downto 8)));
			B <= '0' & myreg(conv_integer(irin( 2 downto 0)));
			ana<=A+B+cy;
			ans<=A-B-cy;
		
			IOI  <= '1' when (reset = '1') else
					  '0' when (t1 = '1' and irin( 15 downto 11) = "10010") else
					  '1';
					  
			IOO  <='1' when (reset = '1') else
					  '0' when (t1 = '1' and irin( 15 downto 11) = "10000") else
					  '1';
					  
			npreq <= '1' when (reset = '1') else
						'0' when(t1 = '1' and (irin( 15 downto 11) = "10010" or irin( 15 downto 11) = "10000")) else
						'1';
	
			pcjmp <= "0000000000000000"when(reset='1')else
						myreg(7)&irin(7 downto 0) when (t1 = '1' and irin( 15 downto 11) = "00000");
			
			pcjz 	<=	"0000000000000000"when(reset='1')else
						myreg(7) & irin(7 downto 0) when(t1 = '1' and irin( 15 downto 11) = "00010" and myreg(conv_integer(irin(10 downto 8))) = "00000000")else
						"0000000000000001"when(t1 = '1' and irin( 15 downto 11) = "00010" );
			
			aluout <= "00000000" when(reset='1')else
					    ans( 7 downto 0) when (t1 = '1' and irin( 15 downto 11) = "00100") else
						 ana( 7 downto 0) when (t1 = '1' and irin( 15 downto 11) = "00110") else
						 irin(7 downto 0) when (t1 = '1' and irin( 15 downto 11) = "01000") else
						 myreg(conv_integer(irin( 2 downto 0)))when (t1 = '1' and irin( 15 downto 11) = "01010") else
						 myreg(conv_integer(irin(10 downto 8))) when (t1 = '1' and irin( 15 downto 11) = "01100") else
						 IODBin(7 downto 0) when (t1 = '1' and irin( 15 downto 11) = "10010");
				
			myreg(conv_integer(irin(10 downto 8))) <= rdata when(rupdata = '1');
				
			cy   	<='0' when (reset ='1') else
					 cyin when(cupdata='1');
	
			cyout <='0' when (reset ='1') else
					   ans(8) when(t1 = '1' and irin( 15 downto 11) = "00100") else
					   ana(8) when(t1 = '1' and irin( 15 downto 11) = "00110");
			
			addr <= "0000000000000000" WHEN(reset= '1') ELSE
						myreg(7)& irin(7 downto 0) when(t1 = '1' and (irin( 15 downto 11) = "01100" or irin( 15 downto 11) = "01110"));
			
			IOAB   <= "00" when(reset ='1') else 
						irin(1 downto 0) when (t1 = '1' and irin( 15 downto 11) = "10010") else
						irin(1 downto 0)when  (t1 = '1' and irin( 15 downto 11) = "10000") ;
						
			IODBout  <="00000000" when (reset = '1') else
						myreg(conv_integer(irin(10 downto 8))) when(t1 = '1' and irin( 15 downto 11) = "10000")else
						"00000000";
						
			REgout0<="00000000" when(reset ='1')else myreg(0);
			REgout1<="00000000" when(reset ='1')else myreg(1);
			REgout2<="00000000" when(reset ='1')else myreg(2);
			REgout3<="00000000" when(reset ='1')else myreg(3);
			REgout4<="00000000" when(reset ='1')else myreg(4);
			REgout5<="00000000" when(reset ='1')else myreg(5);
			REgout6<="00000000" when(reset ='1')else myreg(6);
			REgout7<="00000000" when(reset ='1')else myreg(7);
			
			
	--Regout0<=myreg(0);
	--Regout1<=myreg(1);
	--Regout2<=myreg(2);		
	--Regout3<=myreg(3);
	---Regout4<=myreg(4);
	--Regout5<=myreg(5);
	--Regout6<=myreg(6);
	--Regout7<=myreg(7);

end Behavioral;

