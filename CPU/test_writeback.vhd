--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:12:02 07/19/2017
-- Design Name:   
-- Module Name:   D:/CS/CPU/test_writeback.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: writeback
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
 
ENTITY test_writeback IS
END test_writeback;
 
ARCHITECTURE behavior OF test_writeback IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT writeback
    PORT(
			reset :in std_logic;
         T3 : IN  std_logic;
         IRIN : IN  std_logic_vector(15 downto 0);
         pcupdata : OUT  std_logic;
         PCIN : IN  std_logic_vector(15 downto 0);
         pcjmp : IN  std_logic_vector(15 downto 0);
         pcjz : IN  std_logic_vector(15 downto 0);
         pcout : OUT  std_logic_vector(15 downto 0);
         rupdata : OUT  std_logic;
         aluout : IN  std_logic_vector(7 downto 0);
         rtempin : IN  std_logic_vector(7 downto 0);
         rdataout : OUT  std_logic_vector(7 downto 0);
         cupdata : OUT  std_logic;
         cyin : IN  std_logic;
         cyout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal reset:std_logic:='0';
   signal T3 : std_logic := '0';
   signal IRIN : std_logic_vector(15 downto 0) := (others => '0');
   signal PCIN : std_logic_vector(15 downto 0) := (others => '0');
   signal pcjmp : std_logic_vector(15 downto 0) := (others => '0');
   signal pcjz : std_logic_vector(15 downto 0) := (others => '0');
   signal aluout : std_logic_vector(7 downto 0) := (others => '0');
   signal rtempin : std_logic_vector(7 downto 0) := (others => '0');
   signal cyin : std_logic := '0';

 	--Outputs
   signal pcupdata : std_logic;
   signal pcout : std_logic_vector(15 downto 0);
   signal rupdata : std_logic;
   signal rdataout : std_logic_vector(7 downto 0);
   signal cupdata : std_logic;
   signal cyout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: writeback PORT MAP (
			reset=>reset,
          T3 => T3,
          IRIN => IRIN,
          pcupdata => pcupdata,
          PCIN => PCIN,
          pcjmp => pcjmp,
          pcjz => pcjz,
          pcout => pcout,
          rupdata => rupdata,
          aluout => aluout,
          rtempin => rtempin,
          rdataout => rdataout,
          cupdata => cupdata,
          cyin => cyin,
          cyout => cyout
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
		
      -- hold reset state for 100 ns.
		reset<='1';
      wait for  100 ns; 
		pcin<="0000000000000000";
		reset<='0';--R1+R2->R1
		t3<='1';
		IRin<="0011000100000010";  
		aluout<="00000100";
		cyin    <= '0';
		wait for 20 ns;
		t3 <='0';
		wait for 20 ns;
		
		pcin<="0000000000000001";
		t3<='1';--R3-R4->R3
		IRin<="0010001100000100";  
		aluout<="11111111";
		cyin    <= '1';
		wait for 20 ns;
		t3 <= '0';
		wait for 20 ns;
		
		cyin<='0';
		t3 <= '1';
		pcin<="0000000000000010";
		IRin<="0100010110101010";   --MVI 10101010->R5
		aluout<="10101010";
		wait for 20 ns;
		t3 <= '0';
		wait for 20 ns;
		
		t3 <= '1';
		IRin<="0101001000000001";   --R1->R2
		pcin<="0000000000000011";
		aluout<="00000100";
		wait for 20 ns;
		t3<='0';
		wait for 20 ns;
		
		t3 <= '1';
		pcjmp<="1100110010101011";
		IRin<="0000000010101011";
		pcin<="0000000000000100";		--JMP 10101011
		wait for 20 ns;
		t3 <= '0';
		wait for 20 ns;
		
		t3   <= '1';
		pcin <="1100110010110000";
		pcjz <="0000000001010101";
		IRin <="0001001001010101";   --JZ R2,01010101
		wait for 20 ns;
		t3<='0';
		wait for 20 ns;
		
		t3   <= '1';
		pcin <="1100110100000110";
		pcjz <="0000000000000000";
		IRin <="0001001001010101";   --JZ R2,01010101
		wait for 20 ns;
		t3<='0';
		wait for 20 ns;
		
		t3 <= '1';
		pcin <="1100110100000111";
		IRin<="0110001010101010";  --STA R2,10101010//´æÊý
		wait for 20 ns;
		t3 <= '0';
		wait for 20 ns;
		
		t3<='1';
		IRin <="0111000101010101";  --LDA R1,01010101
		rtempin<="00001111";
		pcin <="1100110100001000";
		wait for 20 ns;
		t3<='0';
		wait for 20 ns;
		
		t3 <= '1';
		IRin<="1000011000000010";	--out r6,port
		pcin <="1100110100001001";
		wait for 20 ns;  
		t3 <='0';
		wait for 20 ns;
		
		t3<='1';
		pcin <="1100110100001010";
		IRin<="1001011111111111";    --in r7,port
		aluout <= "00110011";
		wait for 20 ns;
		t3<='0';
		
		reset<='1';
      
      -- insert stimulus here 

      wait;
   end process;

END;
