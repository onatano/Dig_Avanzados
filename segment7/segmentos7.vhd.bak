library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity segmentos7 is
	port (a: in std_logic_vector (3 downto 0); --4 entradas
		s: out std_logic_vector (6 downto 0) -- 7 salidas
		);
end segmentos7;

architecture Beh of segmentos7 is
begin 
	process (a(0), a(1), a(2), a(3))
	variable entrada: std_logic_vector(3 downto 0);
	begin
			entrada:=a(0) & a(1) & a(2) & a(3);
			case entrada is
				when "0000" =>
					s(6 downto 0) <= "1000000";
				when "0001" =>
					s(6 downto 0) <= "1111001";
				when "0010" =>
					s(6 downto 0) <= "0100100";	
				when "0011" =>
					s(6 downto 0) <= "0110000"; 
				when "0100" =>
					s(6 downto 0) <= "0011001"; 
				when "0101" =>
					s(6 downto 0) <= "0010010"; 
				when "0110" =>
					s(6 downto 0) <= "0000010"; 
				when "0111" =>
					s(6 downto 0) <= "1111000"; 
				when "1000" =>
					s(6 downto 0) <= "0000000"; 
				when "1001" =>
					s(6 downto 0) <= "0010000"; 
           	when others =>
           		s(6 downto 0) <= "0101010";
				end case;
    end process;
end Beh;