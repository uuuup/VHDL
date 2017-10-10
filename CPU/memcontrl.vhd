----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:20 07/16/2017 
-- Design Name: 
-- Module Name:    memcontrl - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memcontrl is
port(
	t0, t2: in std_logic;
	reset : in std_logic;
	pcin, addrin : in std_logic_vector(15 downto 0);--addr�Ǵ���ȡ���ĵ�ַ
	aluout: in std_logic_vector(7 downto 0);--����ʱֱ�ӽ�������aluout���ȥ
	Rin, Win, RtoM : in std_logic;
	Rtemp: out std_logic_vector(7 downto 0);--ȡ���������ʹ洢ģ��
	IRout: out std_logic_vector(15 downto 0);
	Abus:  out std_logic_vector(15 downto 0);
	Dbus:  inout std_logic_vector(15 downto 0);
	Mreq, WR, RD, nBHE, nBLE:out std_logic
);
end memcontrl;

architecture Behavioral of memcontrl is
SIGNAL MAR, MDR :STD_LOGIC_VECTOR(15 DOWNTO 0);
begin
	--if (reset = '1') then--��ϵͳ��λʱ�� ���ʴ洢�����źŶ�Ӧ����Ч
		Mreq  <= '1' when (reset = '1') else 
					'0' when (t0 = '1' and RtoM = '1') else
					'0' when (t2 = '1' and Rin  = '0') else
					'0' when (t2 = '1' and Win  = '0') else
					'1';--���ǵ͵�ƽ��Ч
					
		nBHE  <= '1' when (reset = '1') else 
					'0' when (t0 = '1' and RtoM = '1') else
					'0' when (t2 = '1' and Rin  = '0') else
					'0' when (t2 = '1' and Win  = '0') else
					'1';--���ǵ͵�ƽ��Ч
					
		nBLE  <= '1' when (reset = '1') else 
					'0' when (t0 = '1' and RtoM = '1') else
					'0' when (t2 = '1' and Rin  = '0') else
					'0' when (t2 = '1' and Win  = '0') else
					'1';--���ǵ͵�ƽ��Ч
					
		WR   <=  '1' when (reset = '1') else 
					'1' when (t0 = '1' and RtoM = '1') else
					'1' when (t2 = '1' and Rin  = '0') else
					'0' when (t2 = '1' and Win  = '0') else
					'1';--���ǵ͵�ƽ��Ч
					
		RD   <=   '1' when (reset = '1') else 
					 '0' when (t0 = '1' and RtoM = '1') else
					 '0' when (t2 = '1' and Rin  = '0') else
					 '1' when (t2 = '1' and Win  = '0') else
					 '1';--���ǵ͵�ƽ��Ч
					 
		MAR  <=    "0000000000000000" WHEN (reset = '1') else
						PCIN WHEN ( T0 ='1' AND RTOM = '1') ELSE
						addrin when (t2 = '1' and (Win = '0' or Rin = '0'));
						
		ABus <=    MAR;
						
		MDR  <=   "0000000000000000" WHEN (reset = '1') else
					 Dbus WHEN ( T0 ='1' AND RTOM = '1') ELSE
					 Dbus when (t2 = '1' and Rin = '0' ) else
					 "00000000"&aluout when (t2 = '1' and Win= '0');
					 
		DBUS <=   "00000000"&aluout when (t2 = '1' and Win = '0') else
					 "ZZZZZZZZZZZZZZZZ";
					
					
		irout <= "0000000000000000" when(reset = '1') else
					Dbus(15 downto 0) when( T0 ='1' AND RTOM = '1');
					
		rtemp<= "00000000"when(reset = '1') else
					Dbus(7 downto 0)when (t2 = '1' and Rin = '0' );
	

end Behavioral;

