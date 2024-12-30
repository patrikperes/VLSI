--------------------------------------------------------------
-- Registrador de 8 bits com reset assincrono, enable e shift right
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.all;

--------------------------------------------------------------

entity reg_64 is

port(	D: 			in std_logic_vector(63 downto 0);
	LSI:			in std_logic;
	clk,clear,load,shift:	in std_logic;
	Q:			out std_logic_vector(63 downto 0)
);
end reg_64;

--------------------------------------------------------------

architecture behavior of reg_64 is
signal aux: std_logic_vector(63 downto 0);
begin
P1:process(clk,clear,load,shift)
	begin 
	if clk'event and clk = '1' then
		if clear = '1' then
			aux <= (others => '0');
		elsif load = '1' then
			aux <= D ;
		elsif shift = '1' then
			aux <= LSI & aux(63 downto 1);
		end if;
	end if;
end process;
Q <= aux;

end behavior;

--------------------------------------------------------------
