library IEEE;
use IEEE.std_logic_1164.all;

entity halfAdderB is
port (
	x,y: in std_logic;
	c,s: out std_logic
);
	
end entity halfAdderB;

architecture Beh of halfAdderB is

begin
	c<= (x and y);
	s<= (x xor y);
end Beh;