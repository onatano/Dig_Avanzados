library IEEE;
use IEEE.std_logic_1164.all;

entity SumRes is
port (
	s: in std_logic;
	a: in std_logic_vector (3 downto 0);
	b: in std_logic_vector (3 downto 0);
	o: out std_logic_vector (3 downto 0);
	cO: out std_logic
);
end SumRes;

architecture Beh of SumRes is
	
	component FullAdd is
		port (
	   a,b,ci: in std_logic;
	   co,s: out std_logic
    );
		end component;

	signal c: std_logic_vector (2 downto 0);
	signal d: std_logic_vector (3 downto 0);

	begin 
		d(0) <= (a(0) xor s);
		d(1) <= (a(1) xor s);
		d(2) <= (a(2) xor s);
		d(3) <= (a(3) xor s);
		U0: FullAdd port map (d(0), b(0), s, c(0), o(0));
		U1: FullAdd port map (d(1), b(1), c(0), c(1), o(1));
		U2: FullAdd port map (d(2), b(2), c(1), c(2), o(2));
		U3: FullAdd port map (d(3), b(3), c(2), cO, o(3));

end Beh;