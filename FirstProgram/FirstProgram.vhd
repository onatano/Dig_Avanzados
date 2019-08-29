library ieee;
use IEEE.STD_LOGIC_1164.all;

entity FirstProgram is 
	port (
		SW: in std_logic_vector(3 downto 0);
		LEDR: out std_logic_vector(3 downto 0)
	);
end FirstProgram;

architecture Beh of FirstProgram is

	--component HalfAdder is
		--port(
			--a,b: in std_logic;
			--s,cout: out std_logic
		--);
	--end component	
	
	begin
	
		--U0: HalfAdder port map (SW(0), SW(1), LEDR(0), LEDR(1));
		LEDR <= SW;
		--LDER(0) <= SW(0)
		--LDER(1) <= SW(1)
		--LDER(2) <= SW(2)
		--LDER(3) <= SW(3)
		
end Beh;