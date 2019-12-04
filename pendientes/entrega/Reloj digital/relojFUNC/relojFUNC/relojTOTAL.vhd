library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--RELOJ CUENTA

entity relojTOTAL is
port (
	clkINS: in std_logic;
	nRes: in std_logic;
--	entradaOP: in std_logic; --CHECAR SI ES MEJOR EL BOTON
--	minutosENTRADA: in integer;
--	horasENTRADA: in integer; --NUEVOS
	minutos, horas: out integer
);
end relojTOTAL;

architecture Beh of relojTOTAL is
	
	Component divisor60SEG is
		port (
			Fi : in std_logic;
			nRst: in std_logic;
			Fo : out std_logic 
		);
	end Component divisor60SEG;

	signal clkSEG: std_logic;
	signal sumarMIN, sumarHOR: integer:=0;
	signal contadorSEG, contadorMIN, contadorHOR: integer:=0;

	begin
	U0: divisor60SEG port map (clkINS, nRes, clkSEG);

	process(nRes, clkSEG)
		begin
			if(nRes='1')then

				if(rising_edge(clkSEG))then
					contadorSEG <= contadorSEG+1;
						  
					if(contadorSEG=59)then
						contadorSEG <= 0;
						contadorMIN <= contadorMIN+1+sumarMIN;
						
						if(contadorMIN=59)then
							contadorMIN <= 0;
							contadorHOR<=contadorHOR+1+sumarHOR;
							
							if(contadorHOR=23)then
								contadorHOR<=0;
							else
								contadorHOR<=contadorHOR+1;
							end if;
					
						else
							contadorMIN <=contadorMIN+1;
						end if;
						
					else
						contadorSEG <= contadorSEG+1;  
					end if;
					
				else
					contadorSEG <= contadorSEG;
				end if;
			
			else 
				contadorSEG <= 0;
				contadorMIN <= 0;
				contadorHOR <= 0;
			end if;
	end process;
	
	minutos <= contadorMIN;
	horas <= contadorHOR;
	
end architecture Beh;


--Falta poner en que numero inicia