library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity vga25MHz is
	port (
		Fi : in std_logic;
		Fo : out std_logic 
	);
end vga25MHz;

architecture beh of vga25MHz is
	signal clk_div : std_logic;

begin
	process (Fi)
	variable cont : integer:=0;
	begin
		if rising_edge (Fi) then
			clk_div<= not (clk_div);
		else
			clk_div<= clk_div;
		end if;
	Fo <= clk_div;
	end process; 
	
end architecture beh;