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
            a,b,Cin: in std_logic;
            p,Cout: out std_logic
        );
    end component;
	

begin
	
	
	U0: Anticipo port map (a, b, Cin, p, Cout);
	s <= (p xor Cin);
		
	
end Beh;