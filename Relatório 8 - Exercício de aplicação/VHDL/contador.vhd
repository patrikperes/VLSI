--------------------------------------------------------------
-- Contador sincrono com reset de modulo 10		
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

--------------------------------------------------------------

entity contador is

port(	clk: 	in std_logic;
	rst:	in std_logic;
	count:	out std_logic_vector(7 downto 0)
);
end contador;

--------------------------------------------------------------

architecture arq_contador of contador is

--type STATES is (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9);
--signal EA, PE: STATES;
signal aux: std_logic_vector(7 downto 0):= "00000000";
begin
P1: process(clk, rst)
	begin
		if rst= '1' then
			count <= "00000001";
			aux <= "00000001";
		elsif clk'event and clk= '1' then
			aux <= aux + "00000001";
			count <= aux;
		end if;
	end process;

end arq_contador;

--------------------------------------------------------------
