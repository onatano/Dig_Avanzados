library IEEE;
use IEEE.std_logic_1164.all;

entity SumAnti_4bit is
	port (
		a,b: in std_logic_vector (3 downto 0);
		Cin: in std_logic;
        s: out std_logic_vector (3 downto 0);
        Cout: out std_logic
	);
end SumAnti_4bit;

architecture Beh of SumAnti_4bit is
	
	component Anticipo_4bit is
		port (
            a,b: in std_logic_vector (3 downto 0);
            Cin: in std_logic;
            c,p: out std_logic_vector (3 downto 0)
	    );
	end component;
    
    signal c,p: std_logic_vector (3 downto 0);

	begin 
		
    U0: Anticipo_4bit port map (a,b,Cin,c,p);
    s(0) <= (p(0) xor Cin);
    s(1) <= (p(1) xor c(0));
    s(2) <= (p(2) xor c(1));
    s(3) <= (p(3) xor c(2));
    Cout <= c(3);

end Beh;