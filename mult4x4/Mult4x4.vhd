library IEEE;
use IEEE.std_logic_1164.all;

entity Mult4x4 is
port (
	a,b: in std_logic_vector (3 downto 0);
	res: out std_logic_vector (7 downto 0)
);	
end Mult4x4;

architecture Beh of Mult4x4 is

    component Fulladd is
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
	
	signal s1 : std_logic;
	signal c1, c2 : std_logic;

begin
	
	
	U0: HalfAdd port map (a, b, c1, s1);
	U1: HalfAdd port map (s1, ci, c2, s);
	co<= (c1 or c2);
		
	
end Beh;