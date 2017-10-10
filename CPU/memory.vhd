----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:03:18 07/18/2017 
-- Design Name: 
-- Module Name:    memory - Behavioral 
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

entity memory is
port(
		reset: in std_logic;
		t2 :  in std_logic;
		IRIN: in std_logic_vector(15 downto 0);
		Rtempin:in std_logic_vector(7 downto 0);
		Rtempout:out std_logic_vector(7 downto 0);
		WOUT, ROUT: out std_logic
);
end memory;

architecture Behavioral of memory is
signal Rtemp:std_logic_vector(7 downto 0);
begin
	WOUT <= '0' when (t2 = '1' and irin(15 downto 11) = "01100") else '1';
	
	ROUT <= '0' when (t2 = '1' and irin(15 downto 11) = "01110") else '1';
	
	rtemp <="00000000" when (reset='1') else
				rtempin when (t2 = '1' and irin(15 downto 11) = "01110");
	
	rtempout <= rtemp;
end Behavioral;

