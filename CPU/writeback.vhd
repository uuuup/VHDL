----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:36 07/18/2017 
-- Design Name: 
-- Module Name:    writeback - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity writeback is
PORT (
		reset : in std_logic;
		T3:IN STD_LOGIC;
		IRIN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);--这里的pc是pc+1后的值
		pcupdata:out std_logic;
		PCIN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		pcjmp, pcjz:in std_logic_vector(15 downto 0);
		pcout: out std_logic_vector(15 downto 0);
		rupdata:out std_logic;
		aluout,rtempin: in std_logic_vector(7 downto 0);
		rdataout:out std_logic_vector(7 downto 0);
		cupdata:out std_logic;
		cyin:in std_logic;
		cyout:out std_logic
		
);
end writeback;

architecture Behavioral of writeback is
signal Rdata:std_logic_vector(7 downto 0);
signal pcnew:std_logic_vector(15 downto 0);

begin	
		pcupdata <= '0' when(reset = '1') else
					   '1' when(t3='1') else
						'0';
					  
		pcnew   <= "0000000000000000" when(reset = '1') else
					  pcjmp+pcin when(t3 = '1' and irin( 15 downto 11) = "00000") else
					  pcjz+pcin when(t3 = '1' and irin( 15 downto 11) = "00010") else
					  pcin+1 when (t3 = '1');
					  
					  
		pcout <= "0000000000000000" when(reset = '1') else
					  pcnew when (t3 ='1');
					  
		
		rupdata <= '0' when(reset = '1' )else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "00100") else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "00110") else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "01000") else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "01010") else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "01110") else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "10010") else
					  '0';
					  
		cupdata <= '0' when(reset = '1' )else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "00100") else
					  '1' when(t3 = '1' and irin( 15 downto 11) = "00110") else
					  '0';
					  
		cyout <=   '0'  when(reset = '1' )else
					  cyin when(t3 = '1' and irin( 15 downto 11) = "00100") else
					  cyin when(t3 = '1' and irin( 15 downto 11) = "00110") else
					  '0';
					  
		rdata   <= "00000000" when(reset = '1' )else
						rtempin when(t3 = '1' and irin(15 downto 11) = "01110") else
						aluout when(t3 = '1' and irin( 15 downto 11) = "00100") else
					   aluout when(t3 = '1' and irin( 15 downto 11) = "00110") else
						aluout when(t3 = '1' and irin( 15 downto 11) = "01000") else
						aluout when(t3 = '1' and irin( 15 downto 11) = "01010") else
						aluout when(t3 = '1' and irin( 15 downto 11) = "01110") else
						aluout when(t3 = '1' and irin( 15 downto 11) = "10010") else
						"00000000";
						
		rdataout  <= "00000000" when(reset = '1' )else
						rdata when (t3 ='1');
						
				

end Behavioral;

