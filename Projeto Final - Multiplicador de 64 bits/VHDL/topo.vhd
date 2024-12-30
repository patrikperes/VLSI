--------------------------------------------------------------
-- Arquivo Topo (controle + datapath)	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity topo is

port(	reset, go,clk:	in std_logic;
	A,B:		in std_logic_vector(63 downto 0);
	M:		out std_logic_vector(127 downto 0);
	idle:		out std_logic
);
end topo;

--------------------------------------------------------------

architecture behavior of topo is
signal T_clearA,T_clearQ,T_clearC,T_loadA,T_loadQ,T_shift,T_c0,T_en,z,Q0: std_logic;

component datapath is
port( 	A: 									in std_logic_vector(63 downto 0);
	B:									in std_logic_vector(63 downto 0);
	T_clearA,T_shift,T_loadA,T_c0,T_clearQ, T_loadQ,T_clearC,T_en,clk:	in std_logic;
	Q0, Z:									out std_logic;
	M:									out std_logic_vector(127 downto 0)
);
end component;
component controle is
port(	T_clearA,T_shift, T_loadA,T_clearQ, T_loadQ, T_c0, T_clearC, T_en,T_Idle:	out std_logic;
	go, Q0, Z,rst,clk:								in std_logic
);
end component;
begin
u_Datapath: datapath port map (A,B,T_clearA,T_shift,T_loadA,T_c0,T_clearQ,T_loadQ,T_clearC,T_en,clk,Q0,Z,M);
u_Controle: controle port map (T_clearA,T_shift,T_loadA,T_clearQ,T_loadQ,T_c0,T_clearC,T_en,Idle,go,Q0,Z,reset,clk);
	
end behavior;

--------------------------------------------------------------
