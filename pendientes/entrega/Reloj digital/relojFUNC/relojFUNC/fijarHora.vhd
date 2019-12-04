library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

--BOTONES PARA FIJAR MINUTOS

entity fijarHora is
	port(
		nRst: in std_logic; --SW
		entradaMIN: in std_logic;
		salidaMIN: out integer
	);
end fijarHora;

architecture Beh of fijarHora is

	signal contadorMIN: integer:=0;
	begin
	
	process(nRst, entradaMIN)
		begin
			if(nRst='0')then
				contadorMIN <= 0;
				salidaMIN <= 0;
			elsif(contadorMIN=60)then
					contadorMIN<= 0;	
			else 
				if (falling_edge(entradaMIN)) then
					contadorMIN <= contadorMIN + 1;
				else
					contadorMIN <= contadorMIN;
				end if;
				salidaMIN <= contadorMIN;
			end if;
	end process;
end Beh;	

