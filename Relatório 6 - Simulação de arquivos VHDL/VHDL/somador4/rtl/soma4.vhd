--------------------------------------------------------------
-- Somador de 4 bits		
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity soma4 is

port(	A:	in unsigned(3 downto 0);
	B:	in unsigned(3 downto 0);
	S:	out unsigned(4 downto 0)
);
end soma4;

--------------------------------------------------------------

architecture arq_soma4 of soma4 is

begin
S <= A+(B+"00000");
end arq_soma4;

--------------------------------------------------------------
