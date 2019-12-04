library IEEE;
use IEEE.std_logic_1164.all;

entity Anticipo is
	port (
		a,b: in std_logic;
		p,g: out std_logic
	);
end Anticipo;

architecture Beh of Anticipo is
	
	signal d: std_logic_vector(2 downto 0);

	begin 
		g <= (a and b);
		p <= (a xor b);

end Beh;