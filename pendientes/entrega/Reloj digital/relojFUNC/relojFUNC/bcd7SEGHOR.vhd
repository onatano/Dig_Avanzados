library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd7SEGHOR is
port (
	nENTRADA: in std_logic;
	entradaBCDHOR: in integer;
	salida7SEGHOR: out std_logic_vector(6  downto 0);
	salida7SEGHORD: out std_logic_vector(6  downto 0)
);
end bcd7SEGHOR;

architecture Beh of bcd7SEGHOR is

signal resta: integer;

begin 
	process (nENTRADA, entradaBCDHOR)
	begin
		if nENTRADA='1' then
			if(entradaBCDHOR < 10)then
				salida7SEGHORD <= "1000000";
				resta <= entradaBCDHOR-0;
				case resta is
						when 0 =>
							salida7SEGHOR <= ("1000000"); 
						when 1 =>
							salida7SEGHOR <= ("1111001");
						when 2 =>
							salida7SEGHOR <= ("0100100"); 
						when 3 =>
							salida7SEGHOR <= ("0110000");
						when 4 =>
							salida7SEGHOR <= ("0011001"); 
						when 5 =>
							salida7SEGHOR <= ("0010010");
						when 6 =>
							salida7SEGHOR <= ("0000010"); 
						when 7 =>
							salida7SEGHOR <= ("1111000");
						when 8 =>
							salida7SEGHOR <= ("0000000"); 
						when 9 =>
							salida7SEGHOR <= ("0011000");
		           	when others =>
		           		salida7SEGHOR <= ("1000000");
		        	end case;

			elsif (entradaBCDHOR < 20 ) then
				salida7SEGHORD <= "1111001";
				resta <= entradaBCDHOR-10;
					case resta is
						when 0 =>
							salida7SEGHOR <= ("1000000"); 
						when 1 =>
							salida7SEGHOR <= ("1111001");
						when 2 =>
							salida7SEGHOR <= ("0100100"); 
						when 3 =>
							salida7SEGHOR <= ("0110000");
						when 4 =>
							salida7SEGHOR <= ("0011001"); 
						when 5 =>
							salida7SEGHOR <= ("0010010");
						when 6 =>
							salida7SEGHOR <= ("0000010"); 
						when 7 =>
							salida7SEGHOR <= ("1111000");
						when 8 =>
							salida7SEGHOR <= ("0000000"); 
						when 9 =>
							salida7SEGHOR <= ("0011000");
		           	when others =>
		           		salida7SEGHOR <= ("1000000");
		        	end case;
					
				elsif (entradaBCDHOR < 30 ) then
				salida7SEGHORD <= "0100100";
				resta <= entradaBCDHOR-20;
					case resta is
						when 0 =>
							salida7SEGHOR <= ("1000000"); 
						when 1 =>
							salida7SEGHOR <= ("1111001");
						when 2 =>
							salida7SEGHOR <= ("0100100"); 
						when 3 =>
							salida7SEGHOR <= ("0110000");
						when 4 =>
							salida7SEGHOR <= ("0011001"); 
						when 5 =>
							salida7SEGHOR <= ("0010010");
						when 6 =>
							salida7SEGHOR <= ("0000010"); 
						when 7 =>
							salida7SEGHOR <= ("1111000");
						when 8 =>
							salida7SEGHOR <= ("0000000"); 
						when 9 =>
							salida7SEGHOR <= ("0011000");
		           	when others =>
		           		salida7SEGHOR <= ("1000000");
		        	end case;
			else
				salida7SEGHOR <= "1000000"; 
				salida7SEGHORD <= "1000000";
			end if;
    	else
    		salida7SEGHOR <= "1111111";
        	salida7SEGHORD <= "1111111";
    	end if;
    end process;
end Beh;