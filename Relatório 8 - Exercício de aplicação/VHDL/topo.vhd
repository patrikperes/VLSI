--------------------------------------------------------------
-- Arquivo Topo (controle + datapath)	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

--------------------------------------------------------------

entity topo is

port(	rst, start,clk:	in std_logic;
	A,B:		in std_logic_vector(7 downto 0);
	R:		out std_logic_vector(15 downto 0);
	busy:		out std_logic
);
end topo;

--------------------------------------------------------------

architecture behavior of topo is
signal S_rst,S_en,S_end: std_logic;

component datapath is
port( 	A: 		in std_logic_vector(7 downto 0);
	B:		in std_logic_vector(7 downto 0);
	T_rst,T_en,clk:	in std_logic;
	T_end:		out std_logic;
	R:		out std_logic_vector(15 downto 0)
);
end component;
component controle is
port(	T_rst,T_en,busy:	out std_logic;
	T_end, rst, start,clk:	in std_logic
);
end component;
begin
u_Datapath: datapath port map (A,B,S_rst,S_en,clk,S_end,R);
u_Controle: controle port map (S_rst, S_en, busy, S_end, rst, start,clk);
	
end behavior;

--------------------------------------------------------------
