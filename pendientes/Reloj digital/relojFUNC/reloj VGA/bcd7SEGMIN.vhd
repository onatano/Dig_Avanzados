library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd7SEGMIN is
port (
	nE: in std_logic;
	entradaBCD: in integer;
	salida7SEG: out std_logic_vector(6  downto 0);
	salida7SEGD: out std_logic_vector(6  downto 0)
);
end bcd7SEGMIN;

architecture Beh of bcd7SEGMIN is

signal resta: integer;

begin 
	process (nE, entradaBCD)
	begin
		if nE='1' then
			if(entradaBCD < 10)then
				salida7SEGD <= "1000000";
				resta <= entradaBCD-0;
				case resta is
						when 0 =>
							salida7SEG <= ("1000000"); 
						when 1 =>
							salida7SEG <= ("1111001");
						when 2 =>
							salida7SEG <= ("0100100"); 
						when 3 =>
							salida7SEG <= ("0110000");
						when 4 =>
							salida7SEG <= ("0011001"); 
						when 5 =>
							salida7SEG <= ("0010010");
						when 6 =>
							salida7SEG <= ("0000010"); 
						when 7 =>
							salida7SEG <= ("1111000");
						when 8 =>
							salida7SEG <= ("0000000"); 
						when 9 =>
							salida7SEG <= ("0011000");
		           	when others =>
		           		salida7SEG <= ("1000000");
		        	end case;
				
			elsif(entradaBCD < 20 )then --10
				salida7SEGD <= "1111001";
				resta <= entradaBCD-10;
					case resta is
						when 0 =>
							salida7SEG <= ("1000000"); 
						when 1 =>
							salida7SEG <= ("1111001");
						when 2 =>
							salida7SEG <= ("0100100"); 
						when 3 =>
							salida7SEG <= ("0110000");
						when 4 =>
							salida7SEG <= ("0011001"); 
						when 5 =>
							salida7SEG <= ("0010010");
						when 6 =>
							salida7SEG <= ("0000010"); 
						when 7 =>
							salida7SEG <= ("1111000");
						when 8 =>
							salida7SEG <= ("0000000"); 
						when 9 =>
							salida7SEG <= ("0011000");
		           	when others =>
		           		salida7SEG <= ("1000000");
		        	end case;

			elsif (entradaBCD < 30 ) then --20
				salida7SEGD <= "0100100";
				resta <= entradaBCD-20;
					case resta is
						when 0 =>
							salida7SEG <= ("1000000"); 
						when 1 =>
							salida7SEG <= ("1111001");
						when 2 =>
							salida7SEG <= ("0100100"); 
						when 3 =>
							salida7SEG <= ("0110000");
						when 4 =>
							salida7SEG <= ("0011001"); 
						when 5 =>
							salida7SEG <= ("0010010");
						when 6 =>
							salida7SEG <= ("0000010"); 
						when 7 =>
							salida7SEG <= ("1111000");
						when 8 =>
							salida7SEG <= ("0000000"); 
						when 9 =>
							salida7SEG <= ("0011000");
		           	when others =>
		           		salida7SEG <= ("1000000");
		        	end case;

			elsif (entradaBCD < 40 ) then --30
				salida7SEGD <= "0110000";
				resta <= entradaBCD-30;
					case resta is
						when 0 =>
							salida7SEG <= ("1000000"); 
						when 1 =>
							salida7SEG <= ("1111001");
						when 2 =>
							salida7SEG <= ("0100100"); 
						when 3 =>
							salida7SEG <= ("0110000");
						when 4 =>
							salida7SEG <= ("0011001"); 
						when 5 =>
							salida7SEG <= ("0010010");
						when 6 =>
							salida7SEG <= ("0000010"); 
						when 7 =>
							salida7SEG <= ("1111000");
						when 8 =>
							salida7SEG <= ("0000000"); 
						when 9 =>
							salida7SEG <= ("0011000");
		           	when others =>
		           		salida7SEG <= ("1000000");
		        	end case;

			elsif (entradaBCD < 50 ) then
				salida7SEGD <= "0011001";
				resta <= entradaBCD-40;
					case resta is
						when 0 =>
							salida7SEG <= ("1000000"); 
						when 1 =>
							salida7SEG <= ("1111001");
						when 2 =>
							salida7SEG <= ("0100100"); 
						when 3 =>
							salida7SEG <= ("0110000");
						when 4 =>
							salida7SEG <= ("0011001"); 
						when 5 =>
							salida7SEG <= ("0010010");
						when 6 =>
							salida7SEG <= ("0000010"); 
						when 7 =>
							salida7SEG <= ("1111000");
						when 8 =>
							salida7SEG <= ("0000000"); 
						when 9 =>
							salida7SEG <= ("0011000");
		           	when others =>
		           		salida7SEG <= ("1000000");
		        	end case;

			elsif (entradaBCD < 60 ) then
				salida7SEGD <= "0010010";
				resta <= entradaBCD-50;
					case resta is
						when 0 =>
							salida7SEG <= ("1000000"); 
						when 1 =>
							salida7SEG <= ("1111001");
						when 2 =>
							salida7SEG <= ("0100100"); 
						when 3 =>
							salida7SEG <= ("0110000");
						when 4 =>
							salida7SEG <= ("0011001"); 
						when 5 =>
							salida7SEG <= ("0010010");
						when 6 =>
							salida7SEG <= ("0000010"); 
						when 7 =>
							salida7SEG <= ("1111000");
						when 8 =>
							salida7SEG <= ("0000000"); 
						when 9 =>
							salida7SEG <= ("0011000");
		           	when others =>
		           		salida7SEG <= ("1000000");
		        	end case;

			else
				salida7SEG <= "1000000"; 
				salida7SEGD <= "1000000";
			end if;
    	else
    		salida7SEGD <= "1111111";
        	salida7SEG <= "1111111";
    	end if;
    end process;
end Beh;