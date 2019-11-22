library IEEE;
use IEEE.std_logic_1164.all;

entity AddAnti is
    port (
        a,b,Cin: in std_logic;
        Cout,s: out std_logic
    );	
end AddAnti;

architecture Beh of AddAnti is

    component Anticipo is
        port (
            a,b: in std_logic;
            p,g: out std_logic
        );
    end component;
    
    signal p,g: std_logic;

begin
	
	
	U0: Anticipo port map (a, b, p, g);
	s <= (p xor Cin);
	Cout <= (g or (p and Cin));
		
	
end Beh;