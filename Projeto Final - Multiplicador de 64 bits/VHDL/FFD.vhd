--------------------------------------------------------------
-- Flip-Flop D
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity FFD is

port(	clk,clear: 	in std_logic;
	D:		in std_logic;
	Q:		out std_logic
);
end FFD;

--------------------------------------------------------------

architecture behavior of FFD is
begin
P1: process(clk, clear,D)
	begin
		if clear= '1' then
			Q<= '0';
		elsif clk'event and clk= '1' then
			Q <= D;
		end if;
	end process;
end behavior;
