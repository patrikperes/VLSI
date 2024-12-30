----------------------------------
-- UAL mais registrador de 32 bits	
----------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.all;

---------------------------------

entity UAL_reg is

port(	A: 		in std_logic_vector(31 downto 0);
	sel: 		in std_logic_vector(1 downto 0);
	rst,clk:	in std_logic;
	S:		out std_logic_vector(31 downto 0)
);
end UAL_reg;

--------------------------------

architecture behavior of UAL_reg is
signal aux: std_logic_vector(31 downto 0);
signal B: std_logic_vector(31 downto 0);
component UAL is
port( 	A: 	in std_logic_vector(31 downto 0);
	B:	in std_logic_vector(31 downto 0);
	sel: 	in std_logic_vector(1 downto 0);
	S:	out std_logic_vector(31 downto 0));
end component;

component reg is
port( 	D: 	in std_logic_vector(31 downto 0);
	clk,rst:	in std_logic;
	Q:	out std_logic_vector(31 downto 0));
end component;

begin
UAL1: UAL port map (A, B, sel, aux);
REGISTRADOR: reg port map (aux, clk, rst, B);
S <= B;

end behavior;

--------------------------------
