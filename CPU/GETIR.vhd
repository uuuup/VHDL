----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:15:20 07/15/2017 
-- Design Name: 
-- Module Name:    GETIR - Behavioral 
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

entity GETIR is
	port (
			t0: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			pcin: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			pcupdata: IN STD_LOGIC;
			pcout: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);--送给回写
			pcout_m: out std_logic_vector(15 downto 0);--送给访存控制
			IRin : in std_logic_vector(15 downto 0);
			rout: out std_logic;
			irout: out std_logic_vector(15 downto 0)
	);
end GETIR;

architecture Behavioral of GETIR is
SIGNAL  pc: std_logic_vector(15 downto 0);
SIGNAL  IR: std_logic_vector(15 downto 0);
begin
			pc       <= "0000000000000000" when (reset = '1') else 
			          pcin when (reset = '0' and pcupdata = '1') else
						 pc ;
						
			pcout     <="0000000000000000" when (reset = '1') else
						 pc when (t0 = '1');
						
			pcout_m  <= "0000000000000000" when (reset = '1') else
						 pc when (t0 = '1');
						
			irout    <= "0000000000000000" when (reset = '1') else
						 ir ;
						 
			ir    	<= "0000000000000000" when (reset = '1') else
						 irin ;
						 
			rout 		<= '0' when (reset = '1') else
						'1' when ( reset = '0' and t0 = '1') else
						'0' when ( reset = '0' and t0 = '0');

	
end Behavioral;

