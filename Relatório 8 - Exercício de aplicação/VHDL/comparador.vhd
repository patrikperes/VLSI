--------------------------------------------------------------
-- Comparador assincrono 		
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

--------------------------------------------------------------

entity comparador is

port(	
	A:	in std_logic_vector(7 downto 0);
	B:	in std_logic_vector(7 downto 0);
	T_end:	out std_logic
);
end comparador;

--------------------------------------------------------------

architecture behavior of comparador is

begin
T_end <= '0' when A<B else
	 '1';

end behavior;

--------------------------------------------------------------
