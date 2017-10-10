----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:49:30 07/15/2017 
-- Design Name: 
-- Module Name:    CLOCK_CPU - Behavioral 
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

entity CLOCK_CPU is
PORT ( reset,clk : in STD_LOGIC;
		 t: out STD_LOGIC_VECTOR(3 DOWNTO 0));
end CLOCK_CPU;

architecture Behavioral of CLOCK_CPU is

begin
	
	process(clk,reset)
	variable a : integer :=0 ;
	begin
	if (reset = '0') then
		if (clk = '1' and clk'event) then
			case a is
				when 0 => t<="0001";
				when 1 => t<="0010";
				when 2 => t<="0100";
				when 3 => t<="1000";
				when others => null;
			end case;
			a:=a+1;
			if ( a = 4 ) then a:=0;
			end if;
		else null;
		end if;
	else t<="0000";
	end if;
end process;
end Behavioral;

