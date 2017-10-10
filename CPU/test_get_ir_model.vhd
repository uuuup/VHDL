--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:24 07/16/2017
-- Design Name:   
-- Module Name:   D:/CS/CPU/test_get_ir_model.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GETIR
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
 
ENTITY test_get_ir_model IS
END test_get_ir_model;
 
ARCHITECTURE behavior OF test_get_ir_model IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GETIR
    PORT(
         t0 : IN  std_logic;
         reset : IN  std_logic;
         pcin : IN  std_logic_vector(15 downto 0);
         pcupdata : IN  std_logic;
         pcout : OUT  std_logic_vector(15 downto 0);
         pcout_m : OUT  std_logic_vector(15 downto 0);
         IRin : IN  std_logic_vector(15 downto 0);
         rout : OUT  std_logic;
         irout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal t0 : std_logic := '0';
   signal reset : std_logic := '0';
   signal pcin : std_logic_vector(15 downto 0) := (others => '0');
   signal pcupdata : std_logic := '0';
   signal IRin : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal pcout : std_logic_vector(15 downto 0);
   signal pcout_m : std_logic_vector(15 downto 0);
   signal rout : std_logic;
   signal irout : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GETIR PORT MAP (
          t0 => t0,
          reset => reset,
          pcin => pcin,
          pcupdata => pcupdata,
          pcout => pcout,
          pcout_m => pcout_m,
          IRin => IRin,
          rout => rout,
          irout => irout
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset<='1';
		t0<='0';
      wait for 20 ns;
		
		reset<='0';
		t0<='1';
		wait for 20 ns;
		
		
		irin<="0000000010001000";
		wait for 40 ns;
		
		t0<='0';
		wait for 40 ns;
		
		pcin<="0000011111000000";
		pcupdata<='1';
		wait for 40 ns;
		
		t0<='1';
		irin<= "0000100010100010";
		wait for 40 ns;
		
		t0<='0';
		reset<='1';
      wait;
   end process;

END;
