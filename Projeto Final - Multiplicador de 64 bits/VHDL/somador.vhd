--------------------------------------------------------------
-- somador de 64 bits com carry in/out	
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity somador is

port(	A: 	in std_logic_vector(63 downto 0);
	B:	in std_logic_vector(63 downto 0);
	cin:	in std_logic;
	S:	out std_logic_vector(63 downto 0);
	cout:	out std_logic
);
end somador;

--------------------------------------------------------------

architecture behavior of somador is
signal aux,cin_extended: std_logic_vector(64 downto 0);
begin
cin_extended <= (others => '0');
cin_extended(0) <= cin;
aux <= unsigned(A)+unsigned(B)+ unsigned(cin_extended);
S <= std_logic_vector(aux(63 downto 0));
cout <= aux(64);

end behavior;

--------------------------------------------------------------
