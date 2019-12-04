library IEEE;
use IEEE.std_logic_1164.all;

entity Anticipo_4bit is
	port (
		a,b: in std_logic_vector (3 downto 0);
		Cin: in std_logic;
		c,p: out std_logic_vector (3 downto 0)
	);
end Anticipo_4bit;

architecture Beh of Anticipo_4bit is
	
	component Anticipo is
		port (
			a,b: in std_logic;
			p,g: out std_logic
		);
	end component;

	signal d,g: std_logic_vector(3 downto 0);

	begin 
		
	U0: Anticipo port map (a(0),b(0),d(0),g(0));
	U1: Anticipo port map (a(1),b(1),d(1),g(1));
	U2: Anticipo port map (a(2),b(2),d(2),g(2));
	U3: Anticipo port map (a(3),b(3),d(3),g(3));

	c(0) <= (g(0) or (d(0) and Cin));
	c(1) <= (g(1) or (d(1) and g(0)) or (d(1) and d(0) and Cin));
	c(2) <= (g(2) or (d(2) and g(1)) or (d(2) and d(1) and g(0)) or (d(2) and d(1) and d(0) and Cin));
	c(3) <= (g(3) or (d(3) and g(2)) or (d(3) and d(2) and g(1)) or (d(3) and d(2) and d(1) and g(0)) or (d(3) and d(2) and d(1) and d(0) and Cin));
	p <= d;

end Beh;