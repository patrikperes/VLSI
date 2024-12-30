--------------------------------------------------------------
-- Contador sincrono com reset de modulo 10		
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity contador is

port(	clk: 	in std_logic;
	rst:	in std_logic;
	count:	out std_logic_vector(3 downto 0)
);
end contador;

--------------------------------------------------------------

architecture arq_contador of contador is

type STATES is (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9);
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

P2: process(EA)
	begin
		case EA is
			when E0 =>
				count <= "0000";
				PE <= E1;
			when E1 =>
				count <= "0001";
				PE <= E2;
			when E2 =>
				count <= "0010";
				PE <= E3;
			when E3 =>
				count <= "0011";
				PE <= E4;
			when E4 =>
				count <= "0100";
				PE <= E5;
			when E5 =>
				count <= "0101";
				PE <= E6;
			when E6 =>
				count <= "0110";
				PE <= E7;
			when E7 =>
				count <= "0111";
				PE <= E8;
			when E8 =>
				count <= "1000";
				PE <= E9;
			when E9 =>
				count <= "1001";
				PE <= E0;
		end case;
	end process;

end arq_contador;

--------------------------------------------------------------
