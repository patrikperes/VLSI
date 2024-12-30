---------------------------------------------------------------
-- Testbench para o flip-flop tipo T
---------------------------------------------------------------

Library ieee;
use ieee.std_logic_1164.all;	   
use ieee.std_logic_arith.all;
use work.all;

entity tb_tff is			-- entity declaration
end tb_tff;

----------------------------------------------------------------

architecture arq_tb of tb_tff is

component tff is

port(	clk: 	in std_logic;
	rst:	in std_logic;
	t:	out std_logic
);
end component;

signal T_clk,T_rst: std_logic :='0';
signal T_t: std_logic;

begin

	U1: tff port map(T_clk,T_rst,T_t);
	
	T_clk <= not T_clk after 5 ns;		-- gera o sinall de clock
	T_rst <= '1','0' after 17 ns;		-- gera o sinal de reset

	process
	begin
		wait for 120 ns;      -- Define o tempo de simulação
	end process;

end arq_tb;

