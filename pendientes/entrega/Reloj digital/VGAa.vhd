library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_1164.all;

entity VGA is
port(
    
    HS,VS,CLK_25, sync, blank:    out std_logic;
    Ro,Go,Bo    :    out     std_logic_vector(7 downto 0);
    clk   :    in        std_logic;
	 numD, numU : in std_logic_vector (6 downto 0)
    );
end entity VGA;

architecture behav of VGA is
    
    signal clk_aux, tDispy, tDispx, Hs_aux, Vs_aux, en_disp : std_logic;
    signal R_aux, G_aux, B_aux        :    std_logic_vector(7 downto 0);
	 signal lettersD, lettersU        :    std_logic_vector(6 downto 0);
	 signal cont: integer := 0;
	 signal lineas    :    integer := 0;
	 
    
begin

lettersD <= numD;
lettersU <= numU;
    
    process(clk, clk_aux)
    begin
        if rising_edge(clk) then
            clk_aux <= not(clk_aux);
        else
            clk_aux <= clk_aux;
        end if;    
    end process;
    
    process(clk_aux, cont)
    
    begin
        if rising_edge(clk_aux) then
            cont <= cont + 1;
            if cont <= 96 then
                Hs_aux <= '0';
                -- tDispx <= '0';
            elsif cont <= 144 then
                hs_aux <= '1';
                -- tDispx  <= '0';
            elsif cont <= 784 then
                Hs_aux <= '1';
            elsif cont <= 800 then
                Hs_aux <= '1';
                -- tDispx <= '0';
            else 
                HS_aux <= Hs_aux;
                cont <= 0;
            end if;
            
        else
            cont <= cont;
        end if;
    end process;
    
    process(Hs_aux, lineas)
        
    begin
        if falling_edge(HS_aux) then
            lineas <= lineas + 1;
            if lineas <= 2 then
                Vs_aux <= '0';
                -- tDispY <= '0';
            elsif lineas <= 31 then
                Vs_aux <= '1';
                -- tDispY <= '0';
            elsif lineas <= 511 then
                Vs_aux <= '1'; 
            elsif lineas <= 521 then
                Vs_aux <= '1';
                -- tDispY <= '0';
            else
                vs_aux <= Vs_aux;
                -- tDispY <= tDispy;
                lineas <= 0;
            end if;
            
        else
            lineas <= lineas;
        end if;
    end process;
	 

