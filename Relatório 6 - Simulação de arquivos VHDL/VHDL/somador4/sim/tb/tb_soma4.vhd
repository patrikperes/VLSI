---------------------------------------------------------------
-- Testbench para o somador de 4 bits
---------------------------------------------------------------

Library ieee;
use ieee.std_logic_1164.all;	   
use ieee.std_logic_arith.all;
use work.all;
use ieee.std_logic_unsigned.all;

entity tb_soma4 is			-- entity declaration
end tb_soma4;

----------------------------------------------------------------

architecture arq_tb of tb_soma4 is

component soma4 is
port(   A:      in unsigned(3 downto 0);
        B:      in unsigned(3 downto 0);
        S:      out unsigned(4 downto 0)
);
end component;

signal sA,sB: unsigned(3 downto 0);
signal sS: unsigned(4 downto 0);

begin

	U1: soma4 port map(sA,sB,sS);
	

	process
	begin

	--for i in 0 to 15 loop
	--	for j in 0 to 15 loop
	--		A <= std_logic_vector(to_unsigned(i,4));
	--		B <= std_logic_vector(to_unsigned(j,4));
	--		wait for 10 ns;
	--	end loop;
	--end loop;
	
	sA<="0010";
	sB<="0100";
        wait for 20 ns;

	sA<="0101";
	sB<="0010";
        wait for 20 ns;

	sA<="1100";
	sB<="0011";
        wait for 20 ns;

	sA<="0111";
	sB<="1001";
        wait for 20 ns;

	sA<="1101";
	sB<="0010";
        wait for 20 ns;

	sA<="1000";
	sB<="1011";
        wait for 20 ns;

	end process;

end arq_tb;

