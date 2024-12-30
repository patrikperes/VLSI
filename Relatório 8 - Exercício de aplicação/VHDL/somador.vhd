--------------------------------------------------------------
-- somador de 16 bits		
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

--------------------------------------------------------------

entity somador is

port(	A: 	in std_logic_vector(15 downto 0);
	B:	in std_logic_vector(15 downto 0);
	S:	out std_logic_vector(15 downto 0)
);
end somador;

--------------------------------------------------------------

architecture behavior of somador is
begin
S <= A+B;
		

end behavior;

--------------------------------------------------------------
