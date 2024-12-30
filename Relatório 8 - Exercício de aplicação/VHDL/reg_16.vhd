--------------------------------------------------------------
-- Registrador de 16 bits com reset assincrono e enable
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

--------------------------------------------------------------

entity reg_16 is

port(	D: 	in std_logic_vector(15 downto 0);
	clk,rst,en:	in std_logic;
	Q:	out std_logic_vector(15 downto 0)
);
end reg_16;

--------------------------------------------------------------

architecture behavior of reg_16 is
begin
P1:process(clk,rst)
	begin 
	if rst = '1' then
		Q <= "0000000000000000";
	elsif clk'event and clk = '1' and en = '1' then
		Q <= D;
	end if;
end process;
		

end behavior;

--------------------------------------------------------------
