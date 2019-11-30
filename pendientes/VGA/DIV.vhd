library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE IEEE.NUMERIC_STD.ALL;

entity DIV is
	port(
		clkIn: in std_logic;
		clkOut25: out std_logic
		);
end DIV;

architecture BeH of DIV is
signal cont: integer;
signal clk: std_logic;
begin
	clkOut25<=clk;
	process(clk,cont,clkIn)
	begin
	if rising_edge(clkIn) then
			clk<= not clk;
			cont<= cont + 1;
	end if;
	end process;
end BeH;