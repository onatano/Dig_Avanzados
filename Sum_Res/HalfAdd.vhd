library IEEE;
use IEEE.std_logic_1164.all;

entity HalfAdd is
port (
	x,y: in std_logic;
	c,s: out std_logic
);
	
end entity HalfAdd;

architecture Beh of HalfAdd is

begin
	c<= (x and y);
	s<= (x xor y);
end architecture Beh;