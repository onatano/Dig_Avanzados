library ieee;
use ieee.std_logic_1164.all;

--Bianca Joselin Nuñez Buendia A01336483
--Osmar Isaid Barbeyto Wever A01171711

entity segmentos7 is
	port (a: in std_logic_vector (3 downto 0); --4 entradas
		s: out std_logic_vector (6 downto 0) -- 7 salidas
		);
end segmentos7;

architecture Beh of segmentos7 is
begin 
	process (a(0), a(1), a(2), a(3))
	variable entrada: std_logic_vector(4 downto 0);
	begin
			entrada:=a(0) & a(1) & a(2) & a(3);
			case entrada is
				when "0000" =>
					s(6 downto 0) <= "1111110";
				when "0001" =>
					s(6 downto 0) <= "0110000";
				when "0010" =>
					s(6 downto 0) <= "1101101";	
				when "0011" =>
					s(6 downto 0) <= "1111001";
				when "0100" =>
					s(6 downto 0) <= "0110011"; 
				when "0101" =>
					s(6 downto 0) <= "1011011";
				when "0110" =>
					s(6 downto 0) <= "1011111"; 
				when "0111" =>
					s(6 downto 0) <= "1110000"; 
				when "1000" =>
					s(6 downto 0) <= "1111111"; 
				when "1001" =>
					s(6 downto 0) <= "1111011"; 
           	when others =>
           		s(6 downto 0) <= "000000";
				end case;
    end process;
end Beh;