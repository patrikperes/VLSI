--------------------------------------------------------------
-- Contador sincrono com clear e enable	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity contador is

port(	clk: 		in std_logic;
	clear,enable:	in std_logic;
	A:		in std_logic_vector(5 downto 0);
	Z:		out std_logic
);
end contador;

--------------------------------------------------------------

architecture arq_contador of contador is

--type STATES is (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9);
--signal EA, PE: STATES;
--signal aux: std_logic_vector(5 downto 0):= "000000";
signal aux_unsigned: unsigned(5 downto 0);
begin
P1: process(clk, clear,enable,A)
	begin
		if clk'event and clk= '1' then
			if clear= '1' then
			aux_unsigned <= unsigned(A);

			elsif enable = '1'then
				--aux_unsigned <= unsigned(aux) - 1;
				--aux <= std_logic_vector(aux_unsigned);
				aux_unsigned <= aux_unsigned -1;
			end if;
		end if;
	end process;

Z <= 	'1' when std_logic_vector(aux_unsigned) = "000000" else
	'0';

--P2: process(aux_unsigned)
--	begin
--		if std_logic_vector(aux_unsigned) = "000000" then
--			Z <= '1';
--		else
--			Z <= '0';
--		end if;
--	end process;
end arq_contador;

--------------------------------------------------------------
