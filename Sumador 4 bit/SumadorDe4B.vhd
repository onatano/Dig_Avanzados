library IEEE;
use IEEE.std_logic_1164.all;

entity SumadorDe4B is
port (
	cI: in std_logic;
	a0, a1, a2, a3: in std_logic;
	b0, b1, b2, b3: in std_logic;
	out0, out1, out2, out3: out std_logic;
	cO: out std_logic
);
end SumadorDe4B;

architecture Beh of SumadorDe4B is
	
	component FullAdd is
	port (
		A,B,Ci : in std_logic;
		Co, S : out std_logic
		);
	
	end component;

	signal c0, c1, c2: std_logic;
	
	begin
		
		U0: fullAdd port map (a0, b0, cI, c0, out0);
		U1: fullAdd port map (a1, b1, c0, c1, out1);
		U2: fullAdd port map (a2, b2, c1, c2, out2);
		U3: fullAdd port map (a3, b3, c2, cO, out3);

end Beh;