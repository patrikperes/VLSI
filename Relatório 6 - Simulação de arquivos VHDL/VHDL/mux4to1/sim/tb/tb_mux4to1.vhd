---------------------------------------------------------------
-- Testbench para o flip-flop tipo T
---------------------------------------------------------------

Library ieee;
use ieee.std_logic_1164.all;	   
use ieee.std_logic_arith.all;
use work.all;

entity tb_mux4to1 is			-- entity declaration
end tb_mux4to1;

----------------------------------------------------------------

architecture arq_tb of tb_mux4to1 is

component mux4to1 is

port(   a : in STD_LOGIC;
        b : in STD_LOGIC;
        c : in STD_LOGIC;
        d : in STD_LOGIC;
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        y : out STD_LOGIC
);
end component;

signal T_a,T_b,T_c,T_d: std_logic :='0';
signal T_sel: std_logic_vector (1 downto 0) := "00";
signal T_y: std_logic;

begin

	U1: mux4to1 port map(T_a,T_b,T_c,T_d,T_sel,T_y);
	
	T_a <= not T_a after 5 ns;
	T_b <= not T_b after 10 ns;
	T_c <= not T_c after 20 ns;
	T_d <= not T_d after 40 ns;
	

	process
	begin
	wait for 80 ns;
	T_sel <= "01";
	wait for 80 ns;
	T_sel <= "10";
	wait for 80 ns;
	T_sel <= "11";
	wait for 80 ns;
	end process;

end arq_tb;

