library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity div5MS is
	port (
		Fi : in std_logic;
		Fo : out std_logic 
	);
end div5MS;

architecture beh of div5MS is
	signal clk_div : std_logic;

begin
	process (Fi)
	variable cont : integer:=0;
	begin
			if rising_edge (Fi) then
				cont:= cont+1;
				if cont = 25000 then
					cont:=0;
					clk_div<= not (clk_div);
					Fo <= clk_div;
				else
					clk_div<= clk_div;
				end if;
			else
				cont:= cont;
			end if;
	end process; 
end architecture beh;