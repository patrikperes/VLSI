----------------------------------------------
-- Registrador de 32 bits com reset assincrono	
----------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.all;

---------------------------------------------

entity reg is

port(	D: 	in std_logic_vector(31 downto 0);
	clk,rst:	in std_logic;
	Q:	out std_logic_vector(31 downto 0)
);
end reg;

-------------------------------------------

architecture behavior of reg is
begin
P1:process(clk,rst)
	begin 
	if rst = '1' then
		Q <= "00000000000000000000000000000000";
	elsif clk'event and clk = '1' then
		Q <= D;
	end if;
end process;
		

end behavior;

--------------------------------------------
