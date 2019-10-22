library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity CountMod6 is
	port (
		Fi : in std_logic;
		stage : out std_logic_vector(2 downto 0)
	);
end entity;

architecture beh of CountMod6 is
	signal clk_div : std_logic;

begin
	process (Fi)
	variable cont : integer:=0;
	begin

		if rising_edge (Fi) then
		cont:= cont+1;
		stage <= std_logic_vector(to_unsigned(cont, stage'length));
			if cont = 6 then
				cont:=0;
			end if;
		else
		 	cont:= cont;
		end if;
	end process; 

end architecture beh;