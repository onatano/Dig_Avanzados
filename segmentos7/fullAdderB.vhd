library IEEE;
use IEEE.std_logic_1164.all;

entity fullAdderB is
port (
	A,B,Ci : in std_logic;
	Co, S : out std_logic
);
	
end fullAdderB;

architecture Beh of fullAdderB is
 
component halfAdderB is
	port (
		x,y: in std_logic;
		c,s: out std_logic
	);
	end component halfAdderB;
	
	signal s1 : std_logic;
	signal c1, c2 : std_logic;
begin
	U0: halfAdderB port map (A,B,C1,S1);
	U1: halfAdderB port map (Ci,S1,C2,S);
	Co <= (c1 or c2);
		
end Beh;