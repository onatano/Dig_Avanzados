library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity relojFUNC is
port (
	clkRTf: in std_logic; --reloj normal
	nRESETEOf: in std_logic; --SW0
	entradaOPf: in std_logic;  --enviarDATOS   SW1
	inMINf: in std_logic; --boton0
	inHORf: in std_logic; --boton1
	salidaMINUf: out std_logic_vector(6 downto 0);        --SEG0 
	salidaMINDf: out std_logic_vector(6 downto 0);        --SEG1   
	salidaHORUf: out std_logic_vector(6 downto 0);        --SEG2 
	salidaHORDf: out std_logic_vector(6 downto 0);        --SEG3  
	fondoR: out std_logic_vector(7 downto 0);
	fondoG: out std_logic_vector(7 downto 0);
	fondoB: out std_logic_vector(7 downto 0)
);
end relojFUNC;

architecture Beh of relojFUNC is

	Component relojFUNCIONA is
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
	end Component relojFUNCIONA;

	Component bcd7SEGMIN is
	port (
		nE: in std_logic;
		entradaBCD: in integer;
		salida7SEG: out std_logic_vector(6  downto 0);
		salida7SEGD: out std_logic_vector(6  downto 0)
	);
	end Component;

	Component bcd7SEGHOR is
	port (
		nENTRADA: in std_logic;
		entradaBCDHOR: in integer;
		salida7SEGHOR: out std_logic_vector(6  downto 0);
		salida7SEGHORD: out std_logic_vector(6  downto 0)
	);
	end Component bcd7SEGHOR;

	signal minutosCOMPF, horasCOMPF: integer:=0;

begin

	U0: relojFUNCIONA port map (clkRTf,nRESETEOf,entradaOPf,inMINf,inHORf,minutosCOMPF,horasCOMPF,fondoR,fondoG,fondoB);
	U1: bcd7SEGMIN port map (nRESETEOf,minutosCOMPF,salidaMINUf,salidaMINDf);
	U2: bcd7SEGHOR port map (nRESETEOf,horasCOMPF,salidaHORUf,salidaHORDf);
	
end architecture Beh;