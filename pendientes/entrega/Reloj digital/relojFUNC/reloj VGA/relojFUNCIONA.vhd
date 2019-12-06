library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity relojFUNCIONA is
port (
	clkRT: in std_logic; --reloj normal
	nRESETEO: in std_logic; --SW0
	entradaOP: in std_logic;  --enviarDATOS   SW1
	inMIN: in std_logic; --boton0
	inHOR: in std_logic; --boton1
	minutosCOMPUESTO, horasCOMPUESTO: out integer;
	fondoR: out std_logic_vector(7 downto 0);
	fondoG: out std_logic_vector(7 downto 0);
	fondoB: out std_logic_vector(7 downto 0)
);
end relojFUNCIONA;

architecture Beh of relojFUNCIONA is

	Component relojTOTAL is
	port (
		clkINS: in std_logic;
		nRes: in std_logic;
		minutos, horas: out integer;
		fondoR: out std_logic_vector(7 downto 0);
		fondoG: out std_logic_vector(7 downto 0);
		fondoB: out std_logic_vector(7 downto 0)
	);
	end Component relojTOTAL;

	Component fijarHora is
	port(
			nRst: in std_logic; --SW
			entradaMIN: in std_logic;
			salidaMIN: out integer
		);
	end Component fijarHora;

	Component fijarHora2 is
		port(
			nRst: in std_logic;
			entradaHOR: in std_logic;
			salidaHOR: out integer
		);
	end Component fijarHora2;

	signal minC,  horC: integer;
	signal contCM, contCH: integer:=0;
	

	begin

	U0: relojTOTAL port map (clkRT,nRESETEO,minC,horC,fondoR,fondoG,fondoB);
	U1: fijarHora port map (nRESETEO,inMIN,contCM);
	U2: fijarHora2 port map (nRESETEO,inHOR,contCH);
	
	process(nRESETEO, entradaOP, minC,horC)
	variable contCMf, contCHf: integer:=0;
		begin
		if(nRESETEO='1')then
			if(entradaOP='1')then                  --RECIBE DATOS
				contCMf :=  minC+contCM;
				contCHf := horC+contCH;
				
					if(contCMf>59)then
						contCMf := 0;
					else
						contCMf :=contCMf;
					end if;
					
					if(contCHf>23)then
						contCHf:=0;
					else
						contCHf:=contCHf;
					end if;
					
			else
				contCMf := minC;
				contCHf := horC;
			end if;
			
			
		else
			contCMf := 0;
			contCHf := 0;
		end if;
		
	minutosCOMPUESTO <= contCMf;
	horasCOMPUESTO <= contCHf;
	
	end process;
	
end architecture Beh;