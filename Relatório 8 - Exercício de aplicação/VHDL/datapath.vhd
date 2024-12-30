--------------------------------------------------------------
-- Datapath	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

--------------------------------------------------------------

entity datapath is

port(	A: 		in std_logic_vector(7 downto 0);
	B:		in std_logic_vector(7 downto 0);
	T_rst,T_en,clk:	in std_logic;
	T_end:		out std_logic;
	R:		out std_logic_vector(15 downto 0)
);
end datapath;

--------------------------------------------------------------

architecture behavior of datapath is
signal cont,B1: std_logic_vector(7 downto 0);
signal A1,S1,S2,A_ex: std_logic_vector(15 downto 0);
component somador is
port( 	A: 	in std_logic_vector(15 downto 0);
	B:	in std_logic_vector(15 downto 0);
	S:	out std_logic_vector(15 downto 0));
end component;
component reg_16 is
port( 	D: 	in std_logic_vector(15 downto 0);
	clk,rst,en:	in std_logic;
	Q:	out std_logic_vector(15 downto 0)
);
end component;
component reg_8 is
port( 	D: 	in std_logic_vector(7 downto 0);
	clk,rst,en:	in std_logic;
	Q:	out std_logic_vector(7 downto 0)
);
end component;
component comparador is
port( 	A:	in std_logic_vector(7 downto 0);
	B:	in std_logic_vector(7 downto 0);
	T_end:	out std_logic);
end component;
component contador is
port( 	clk: 	in std_logic;
	rst:	in std_logic;
	count:	out std_logic_vector(7 downto 0));
end component;
begin
A_ex <= "00000000" & A;
RegA: reg_16 port map (A_ex, clk, '0', not(T_en), A1);
RegB: reg_8 port map (B, clk, '0', not(T_en), B1);
ContadorA: contador port map (clk,T_rst,cont);
Comp: comparador port map (cont, B1, T_end);
sum: somador port map (A1, S2, S1);
Regsum: reg_16 port map(S1, clk, T_rst, T_en, S2);
R <= S2;
		

end behavior;

--------------------------------------------------------------