process (cont, lineas, lettersD, lettersU)
	begin
		-- PRIMER SEGMENTO -- DECENAS HORAS
		
		if ((cont > 209 and cont < 269) and (lineas > 71 and lineas < 91) and (lettersD(6) = '1')) then -- a1
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 249 and cont < 269) and (lineas > 91 and lineas < 151) and (lettersD(5) = '1')) then -- b1
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 249 and cont < 269) and (lineas > 151 and lineas < 211) and (lettersD(4) = '1')) then -- c1
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 209 and cont < 269) and (lineas > 211 and lineas < 231) and (lettersD(3) = '1')) then -- d1
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 209 and cont < 229) and (lineas > 151 and lineas < 211) and (lettersD(2) = '1')) then -- e1
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 209 and cont < 229) and (lineas > 91 and lineas < 151) and (lettersD(1) = '1')) then -- f1
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 229 and cont < 249) and (lineas > 141 and lineas < 161) and (lettersD(0) = '1')) then -- g1
			tDispx <= '1';
			tDispy <= '1';
			
		
		
		
		
		-- Segundo segmento -- UNIDADES HORAS
		
		elsif ((cont > 314 and cont < 374) and (lineas > 71 and lineas < 91) and (lettersU(6) = '1')) then -- a2
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 354 and cont < 374) and (lineas > 91 and lineas < 151) and (lettersU(5) = '1')) then -- b2
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 354 and cont < 374) and (lineas > 151 and lineas < 211) and (lettersU(4) = '1')) then -- c2
			tDispx <= '1';
			tDispy <= '1';
		
		elsif ((cont > 314 and cont < 374) and (lineas > 246 and lineas < 266) and (lettersU(3) = '1')) then -- d2
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 314 and cont < 344) and (lineas > 181 and lineas < 241) and (lettersU(2) = '1')) then -- e2
			tDispx <= '1';
			tDispy <= '1';
		
		elsif ((cont > 314 and cont < 344) and (lineas > 116 and lineas < 176) and (lettersU(1) = '1')) then -- f2
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 334 and cont < 354) and (lineas > 166 and lineas < 191) and (lettersU(0) = '1'))then -- g2
			tDispx <= '1';
			tDispy <= '1';
			
		
		
				

			-- DECENAS MIN
		elsif ((cont > 544 and cont < 604) and (lineas > 71 and lineas < 91) and (lettersU(6) = '1')) then -- a3
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 584 and cont < 604) and (lineas > 91 and lineas < 151) and (lettersU(5) = '1')) then -- b3
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 584 and cont < 604) and (lineas > 151 and lineas < 211) and (lettersU(4) = '1')) then -- c3
			tDispx <= '1';
			tDispy <= '1';
		
		elsif ((cont > 544 and cont < 604) and (lineas > 246 and lineas < 266) and (lettersU(3) = '1')) then -- d3
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 544 and cont < 574) and (lineas > 181 and lineas < 241) and (lettersU(2) = '1')) then -- e3
			tDispx <= '1';
			tDispy <= '1';
		
		elsif ((cont > 544 and cont < 574) and (lineas > 116 and lineas < 176) and (lettersU(1) = '1')) then -- f3
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 564 and cont < 584) and (lineas > 166 and lineas < 191) and (lettersU(0) = '1'))then -- g3
			tDispx <= '1';
			tDispy <= '1';
			




				-- UNIDADES MIN
		elsif ((cont > 649 and cont < 709) and (lineas > 71 and lineas < 91) and (lettersU(6) = '1')) then -- a4
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 689 and cont < 709) and (lineas > 91 and lineas < 151) and (lettersU(5) = '1')) then -- b4
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 689 and cont < 709) and (lineas > 151 and lineas < 211) and (lettersU(4) = '1')) then -- c4
			tDispx <= '1';
			tDispy <= '1';
		
		elsif ((cont > 649 and cont < 709) and (lineas > 246 and lineas < 266) and (lettersU(3) = '1')) then -- d4
			tDispx <= '1';
			tDispy <= '1';

		elsif ((cont > 649 and cont < 679) and (lineas > 181 and lineas < 241) and (lettersU(2) = '1')) then -- e4
			tDispx <= '1';
			tDispy <= '1';
		
		elsif ((cont > 649 and cont < 679) and (lineas > 116 and lineas < 176) and (lettersU(1) = '1')) then -- f4
			tDispx <= '1';
			tDispy <= '1';
			
		elsif ((cont > 669 and cont < 689) and (lineas > 166 and lineas < 191) and (lettersU(0) = '1'))then -- g4
			tDispx <= '1';
			tDispy <= '1';
			

		elsif ((cont > 444 and cont < 474) and (lineas > 91 and lineas < 121)  and (lineas > 181 and lineas < 211))then -- :
			tDispx <= '1';
			tDispy <= '1';
			
	
		else 
			tDispx <= '0';
			tDispy <= '0';
			
		end if;
		
end process;


	 
	 Sync <= '0';
    Blank <= '1';
    clk_25 <= clk_aux;
    Hs    <= Hs_aux;
    vs <= vs_aux;
	 
  en_disp <= tDispX and tDispY;
	
   R_aux <= "00000000";
   G_aux <= "00000000";
   B_aux <= "11000000";
   
	
   Ro <= R_aux when en_disp = '1' else "00000000";
   Go <= G_aux when en_disp = '1' else "00000000";
   Bo <= B_aux when en_disp = '1' else "00000000";
    
end architecture;