library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity VGA is
port(
	clk: in std_logic;
	num_horu, num_minu, num_mind, num_hord : in std_logic_vector (6 downto 0);
	vgaBLUE, vgaRED, vgaGREEN: out std_logic_vector(7 downto 0);
	vgaHS, vgaVS: out std_logic;
	clkvga: out std_logic;
	vgaBLANK, vgaSYNC: out std_logic
	);
end VGA;

architecture Beh of VGA is

	Component vga25MHz is
	port (
		Fi : in std_logic;
		Fo : out std_logic 
	);
	end Component vga25MHz;

	component segmentos7 is
		port (a: in std_logic_vector (3 downto 0); --4 entradas
			s: out std_logic_vector (6 downto 0) -- 7 salidas
			);
	end component;
-- señales para determinar el movimiento vertical y horizontal
	signal clkS : std_logic;
	signal vgaHSA, vgaVSA: std_logic;
	signal bH, bV, aux : std_logic;
	signal tDispx, tDispy, tDisp: std_logic;
	signal hora_u, hora_d, min_u, min_d: std_logic_vector(6 downto 0);
    signal R_aux, G_aux, B_aux: std_logic_vector(7 downto 0);
	
	begin

	hora_u <= num_horu;
	hora_d <= num_hord;
	min_u <= num_minu;
	min_d <= num_mind;

	--El reloj de pantalla funciona a 25MHz
	U0: vga25MHz port map (clk, clkS);
	clkvga<=clkS;


		process(clkS, vgaHSA, vgaVSA, hora_u, hora_d, min_u, min_d, tDispy, tDispx)
			variable contadorH: integer:=0; 
			variable contadorV: integer:=0;
		begin
		
		vgaBLANK <= '1';
		vgaSYNC <= '0';
					
			if(rising_edge(clkS))then -- estados para la calibracion horizontal y bandera de estado que indica que estamos la zona para imprimir el fotograma
			contadorH  :=  contadorH+1;
		
					if(contadorH < 96)then --PW
						vgaHSA <= '0';	
						bh<='0' ;
						
					elsif(contadorH < 144)then --BP
						bh<='0';						
						vgaHSA <= '1';
						
					elsif(contadorH < 784)then --DT
						bh<='1';
						vgaHSA <= '1';
				
					elsif(contadorH  < 799)then --FP
						bh<='0'; 
						vgaHSA <= '1';
						
					elsif(contadorH  = 799)then
						bh<='0';
						contadorH  :=  0;
						vgaHSA <= '1';
						contadorV  :=  contadorV+1;

					end if;
					
					-- estados para la calibracion vertical y bandera de estado que indica que estamos en la zona para imprimir el fotograma
					if(contadorV < 2)then --PW
						vgaVSA <= '0';
						bV<='0';

					elsif(contadorV < 31)then --BP
						vgaVSA <= '1';
						bV<='0';
					elsif(contadorV < 511)then --TD
						bV<='1';
						vgaVSA <= '1';
						
							
					elsif(contadorV  < 520)then --FP
						vgaVSA <= '1';
						bV<='0';
							
					elsif(contadorV  = 520)then --FP
						contadorV:=0;
						vgaVSA <= '1';
						bV<='0';
					else
						contadorV := contadorV;
					end if;				
			else
				contadorH:=contadorH;
				contadorV:=contadorV;
			end if;




			-- PRIMER SEGMENTO -- DECENAS HORAS posicion vertical VS posicion horizontal con una entrada de activacion de cada funcion para un funcionamiento similar al 7 segmentos
			
			if ((contadorH > 209 and contadorH < 269) and (contadorV > 71 and contadorV < 91) and (hora_d(6) = '1')) then -- a1
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 249 and contadorH < 269) and (contadorV > 91 and contadorV < 151) and (hora_d(5) = '1')) then -- b1
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 249 and contadorH < 269) and (contadorV > 151 and contadorV < 211) and (hora_d(4) = '1')) then -- c1
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 209 and contadorH < 269) and (contadorV > 211 and contadorV < 231) and (hora_d(3) = '1')) then -- d1
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 209 and contadorH < 229) and (contadorV > 151 and contadorV < 211) and (hora_d(2) = '1')) then -- e1
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 209 and contadorH < 229) and (contadorV > 91 and contadorV < 151) and (hora_d(1) = '1')) then -- f1
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 229 and contadorH < 249) and (contadorV > 141 and contadorV < 161) and (hora_d(0) = '1')) then -- g1
				tDispx <= '1';
				tDispy <= '1';
				
			
			
			
			
			-- Segundo segmento -- UNIDADES HORAS posicion vertical VS posicion horizontal con una entrada de activacion de cada funcion para un funcionamiento similar al 7 segmentos
			
			elsif ((contadorH > 314 and contadorH < 374) and (contadorV > 71 and contadorV < 91) and (hora_u(6) = '1')) then -- a2
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 354 and contadorH < 374) and (contadorV > 91 and contadorV < 151) and (hora_u(5) = '1')) then -- b2
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 354 and contadorH < 374) and (contadorV > 151 and contadorV < 211) and (hora_u(4) = '1')) then -- c2
				tDispx <= '1';
				tDispy <= '1';
			
			elsif ((contadorH > 314 and contadorH < 374) and (contadorV > 211 and contadorV < 231) and (hora_u(3) = '1')) then -- d2
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 314 and contadorH < 334) and (contadorV > 151 and contadorV < 211) and (hora_u(2) = '1')) then -- e2
				tDispx <= '1';
				tDispy <= '1';
			
			elsif ((contadorH > 314 and contadorH < 334) and (contadorV > 91 and contadorV < 151) and (hora_u(1) = '1')) then -- f2
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 334 and contadorH < 354) and (contadorV > 141 and contadorV < 161) and (hora_u(0) = '1'))then -- g2
				tDispx <= '1';
				tDispy <= '1';
				
			
			
					

				-- Tercer segmento -- DECENAS MIN posicion vertical VS posicion horizontal con una entrada de activacion de cada funcion para un funcionamiento similar al 7 segmentos
			
			elsif ((contadorH > 544 and contadorH < 604) and (contadorV > 71 and contadorV < 91) and (min_d(6) = '1')) then -- a3
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 584 and contadorH < 604) and (contadorV > 91 and contadorV < 151) and (min_d(5) = '1')) then -- b3
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 584 and contadorH < 604) and (contadorV > 151 and contadorV < 211) and (min_d(4) = '1')) then -- c3
				tDispx <= '1';
				tDispy <= '1';
			
			elsif ((contadorH > 544 and contadorH < 604) and (contadorV > 211 and contadorV < 231) and (min_d(3) = '1')) then -- d3
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 544 and contadorH < 564) and (contadorV > 151 and contadorV < 211) and (min_d(2) = '1')) then -- e3
				tDispx <= '1';
				tDispy <= '1';
			
			elsif ((contadorH > 544 and contadorH < 564) and (contadorV > 91 and contadorV < 151) and (min_d(1) = '1')) then -- f3
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 564 and contadorH < 584) and (contadorV > 141 and contadorV < 161) and (min_d(0) = '1'))then -- g3
				tDispx <= '1';
				tDispy <= '1';
				




					-- Cuarto segmento -- UNIDADES MIN posicion vertical VS posicion horizontal con una entrada de activacion de cada funcion para un funcionamiento similar al 7 segmentos
		
			elsif ((contadorH > 649 and contadorH < 709) and (contadorV > 71 and contadorV < 91) and (min_u(6) = '1')) then -- a4
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 689 and contadorH < 709) and (contadorV > 91 and contadorV < 151) and (min_u(5) = '1')) then -- b4
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 689 and contadorH < 709) and (contadorV > 151 and contadorV < 211) and (min_u(4) = '1')) then -- c4
				tDispx <= '1';
				tDispy <= '1';
			
			elsif ((contadorH > 649 and contadorH < 709) and (contadorV > 211 and contadorV < 231) and (min_u(3) = '1')) then -- d4
				tDispx <= '1';
				tDispy <= '1';

			elsif ((contadorH > 649 and contadorH < 669) and (contadorV > 151 and contadorV < 211) and (min_u(2) = '1')) then -- e4
				tDispx <= '1';
				tDispy <= '1';
			
			elsif ((contadorH > 649 and contadorH < 669) and (contadorV > 91 and contadorV < 151) and (min_u(1) = '1')) then -- f4
				tDispx <= '1';
				tDispy <= '1';
				
			elsif ((contadorH > 669 and contadorH < 689) and (contadorV > 141 and contadorV < 161) and (min_u(0) = '1'))then -- g4
				tDispx <= '1';
				tDispy <= '1';
				
				-- coloca los 2 puntos entre los minutos y horas justo a la mitad de la pantalla
			elsif ((contadorH > 444 and contadorH < 474) and ((contadorV > 101 and contadorV < 131)  or (contadorV > 171 and contadorV < 201)))then -- :
				tDispx <= '1';
				tDispy <= '1';
				
		
			else 
				tDispx <= '0';
				tDispy <= '0';
				
			end if;
					
			
	
		end process;

			-- sincronisa el area de coloreado
		tDisp <= tDispx and tDispy and aux;
			
		   R_aux <= "11111111";-- determina el color del display antes creado
		   G_aux <= "00000000";
		   B_aux <= "00000000";
		   
			
		   vgaRED <= R_aux when tDisp = '1' else "00000000";
		   vgaGREEN <= G_aux when tDisp = '1' else "00000000";
		   vgaBLUE <= B_aux when tDisp = '1' else "00000000";



		   --  asignan las señales internas a las salidas 
		vgaHS<=vgaHSA;
		vgaVS<=vgaVSA;
		
		aux <= '1' when (bV='1' AND bh='1') else '0'; -- indica cuando cambiar de color para dibujar los 7 segmentos
		
end architecture Beh;