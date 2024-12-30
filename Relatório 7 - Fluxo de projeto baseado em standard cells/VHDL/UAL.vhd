----------------------------------------------
-- UAL de 32 bits, sel = 00 -> soma,  sel = 01 -> subtração, sel = 10 -> SHL, sel = 11 -> SHR		
----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.all;

---------------------------------------------
entity UAL is

port(	A: 	in std_logic_vector(31 downto 0);
	B:	in std_logic_vector(31 downto 0);
	sel: 	in std_logic_vector(1 downto 0);
	S:	out std_logic_vector(31 downto 0)
);
end UAL;

---------------------------------------------

architecture behavior of UAL is
begin
P1:process(sel,A,B)
	begin 
	case sel is
		when "00" =>
			S <= A + B;
		when "01" =>
			S <= A - B;
		when "10" =>
			S <= B(30 downto 0) & '0';
		when "11" =>
			S <= '0' & B(31 downto 1);
		when others =>
			S <= "00000000000000000000000000000000";
	end case;
end process;
		

end behavior;

----------------------------------------------