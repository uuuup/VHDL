--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:43:21 07/16/2017
-- Design Name:   
-- Module Name:   D:/CS/CPU/test_memcontrl.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memcontrl
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
 
ENTITY test_memcontrl IS
END test_memcontrl;
 
ARCHITECTURE behavior OF test_memcontrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memcontrl
    PORT(
         t0 : IN  std_logic;
         t2 : IN  std_logic;
         reset : IN  std_logic;
         pcin : IN  std_logic_vector(15 downto 0);
         addrin : IN  std_logic_vector(15 downto 0);
         aluout : IN  std_logic_vector(7 downto 0);
         Rin : IN  std_logic;
         Win : IN  std_logic;
         RtoM : IN  std_logic;
         Rtemp : OUT  std_logic_vector(7 downto 0);
         IRout : OUT  std_logic_vector(15 downto 0);
         Abus : OUT  std_logic_vector(15 downto 0);
         Dbus : INOUT  std_logic_vector(15 downto 0);
         Mreq : OUT  std_logic;
         WR : OUT  std_logic;
         RD : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal t0 : std_logic := '0';
   signal t2 : std_logic := '0';
   signal reset : std_logic := '0';
   signal pcin : std_logic_vector(15 downto 0) := (others => '0');
   signal addrin : std_logic_vector(15 downto 0) := (others => '0');
   signal aluout : std_logic_vector(7 downto 0) := (others => '0');
   signal Rin : std_logic := '0';
   signal Win : std_logic := '0';
   signal RtoM : std_logic := '0';

	--BiDirs
   
   signal Dbus : std_logic_vector(15 downto 0);

 	--Outputs
	signal Rtemp : std_logic_vector(7 downto 0);
   signal IRout : std_logic_vector(15 downto 0);
   signal Abus : std_logic_vector(15 downto 0);
   signal Mreq : std_logic;
   signal WR : std_logic;
   signal RD : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memcontrl PORT MAP (
          t0 => t0,
          t2 => t2,
          reset => reset,
          pcin => pcin,
          addrin => addrin,
          aluout => aluout,
          Rin => Rin,
          Win => Win,
          RtoM => RtoM,
          Rtemp => Rtemp,
          IRout => IRout,
          Abus => Abus,
          Dbus => Dbus,
          Mreq => Mreq,
          WR => WR,
          RD => RD,
          nBHE => nBHE,
          nBLE => nBLE
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
		reset<='1';    --刚开始信号无效
      t0<='0';
		t2<='0';
		RIN<='1';
		WIN<='1';
		RTOM<='0';
		Dbus<= "0000000000000000";
		--rtemp<="00000000";
		wait for 40 ns;
		
		reset<='0';
		t0<='1';
		rtom<='1';
		pcin<="0000000000000111";
		dbus<="0000000011110000";
		--rtemp<="ZZZZZZZZ";
		wait for 40 ns;
		
		t0<='0';
		t2<='1';
		Rin<='0';
		win<='1';
		rtom<='0';
		addrin<="0000000011101101";
		dbus<="0001001000110001";
		wait for 40 ns;
		
		
		t0<='1';
		t2<='0';
		rtom<='1';
		RIN<='1';
		WIN<='1';
		pcin<="0001100000000011";
		dbus<="0000001111001100";
		wait for 40 ns;
		
		t0<='0';
		t2<='0';
		--addrin<="ZZZZZZZZZZZZZZZZ";
		Dbus<="ZZZZZZZZZZZZZZZZ";    --inout 置高阻再改变输入，不冲突
		wait for 50 ns;

		t0<='0';
		t2<='1';
		Rin<='1';
		win<='0';
		rtom<='0';
		aluout<="00110010";
		addrin<="0000111011100010";
		wait for 40 ns;
		
		t0<='0';
		t2<='0';

      wait;
   end process;

END;
