--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:18:29 07/18/2017
-- Design Name:   
-- Module Name:   D:/CS/CPU/test_memory.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_memory IS
END test_memory;
 
ARCHITECTURE behavior OF test_memory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory
    PORT(
			reset: in std_logic;
         t2 : IN  std_logic;
         IRIN : IN  std_logic_vector(15 downto 0);
         Rtempin : IN  std_logic_vector(7 downto 0);
         Rtempout : OUT  std_logic_vector(7 downto 0);
         WOUT : OUT  std_logic;
         ROUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal t2 : std_logic := '0';
   signal IRIN : std_logic_vector(15 downto 0) := (others => '0');
   signal Rtempin : std_logic_vector(7 downto 0) := (others => '0');
	signal reset:  std_logic;

 	--Outputs
   signal Rtempout : std_logic_vector(7 downto 0);
   signal WOUT : std_logic;
   signal ROUT : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory PORT MAP (
			reset => reset,
          t2 => t2,
          IRIN => IRIN,
          Rtempin => Rtempin,
          Rtempout => Rtempout,
          WOUT => WOUT,
          ROUT => ROUT
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <='1';
      wait for 100 ns;	
		reset<='0';
		t2<='1';
		IRin<="0110001010101010";   --STA
		wait for 100 ns;
		
		IRin<="0111010101010101";   --LDA
		Rtempin<="11000010";      --来自MDR的数据
		wait for 100 ns;
		
		IRin<="0000000000000000";
      wait for 100 ns;
		t2 <='0';
		wait for 100 ns;
		reset<='1';
		wait;
      -- insert stimulus here 

      wait;
   end process;

END;
