
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

entity Mult4x4 is
port (
	a,b: in std_logic_vector (3 downto 0);
	res: out std_logic_vector (7 downto 0)
);	
end Mult4x4;

architecture Beh of Mult4x4 is

    component FullAdd is
        port (
            a,b,ci: in std_logic;
            co,s: out std_logic
        );    
    end component;
    
    component HalfAdd is
	    port (
		    x,y: in std_logic;
		    c,s: out std_logic
	    );
	end component;
	
	component AddAnti is
		port (
			a,b,Cin: in std_logic;
			Cout,s: out std_logic
		);	
	end component;
	
	signal c: std_logic_vector (9 downto 0);
	signal s: std_logic_vector (9 downto 0);
	signal q: std_logic_vector (3 downto 0);
	signal an: std_logic_vector (14 downto 0);

begin

	U0: HalfAdd port map (an(0), an(3), c(0), s(0));
	U1: FullAdd port map (an(1), an(4), an(7), c(1), s(1));
	U2: FullAdd port map (an(5), an(8), an(11), c(2), s(2));
	U3: FullAdd port map (an(6), an(9), an(12), c(3), s(3));
	U4: HalfAdd port map (an(10), an(13), c(4), s(4));
	U5: HalfAdd port map (s(1), c(0), c(5), s(5));
	U6: FullAdd port map (an(2), c(1), s(2), c(6), s(6));
	U7: HalfAdd port map (s(3), c(2), c(7), s(7));
	U8: HalfAdd port map (s(4), c(3), c(8), s(8));
	U9: HalfAdd port map (an(14), c(4), c(9), s(9));
	U10: AddAnti port map (s(6), c(5), '0', q(0), res(3));
	U11: AddAnti port map (s(7), c(6), q(0), q(1), res(4));
	U12: AddAnti port map (s(8), c(7), q(1), q(2), res(5));
	U13: AddAnti port map (s(9), c(8), q(2), q(3), res(6));
	U14: AddAnti port map (c(9), q(3), '0', q(3), res(7));
	
	res(0) <= (a(0) and b(0));
	an(0) <= (a(1) and b(0));
	an(1) <= (a(2) and b(0));
	an(2) <= (a(3) and b(0));
	an(3) <= (a(0) and b(1));
	an(4) <= (a(1) and b(1));
	an(5) <= (a(2) and b(1));
	an(6) <= (a(3) and b(1));
	an(7) <= (a(0) and b(2));
	an(8) <= (a(1) and b(2));
	an(9) <= (a(2) and b(2));
	an(10) <= (a(3) and b(2));
	an(11) <= (a(0) and b(3));
	an(12) <= (a(1) and b(3));
	an(13) <= (a(2) and b(3));
	an(14) <= (a(3) and b(3));
	res(1) <= s(0);
	res(2) <= s(5);
	

end Beh;