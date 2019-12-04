library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

--Reloj de 1 minuto

entity divisor60SEG is
	port (
		Fi : in std_logic;
		nRst: in std_logic;
		Fo : out std_logic 
	);
end divisor60SEG;

architecture Beh of divisor60SEG is
	signal clk_div : std_logic;

begin
	process (Fi)
	variable cont : integer:=0;
	begin
		if(nRst='1') then
			if rising_edge (Fi) then
				cont:= cont+1;
				if cont = 150000  then                  --CAMBIAR A 1 SEGUNDO
					cont:=0;
					clk_div<= not (clk_div);
					Fo <= clk_div;
				else
					clk_div<= clk_div;
				end if;
			else
				cont:= cont;
			end if;
		else 
			cont:= 0;
			Fo <= '0';
		end if;
	end process; 
	
end architecture Beh;
--AHORA
--25000000
--ANTES
--1500000000