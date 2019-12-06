library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

--RELOJ CUENTA

entity relojTOTAL is
port (
	clkINS: in std_logic;
	nRes: in std_logic;
--	entradaOP: in std_logic; --CHECAR SI ES MEJOR EL BOTON
--	minutosENTRADA: in integer;
--	horasENTRADA: in integer; --NUEVOS
	minutos, horas: out integer;
	fondoR: out std_logic_vector(7 downto 0);
	fondoG: out std_logic_vector(7 downto 0);
	fondoB: out std_logic_vector(7 downto 0)
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
	signal contR,contG,contB: std_logic_vector(7 downto 0):="00000000";

	begin
	U0: divisor60SEG port map (clkINS, nRes, clkSEG);

	process(nRes, clkSEG)
		begin
			if(nRes='1')then

				if(rising_edge(clkSEG))then
					contadorSEG <= contadorSEG+1;
						  
						if(contadorMIN=59)then
							contadorMIN <= 0;
							contadorHOR<=contadorHOR+1+sumarHOR;
							contR <= contR + 1;
							contG <= contG + 1;
							contB <= contB + 1;
							
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
	
	fondoR <= contR;
	fondoG <= contG;
	fondoB <= contB;
	minutos <= contadorMIN;
	horas <= contadorHOR;
	
end architecture Beh;


--Falta poner en que numero inicia