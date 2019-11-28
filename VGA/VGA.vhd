library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity VGA is
port(
	clk: in std_logic;
	vgaBLUE, vgaRED, vgaGREEN: out std_logic_vector(7 downto 0);
	vgaHS, vgaVS: out std_logic;
	hPW, hBP, hDT, hFP: out std_logic;
	vPW, vBP, vDT, vFP: out std_logic;
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

	--signal hPW, hBP, hDT, hFP: std_logic; 
	--signal vPW, vBP, vDT, vFP: std_logic; 

	signal clkS : std_logic;
	signal vgaHSA, vgaVSA: std_logic;
	
	begin
	--El reloj de pantalla funciona a 25MHz
	U0: vga25MHz port map (clk, clkS);
	
		process(vgaHSA, vgaVSA, clkS)
			variable contadorH: integer:=0; 
			variable contadorV: integer:=0;
		begin
		
		vgaBLANK <= '1';
		vgaSYNC <= '0';
		
		vgaHS<=vgaHSA;
		vgaVS<=vgaVSA;
				
		
		
			if(rising_edge(clkS))then 
			contadorH  :=  contadorH+1;
			
			--	if(vgaHSA='1' AND vgaVSA='1') then
			 --		vgaBLUE <= "01110101"; --117
			--		vgaRED <= "00010011"; -- 19
			--		vgaGREEN <= "00110001"; -- 49
			--	else
			--		vgaBLUE <= "00000000"; 
			--		vgaRED <= "00000000"; 
			--		vgaGREEN <= "00000000"; 
			--	end if;
					
					if(contadorH < 96)then --PW
					hPW<='1';
					hBP<='0';
					hDT<='0';
					hFP<='0';
						vgaHSA <= '0';
						contadorH  :=  contadorH+1;
						contadorV  :=  contadorV;
						
						if(vgaHSA='1') then
							vgaBLUE <= "01101100"; --108
							vgaRED <= "01100001"; -- 97
							vgaGREEN <= "10111100"; -- 188
						else
							vgaBLUE <= "00000000"; 
							vgaRED <= "00000000"; 
							vgaGREEN <= "00000000"; 
						end if;
						
					elsif(contadorH < 144)then --BP
					hPW<='0';
					hBP<='1';
					hDT<='0';
					hFP<='0';
						contadorH  :=  contadorH+1;
						vgaHSA <= '1';
						contadorV  :=  contadorV;
						
							if(vgaHSA='1') then
					vgaBLUE <= "01101100"; --108
					vgaRED <= "01100001"; -- 97
					vgaGREEN <= "10111100"; -- 188
							else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
							end if;
					elsif(contadorH < 784)then --DT
					hPW<='0';
					hBP<='0';
					hDT<='1';
					hFP<='0';
						vgaHSA <= '1';
						contadorH  :=  contadorH+1;
						contadorV  :=  contadorV;
						
								if(vgaHSA='1') then
							vgaBLUE <= "01101100"; --108
							vgaRED <= "01100001"; -- 97
							vgaGREEN <= "10111100"; -- 188
								else
								vgaBLUE <= "00000000"; 
								vgaRED <= "00000000"; 
							vgaGREEN <= "00000000"; 
						end if;
					elsif(contadorH  < 800)then --FP
					hPW<='0';
					hBP<='0';
					hDT<='0';
					hFP<='1';
						vgaHSA <= '1';
						contadorH  :=  contadorH+1;
						contadorV  :=  contadorV;
						
						if(vgaHSA='1') then
					vgaBLUE <= "01101100"; --108
					vgaRED <= "01100001"; -- 97
					vgaGREEN <= "10111100"; -- 188
						else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
						end if;
						
					elsif(contadorH  = 800)then
					hPW<='0';
					hBP<='0';
					hDT<='0';
					hFP<='0';
						contadorH  :=  0;
						vgaHSA <= '0';
						contadorV  :=  contadorV+1;
						
						if(vgaHSA='1') then
					vgaBLUE <= "01101100"; --108
					vgaRED <= "01100001"; -- 97
					vgaGREEN <= "10111100"; -- 188
						else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
						end if;
						
						if(contadorV < 2)then --PW
							vgaVSA <= '0';
							contadorV:=contadorV;
							vPW<= '1'; 
							vBP<= '0';
							vDT<= '0';
							vFP<= '0';
							
								if(vgaVSA='1') then
					vgaBLUE <= "01101100"; --117
					vgaRED <= "01100001"; -- 19
					vgaGREEN <= "10111100"; -- 188
		else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
		end if;
						elsif(contadorV < 31)then --BP
							vgaVSA <= '1';
							contadorV:=contadorV;
							vPW<= '0'; 
							vBP<= '1';
							vDT<= '0';
							vFP<= '0';
							
							if(vgaVSA='1') then
					vgaBLUE <= "01101100"; --117
					vgaRED <= "01100001"; -- 19
					vgaGREEN <= "10111100"; -- 188
		else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
		end if;
						elsif(contadorV < 511)then --TD
							contadorV:=contadorV;
							vgaVSA <= '1';
							vPW<= '0'; 
							vBP<= '0';
							vDT<= '1';
							vFP<= '0';
							
							if(vgaVSA='1') then
					vgaBLUE <= "01101100"; --117
					vgaRED <= "01100001"; -- 19
					vgaGREEN <= "10111100"; -- 188
		else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
		end if;
		
						elsif(contadorV  < 521)then --FP
							contadorV:=contadorV;
							vgaVSA <= '1';
							vPW<= '0'; 
							vBP<= '0';
							vDT<= '0';
							vFP<= '1';
							
								if(vgaVSA='1') then
					vgaBLUE <= "01101100"; --117
					vgaRED <= "01100001"; -- 19
					vgaGREEN <= "10111100"; -- 188
		else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
		end if;
						elsif(contadorV  = 521)then --FP
							contadorV:=0;
							vgaVSA <= '0';
							vPW<= '0'; 
							vBP<= '0';
							vDT<= '0';
							vFP<= '0';
							
							if(vgaVSA='1') then
					vgaBLUE <= "01101100"; --117
					vgaRED <= "01100001"; -- 19
					vgaGREEN <= "10111100"; -- 188
		else
					vgaBLUE <= "00000000"; 
					vgaRED <= "00000000"; 
					vgaGREEN <= "00000000"; 
		end if;
						else
							contadorV := contadorV;
						end if;
					else
						--vgaHSA <= '0';
						--vgaVSA <= '0';
						contadorH  :=  contadorH;
						contadorV := contadorV;
					end if;		
		
						
					
			else
				contadorH:=contadorH;
				contadorV:=contadorV;
			end if;
		end process;

end architecture Beh;