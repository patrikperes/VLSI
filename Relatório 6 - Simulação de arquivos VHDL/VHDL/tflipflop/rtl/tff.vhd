--------------------------------------------------------------
-- Contador síncrono com reset de módulo 10		
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity tff is

port(	clk: 	in std_logic;
	rst:	in std_logic;
	t:	out std_logic
);
end tff;

--------------------------------------------------------------

architecture arq_tff of tff is
signal t0: std_logic;
begin
P1: process(clk, rst)
	begin
		if rst= '1' then
			t0 <= '0';
		elsif clk'event and clk= '1' then
			t0 <= not t0;
		end if;
	end process;
t<=t0;
end arq_tff;

--------------------------------------------------------------
