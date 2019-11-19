library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity DIV1Hz is
	port (
		lim: in integer;
		Fi : in std_logic;
		Fo : out std_logic 
	);
end entity;

architecture beh of DIV1Hz is
	signal clk_div : std_logic;

begin
	process (Fi)
	variable cont : integer:=0;
	begin

		if rising_edge (Fi) then
		cont:= cont+1;

			if cont = lim then
				cont:=0;
				clk_div<= not (clk_div);
			else
			 	clk_div<= clk_div;
			 end if;
		else
		 	cont:= cont;
		end if;
	end process; 
	Fo <= clk_div;

end architecture beh;