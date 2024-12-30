--------------------------------------------------------------
-- Controle	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

--------------------------------------------------------------

entity controle is

port(	T_rst,T_en,busy:	out std_logic;
	T_end, rst, start,clk:	in std_logic
);
end controle;

--------------------------------------------------------------

architecture behavior of controle is

type STATES is (E0,E1,E2);
signal EA, PE: STATES;

begin
P1: process(clk, rst)
	begin
		if rst= '1' then
			EA <= E0;
		elsif clk'event and clk= '1' then
			EA <= PE;
		end if;
	end process;

P2: process(EA,rst,start,T_end)
	begin
		case EA is
			when E0 =>
				if(start = '0') then
					T_rst <= '1';
					T_en <= '0';
					busy <= '0';
					PE <= E0;
				else
					T_rst <= '1';
					T_en <= '0';
					busy <= '0';
					PE <= E1;
				end if;
			when E1 =>
				if(T_end='0') then
					T_rst <= '0';
					T_en <= '1';
					busy <= '1';
					PE <= E1;
				else
					T_rst <= '0';
					T_en <= '0';
					busy <= '1';
					PE <= E2;
				end if;
			when E2 =>
				T_rst <= '0';
				T_en <= '0';
				busy <= '0';
		end case;
	end process;

	
end behavior;

--------------------------------------------------------------
