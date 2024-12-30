---------------------------------------
-- Testbench para o UAL_reg-32
---------------------------------------

Library ieee;
use ieee.std_logic_1164.all;	   
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity tb_UAL_reg is	-- entity declaration
end tb_UAL_reg;

---------------------------------------

architecture arq_tb of tb_UAL_reg is

component UAL_reg is

port(	A: 		in std_logic_vector(31 downto 0);
	sel: 		in std_logic_vector(1 downto 0);
	rst,clk:	in std_logic;
	S:		out std_logic_vector(31 downto 0)
);
end component;

signal T_clk,T_rst: std_logic:= '1';
signal T_sel: std_logic_vector(1 downto 0):= "00";
signal T_A: std_logic_vector(31 downto 0):="00000000000000000000000000000001";
signal T_S: std_logic_vector(31 downto 0);
signal fim : boolean :=false;         -- para terminar a simulação

begin

	U1: UAL_reg port map(T_A,T_sel,T_rst,T_clk,T_S);
	
	T_clk <= not T_clk after 5 ns;		-- gera o sinall de clock
	T_rst <= '1','0' after 17 ns;		-- gera o sinal de reset

	process
	begin
		T_sel <= "00";
		T_A <= "00000000000000000000000000000001";	
		wait for 55 ns;     
		T_sel <= "01";
		T_A <= "10000000000000000000000000000000";
		wait for 50 ns;
		T_sel <= "10";
		T_A <= "11000000000000000000000000000011";
		wait for 55 ns;
		T_sel <="11";
		T_A <= "11000000000000000000000000000011";
		wait for 50 ns;
	end process;

end arq_tb;

