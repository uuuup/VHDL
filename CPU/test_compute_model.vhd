--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:30:01 07/18/2017
-- Design Name:   
-- Module Name:   D:/CS/CPU/test_compute_model.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: compute
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
 
ENTITY test_compute_model IS
END test_compute_model;
 
ARCHITECTURE behavior OF test_compute_model IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT compute
    PORT(
			reset   : in  std_logic;
         t1 : IN  std_logic;
         Rupdata : IN  std_logic;
         Cupdata : IN  std_logic;
         Rdata : IN  std_logic_vector(7 downto 0);
         Cyin : IN  std_logic;
         Cyout : OUT  std_logic;
         IRin : IN  std_logic_vector(15 downto 0);
         Aluout : OUT  std_logic_vector(7 downto 0);
         addr : OUT  std_logic_vector(15 downto 0);
         pcjmp : OUT  std_logic_vector(15 downto 0);
         pcjz : OUT  std_logic_vector(15 downto 0);
         Regout0 : OUT  std_logic_vector(7 downto 0);
         Regout1 : OUT  std_logic_vector(7 downto 0);
         Regout2 : OUT  std_logic_vector(7 downto 0);
         Regout3 : OUT  std_logic_vector(7 downto 0);
         Regout4 : OUT  std_logic_vector(7 downto 0);
         Regout5 : OUT  std_logic_vector(7 downto 0);
         Regout6 : OUT  std_logic_vector(7 downto 0);
         Regout7 : OUT  std_logic_vector(7 downto 0);
         IODBin : IN  std_logic_vector(7 downto 0);
			IODBout : OUT  std_logic_vector(7 downto 0);
         IOAB : OUT  std_logic_vector(1 downto 0);
			IOI  : OUT std_logic;
			IOO  : OUT std_logic;
			npreq   : OUT std_logic
        );
    END COMPONENT;
    
		
   --Inputs
	SIGNAL IOI   :STD_LOGIC:='0';
	SIGNAL IOO   :STD_LOGIC:='0';
	signal reset   :  std_logic:='0';
   signal t1 : std_logic := '0';
   signal Rupdata : std_logic := '0';
   signal Cupdata : std_logic := '0';
   signal Rdata : std_logic_vector(7 downto 0) := (others => '0');
   signal Cyin : std_logic := '0';
   signal IRin : std_logic_vector(15 downto 0) := (others => '0');
	signal IODBin : std_logic_vector(7 downto 0);
	--BiDirs

 	--Outputs
	signal  npreq   :  std_logic;
   signal Cyout : std_logic;
   signal Aluout : std_logic_vector(7 downto 0);
   signal addr : std_logic_vector(15 downto 0);
   signal pcjmp : std_logic_vector(15 downto 0);
   signal pcjz : std_logic_vector(15 downto 0);
   signal Regout0 : std_logic_vector(7 downto 0);
   signal Regout1 : std_logic_vector(7 downto 0);
   signal Regout2 : std_logic_vector(7 downto 0);
   signal Regout3 : std_logic_vector(7 downto 0);
   signal Regout4 : std_logic_vector(7 downto 0);
   signal Regout5 : std_logic_vector(7 downto 0);
   signal Regout6 : std_logic_vector(7 downto 0);
   signal Regout7 : std_logic_vector(7 downto 0);
   signal IOAB : std_logic_vector(1 downto 0);
   signal IODBout : std_logic_vector(7 downto 0);
	-- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: compute PORT MAP (
			 reset=>reset,
          npreq=>npreq,
			 t1 => t1,
          Rupdata => Rupdata,
          Cupdata => Cupdata,
          Rdata => Rdata,
          Cyin => Cyin,
          Cyout => Cyout,
          IRin => IRin,
          Aluout => Aluout,
          addr => addr,
          pcjmp => pcjmp,
          pcjz => pcjz,
          Regout0 => Regout0,
          Regout1 => Regout1,
          Regout2 => Regout2,
          Regout3 => Regout3,
          Regout4 => Regout4,
          Regout5 => Regout5,
          Regout6 => Regout6,
          Regout7 => Regout7,
          IODBin => IODBin,
			 IODBout => IODBout,
          IOAB => IOAB,
			 IOI=>IOI,
			 IOO=>IOO
        );

   -- Clock process definitions
  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
		reset<='1';
		IODBin<="00000000";
		t1<='0';
		wait for 20 ns;	
		reset <='0';
		rupdata <= '1';
		cupdata <= '0';
		
		rdata <= "00000111";
		irin <= "0100011100000111";--先利用回写更新寄存器组
		wait for 20 ns;
		
		rdata <= "00000110";
		irin <= "0100011000000110";
		wait for 20 ns;
		
		rdata <= "00000101";
		irin <= "0100010100000101";
		wait for 20 ns;
		
		rdata <= "00000100";
		irin <= "0100010000000100";
		wait for 20 ns;
		
		rdata <= "00000011";
		irin <= "0100001100000011";
		wait for 20 ns;
		
		rdata <= "00000010";
		irin <= "0100001000000010";
		wait for 20 ns;
		
		rdata <= "00000001";
		irin <= "0100000100000001";
		wait for 20 ns;
		
		rdata <= "11111111";
		irin <= "0100000011111111";
		wait for 20 ns;
		
		rupdata<='0';--更新CY;
		cupdata <='1';
		cyin <='1';
		wait for 20 ns;
		
		Rupdata<='0';            --R1+R2->R1
		Cupdata<='0';
		cyin<='0';
		cupdata <='0';
		t1<='1';
		--Dbus<="0011000100000000";      
		IRin<="0011000100000010";   
		wait for 20 ns;
		t1 <= '0';
		rupdata <= '1';
		rdata   <= "00000100";
		cupdata <= '1';
		cyin    <= '0';
		wait for 20 ns;

		t1<='1';
		Rupdata<='0';            --R3-R4->R3
		Cupdata<='0';
		cyin<='0';
		IRin<="0010001100000100";   
		wait for 20 ns;
		t1 <= '0';
		rupdata <= '1';
		rdata   <= "11111111";
		cupdata <= '1';
		cyin    <= '1';
		wait for 20 ns;
		
		t1 <= '1';
		Rupdata<='0';            
		Cupdata<='0';
		cyin<='0';
		IRin<="0100010110101010";   --MVI 10101010->R5
		wait for 20 ns;
		t1 <= '0';
		rupdata<='1';
		rdata<="10101010";
		wait for 20 ns;
		
		t1 <= '1';
		Rupdata<='0';            
		Cupdata<='0';
		cyin<='0';
		IRin<="0101001000000001";   --R1->R2
		wait for 20 ns;
		t1<= '0';
		rupdata<='1';
		rdata<="00000100";
		cupdata<='0';
		wait for 20 ns;
		
		t1 <= '1';
		Rupdata<='0';            
		Cupdata<='0';
		IRin<="0000000010101011";  --JMP 10101011
		wait for 20 ns;
		t1 <= '0';
		wait for 20 ns;
		
		t1 <= '1';
		IRin<="0001001001010101";   --JZ R2,01010101
		wait for 20 ns;
		t1<='0';
		wait for 20 ns;
		
		t1 <= '1';
		IRin<="0110001010101010";  --STA R2,10101010//存数
		wait for 20 ns;
		t1 <= '0';
		wait for 20 ns;
		
		t1<='1';
		IRin<="0111000101010101";  --LDA R1,00000000//取数
		wait for 20 ns;
		t1<='0';
		rupdata<='1';
		rdata<="00000000";
		wait for 20 ns;
		
		rupdata<='0';
		t1 <= '1';
		IRin<="0001000101010101";   --JZ R1,01010101
		wait for 20 ns;
		t1<='0';
		
		wait for 20 ns;
		
		t1 <= '1';
		IRin<="1000011000000010";
		--				--out r6,port
		wait for 20 ns;  
		t1<='0';
		wait for 20 ns;
		
		t1<='1';
		IRin<="1001011100000011";    --in r7,port
		IODBin <= "00110011";
		wait for 20 ns;
		
		
		t1 <= '0';
		rupdata <='1';
		rdata<="00110011";
		wait for 20 ns;
      
		reset<='1';
		IODBin <= "00000000";
      -- insert stimulus here 

      wait;
   end process;

END;
