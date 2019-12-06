library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reloj_vga is
port (
	clok: in std_logic;
	clkRTf: in std_logic; --reloj normal
	nRESETEOf: in std_logic; --SW0
	entradaOPf: in std_logic;  --enviarDATOS   SW1
	inMINf: in std_logic; --boton0
	inHORf: in std_logic; --boton1
	vgaBLUE, vgaRED, vgaGREEN: out std_logic_vector(7 downto 0); -- salidas para el VGA
	vgaHS, vgaVS: out std_logic;
	clkvga: out std_logic;
	vgaBLANK, vgaSYNC: out std_logic
);
	
end entity;

architecture beh of reloj_vga is
	component VGA is -- se importa el componente para visualizar el VGA
		port (
			clk: in std_logic;
			num_horu, num_minu, num_mind, num_hord : in std_logic_vector (6 downto 0);
			fondoR, fondoG, fondoB: in std_logic_vector(7 downto 0);
			vgaBLUE, vgaRED, vgaGREEN: out std_logic_vector(7 downto 0);
			vgaHS, vgaVS: out std_logic;
			clkvga: out std_logic;
			vgaBLANK, vgaSYNC: out std_logic
		);
	end component VGA;

	component relojFUNC is -- importa el componente de toda la logica del reloj digital
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
	end component relojFUNC;

	signal minuni, mindec, horuni, hordec: std_logic_vector (6 downto 0);
	signal fondoR, fondoG, fondoB: std_logic_vector(7 downto 0);

begin
		-- se hace la interconeccion entre ambos componentes 
	U0: VGA port map (clok,horuni,minuni,mindec,hordec,fondoR,fondoG,fondoB,vgaBLUE,vgaRED,vgaGREEN,vgaHS,vgaVS,clkvga,vgaBLANK,vgaSYNC);
	U1: relojFUNC port map (clkRTf,nRESETEOf,entradaOPf,inMINf,inHORf,minuni,mindec,horuni,hordec,fondoR,fondoG,fondoB);
end architecture beh;