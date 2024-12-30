--------------------------------------------------------------
-- Controle	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity controle is

port(	T_clearA,T_shift, T_loadA,T_clearQ, T_loadQ, T_c0, T_clearC, T_en,T_Idle:	out std_logic;
	go, Q0, Z,rst,clk:								in std_logic
);
end controle;

--------------------------------------------------------------

architecture behavior of controle is

type STATES is (start, M0, MQ0, MQ10, MQ11, Idle);
signal EA, PE: STATES;

begin
P1: process(clk, rst)
	begin
		if rst= '1' then
			EA <= start;
		elsif clk'event and clk= '1' then
			EA <= PE;
		end if;
	end process;

P2: process(EA,go,Z,Q0)
	begin
		case EA is
			when start =>
				T_clearA <= '1';
				T_shift <= '0';
				T_loadA <= '0';
				T_clearQ <= '0';
				T_loadQ <= '1';
				T_c0 <= '1';
				T_clearC <= '1';
				T_en <= '0';
				T_idle <= '0';
				if(go = '0') then
					PE <= start;
				else
					PE <= M0;
				end if;
			when M0 =>
				T_clearA <= '0';
				T_shift <= '0';
				T_loadA <= '0';
				T_clearQ <= '0';
				T_loadQ <= '0';
				T_c0 <= '1';
				T_clearC <= '0';
				T_en <= '0';
				T_idle <= '0';
				if(Q0 ='0') then
					PE <= MQ0;
				else
					PE <= MQ10;
				end if;
			when MQ0 =>
				T_clearA <= '0';
				T_shift <= '1';
				T_loadA <= '0';
				T_clearQ <= '0';
				T_loadQ <= '0';
				T_c0 <= '1';
				T_clearC <= '0';
				T_en <= '1';
				T_idle <= '0';
				if(Z ='0') then
					PE <= M0;
				else	
					PE <= Idle;
				end if;
			when MQ10 =>
				T_clearA <= '0';
				T_shift <= '0';
				T_loadA <= '1';
				T_clearQ <= '0';
				T_loadQ <= '0';
				T_c0 <= '0';
				T_clearC <= '0';
				T_en <= '0';
				T_idle <= '0';
				PE <= MQ11;
			when MQ11 =>
				T_clearA <= '0';
				T_shift <= '1';
				T_loadA <= '0';
				T_clearQ <= '0';
				T_loadQ <= '0';
				T_c0 <= '0';
				T_clearC <= '0';
				T_en <= '1';
				T_idle <= '0';
				if(Z ='0') then
					PE <= M0;
				else
					PE <= Idle;
				end if;
			when Idle =>
				T_clearA <= '0';
				T_shift <= '0';
				T_loadA <= '0';
				T_clearQ <= '0';
				T_loadQ <= '0';
				T_c0 <= '1';
				T_clearC <= '0';
				T_en <= '0';
				T_idle <= '1';
				PE <= Idle;		
				
		end case;
	end process;

	
end behavior;

--------------------------------------------------------------
