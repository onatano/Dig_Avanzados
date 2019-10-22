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
	signal cont : std_logic_vector (2 downto 0):= "000";

begin
	process (Fi)
	begin
		if rising_edge (Fi) then
			cont <= cont+1;
		end if;
	end process;
	stage <= cont;

end architecture beh;