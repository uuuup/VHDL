----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:12 07/19/2017 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is
port( 
		reset: in std_logic;
		clk  : in std_logic;
		dbus : inout std_logic_vector(15 downto 0);
		abus : out std_logic_vector(15 downto 0);
		ioab : out std_logic_vector(1 downto 0);
		iodbin : in std_logic_vector(7 downto 0);
		iodbout : out std_logic_vector(7 downto 0);
		nMREQ,nRD,nWR,nBHE,nBLE:out std_logic;
		nPREQ,nPRD,nPWR: out std_logic;
		t00,t10,t20,t30:out std_logic;
		--IR:out std_logic_vector(15 downto 0);
		--iodbout:out std_logic_vector(15 downto 0);
		Regout0,Regout1,Regout2,Regout3,Regout4,Regout5,Regout6,Regout7:out std_logic_vector(7 downto 0)
			);
end CPU;

architecture Behavioral of CPU is
		component CLOCK_CPU is               --ʱ��ģ��
		PORT ( reset,clk : in STD_LOGIC;
		 t: out STD_LOGIC_VECTOR(3 DOWNTO 0));
		end component;

		component GetIR is                --ȡָģ��
		port (
			t0: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			pcin: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			pcupdata: IN STD_LOGIC;
			pcout: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);--�͸���д
			pcout_m: out std_logic_vector(15 downto 0);--�͸��ô����
			IRin : in std_logic_vector(15 downto 0);
			rout: out std_logic;
			irout: out std_logic_vector(15 downto 0)
		);
		end component;

		component compute is                   --����ģ��
		port(
			reset   : in  std_logic;
			t1      : in  std_logic; 
			Rupdata : in  std_logic; -- ���ݻ�д�ź�
			Cupdata : in  std_logic; -- ��λ��д�ź�
			--Mupdata : in  std_logic; --mvi/mov��д�ź�
			Rdata   : in  std_logic_vector(7 downto 0);
			Cyin    : in  std_logic;--��д�Ľ�λ�ź�
			Cyout   : out std_logic;
			IRin    : in  std_logic_vector(15 downto 0);
			Aluout  : out std_logic_vector( 7 downto 0);
			addr    : out std_logic_vector(15 downto 0);
			pcjmp   : out std_logic_vector(15 downto 0);
			pcjz    : out std_logic_vector(15 downto 0);
			Regout0,Regout1,Regout2,Regout3,Regout4,Regout5,Regout6,Regout7:out std_logic_vector(7 downto 0);
			IODBin    : IN std_logic_vector( 7 downto 0);
			IODBout    : out std_logic_vector( 7 downto 0);
			IOAB    : OUT   std_logic_vector( 1 downto 0);
			IOI     : OUT std_logic;
			IOO     : OUT std_logic;
			npreq   : OUT std_logic
			);
		end component;

		component memory is                --�ô�ģ��
		port(
			reset: IN STD_LOGIC;
			t2 :  in std_logic;
			IRIN: in std_logic_vector(15 downto 0);
			Rtempin:in std_logic_vector(7 downto 0);
			Rtempout:out std_logic_vector(7 downto 0);
			WOUT, ROUT: out std_logic
		);
		end component;

			component WriteBack is             --��дģ��
			port(
				reset: IN STD_LOGIC;
				T3:IN STD_LOGIC;
				IRIN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);--�����pc��pc+1���ֵ
				pcupdata:out std_logic;
				PCIN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				pcjmp, pcjz:in std_logic_vector(15 downto 0);
				pcout: out std_logic_vector(15 downto 0);
				rupdata:out std_logic;
				aluout,rtempin: in std_logic_vector(7 downto 0);
				rdataout:out std_logic_vector(7 downto 0);
				cupdata:out std_logic;
				cyin:in std_logic;
				cyout:out std_logic
			);
			end component;

			component  memcontrl is            --�ô����
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
			end component;
signal t0,t1,t2,t3:std_logic;        --����
signal IR_to_getir,IR_to_others:std_logic_vector(15 downto 0);-- һ��ָ��ȥȡָģ�飬��һ��ָ��ȥ����ģ��
signal PCtoPCnew:std_logic_vector(15 downto 0);     --pc +1 ֮���ͻ�д
signal PCnewtoPC, pcjmp, pcjz:std_logic_vector(15 downto 0);-- pc��д,
signal PCtoMemory:std_logic_vector(15 downto 0);--pc��ȥ�洢��ȡָ
signal aluout:std_logic_vector(7 downto 0);--������
signal w,r,RtoM:std_logic;--RtoM ��ָ������ Wд���� R������ 
signal Rtempin,Rtempout:std_logic_vector(7 downto 0);--rtempin�Ӵ洢���ʹ洢ģ�� rtempout �Ӵ洢ģ���ͻ�д
signal PCupdata,Rupdata,Cupdata:std_logic;--��д�ź�
signal addr:std_logic_vector(15 downto 0);--����ģ����ĵ�ַ
signal cyin,cyout:std_logic;--cyin�������λ�д cyout�ӻ�д������
signal Rdata:std_logic_vector(7 downto 0);--��д����	

begin
	--signal RdatatoAlu:std_logic_vector(7 downto 0);
	

	--signal sbhe,sble,swr,srd,smreq:std_logic;
	--signal sabus:std_logic_vector(15 downto 0);
	U1 : CLOCK_CPU PORT MAP( clk=>clk, reset=>reset, t(0)=>t0, t(1)=>t1, t(2)=>t2, t(3)=>t3 );
	
	U2 : GETIR 		PORT MAP( t0, reset, pcnewtopc, pcupdata, pctopcnew, pctomemory, ir_to_getir, rtom, ir_to_others);
	
	U3 : COMPUTE   PORT MAP( reset,t1, rupdata, cupdata, rdata, cyout, cyin, ir_to_others, aluout, addr, pcjmp, pcjz, Regout0,Regout1,Regout2,Regout3,Regout4,Regout5,Regout6,Regout7, iodbin,iodbout, ioab, nprd, npwr, npreq);
	
	U4 : MEMORY    PORT MAP(reset, t2, ir_to_others, rtempin, rtempout, w, r);
	
	U5 : writeback PORT MAP(reset, t3, ir_to_others, pcupdata, pctopcnew, pcjmp, pcjz, pcnewtopc, rupdata, aluout, rtempout, rdata, cupdata, cyin, cyout);
	
	U6 : memcontrl port MAP( t0, t2, reset, pcnewtopc, addr, aluout, r, w, rtom, rtempin, ir_to_getir, abus, dbus, nMREQ, nWR, nRD, nBHE, nBLE);
	t00<=t0;
	t10<=t1;
	t20<=t2;
	t30<=t3;

end Behavioral;
