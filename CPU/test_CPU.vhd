--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:10:30 07/19/2017
-- Design Name:   
-- Module Name:   D:/CS/CPU/test_CPU.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
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
 
ENTITY test_CPU IS
END test_CPU;
 
ARCHITECTURE behavior OF test_CPU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         dbus : INOUT  std_logic_vector(15 downto 0);
         abus : OUT  std_logic_vector(15 downto 0);
         ioab : OUT  std_logic_vector(1 downto 0);
			iodbin : in std_logic_vector(7 downto 0);
         iodbout : OUT  std_logic_vector(7 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         nPREQ : OUT  std_logic;
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic;
			Regout0,Regout1,Regout2,Regout3,Regout4,Regout5,Regout6,Regout7:out std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
	signal iodbin : std_logic_vector(7 downto 0);


	--BiDirs
   signal dbus : std_logic_vector(15 downto 0);
   --signal iodb : std_logic_vector(7 downto 0);

 	--Outputs
	signal iodbout : std_logic_vector(7 downto 0);
   signal abus : std_logic_vector(15 downto 0);
   signal ioab : std_logic_vector(1 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal nPREQ : std_logic;
   signal nPRD : std_logic;
   signal nPWR : std_logic;
   signal Regout0,Regout1,Regout2,Regout3,Regout4,Regout5,Regout6,Regout7: std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          reset => reset,
          clk => clk,
          dbus => dbus,
          abus => abus,
          ioab => ioab,
          iodbin => iodbin,
			 iodbout => iodbout,
          nMREQ => nMREQ,
          nRD => nRD,
          nWR => nWR,
          nBHE => nBHE,
          nBLE => nBLE,
          nPREQ => nPREQ,
          nPRD => nPRD,
          nPWR => nPWR,
			 Regout0 =>Regout0,
			 Regout1 =>Regout1,
			 Regout2 =>Regout2,
			 Regout3 =>Regout3,
			 Regout4 =>Regout4,
			 Regout5 =>Regout5,
			 Regout6 =>Regout6,
			 Regout7 =>Regout7
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
		DBUS <= "0000000000000000";
		IODBin <="00000000";
      wait for 10 ns;
		
		reset <= '0';
		wait for 5 ns;
		Dbus <= "0100000000000000";
      wait for 40 ns;
		
		Dbus <= "0100000100000001";
      wait for 40 ns;
		
		Dbus <= "0100001000000010";
      wait for 40 ns;
		
		Dbus <= "0100001100000011";
      wait for 40 ns;
		
		Dbus <= "0100010000000100";
      wait for 40 ns;
		
		Dbus <= "0100010100000101";
      wait for 40 ns;
		
		Dbus <= "0100011000000110";
      wait for 40 ns;
		
		Dbus <= "0100011100000111";
      wait for 40 ns;
      -- insert stimulus here 
		
		Dbus<="0101010000000011";      --MOV R3->R4
		wait for 40 ns;
	
		Dbus<="0011000100000000";      --加法指令--R1+R0->R1
		wait for 40 ns;
		
		Dbus<="0010000100000010";      --减法指令 R1-R2->R1
		wait for 40 ns;
		
		Dbus<="0000000000000001";      --JMP  R7//00000001     --绝对跳转
		wait for 40 ns;
		
		Dbus <="0100010100000000";      -- MVI R5 0
		wait for 40 ns;
		
		Dbus<="0001010100000010";      --JZ R5=0  R7//00000010
		wait for 40 ns;

		
		Dbus<="0111000000000101";      --LDA R7//00000101->R0 取数
		wait for 20 ns;
		Dbus<="0000000011111111";       --将取出来的值置于总线
		wait for 20 ns;
		
		
		Dbus<="0110000111111111";       --R1的值存在R7//11111111的地址
		wait for 20 ns;
		
		
		
		Dbus<="ZZZZZZZZZZZZZZZZ";      -- 将输入置无效  输出则是R1的值
		wait for 20 ns;
		
		Dbus<="0001000100000010";      --JZ R5=0  R7//00000010
		wait for 40 ns;
		
		Dbus<="1000011000000010";	
		--IODB<="ZZZZZZZZ";		--out r6,port
		wait for 40 ns;  
		
		
		DBUS<="1001011100000011";    --in r7,port
		wait for 10 ns;
		IODBin <= "00110011";
		wait for 30 ns;	
		
		reset <='1';
		Dbus <= "0000000000000000";
		iodbin <= "00000000";		
		wait ;
      --wait for 10 ns;
   end process;

END;
