--------------------------------------------------------------
-- Datapath	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity datapath is

port(	A: 									in std_logic_vector(63 downto 0);
	B:									in std_logic_vector(63 downto 0);
	T_clearA,T_shift,T_loadA,T_c0,T_clearQ, T_loadQ,T_clearC,T_en,clk:	in std_logic;
	Q0, Z:									out std_logic;
	M:									out std_logic_vector(127 downto 0)
);
end datapath;

--------------------------------------------------------------

architecture behavior of datapath is
signal LSBA,LSBQ,cout: std_logic;
signal P_M,P_L,sum: std_logic_vector(63 downto 0);
--signal RA,RQ: std_logic_vector(64 downto 0);
component somador is
port( 	A: 	in std_logic_vector(63 downto 0);
	B:	in std_logic_vector(63 downto 0);
	cin:	in std_logic;
	S:	out std_logic_vector(63 downto 0);
	cout:	out std_logic);
end component;
component reg_64 is
port( 	D: 			in std_logic_vector(63 downto 0);
	LSI:			in std_logic;
	clk,clear,load,shift:	in std_logic;
	Q:			out std_logic_vector(63 downto 0)
);
end component;
component contador is
port( 	clk: 		in std_logic;
	clear,enable:	in std_logic;
	A:		in std_logic_vector(5 downto 0);
	Z:		out std_logic);
end component;
component FFD is
port( clk,clear: 	in std_logic;
	D:		in std_logic;
	Q:		out std_logic);
end component;
begin

RegA: reg_64 port map (sum,LSBA, clk, T_clearA, T_loadA,T_shift,P_M);
RegQ: reg_64 port map (B, LSBQ, clk, T_clearQ,T_loadQ,T_shift, P_L);
Counter: contador port map (clk,T_clearC,T_en,"111111",Z);
sum1: somador port map (A, P_M, '0',sum,cout);
flipflop: FFD port map (clk, T_c0, cout, LSBA);
M <= P_M & P_L;
Q0 <= P_L(0);
LSBQ <= P_M(0);

		

end behavior;

--------------------------------------------------------------
