library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

--BOTONES PARA FIJAR HORAS

entity fijarHora2 is
	port(
		nRst: in std_logic;
		entradaHOR: in std_logic;
		salidaHOR: out integer
	);
end fijarHora2;

architecture Beh of fijarHora2 is

	signal contadorHOR: integer:=0;
begin
	
	process(nRst, entradaHOR)
		begin
			if(nRst='0')then
				contadorHOR <= 0;
				salidaHOR <= 0;
			elsif(contadorHOR=24)then
					contadorHOR<= 0;
			else			
				if(falling_edge(entradaHOR)) then
					contadorHOR <= contadorHOR + 1;
				else
					salidaHOR <= contadorHOR;
				end if;
				salidaHOR <= contadorHOR;
			end if;
	end process;
end Beh;	
