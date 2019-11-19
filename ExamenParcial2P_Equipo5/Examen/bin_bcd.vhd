library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity bin_bcd is
	port (a: in std_logic_vector (4 downto 0); --5 entradas
		s: out std_logic_vector (13 downto 0) -- 14 salidas
		);
end bin_bcd;

architecture Beh of bin_bcd is
begin 
	process (a(0), a(1), a(2), a(3), a(4))
	variable entrada: std_logic_vector(4 downto 0);
	begin
			entrada:=a;
			case entrada is
				when "00000" =>
					s(13 downto 0) <= "10000001111111";
				when "00001" =>
					s(13 downto 0) <= "11110011111111";
				when "00010" =>
					s(13 downto 0) <= "01001001111111";	
				when "00011" =>
					s(13 downto 0) <= "01100001111111";
				when "00100" =>
					s(13 downto 0) <= "00110011111111"; 
				when "00101" =>
					s(13 downto 0) <= "00100101111111";
				when "00110" =>
					s(13 downto 0) <= "00000101111111"; 
				when "00111" =>
					s(13 downto 0) <= "11110001111111"; 
				when "01000" =>
					s(13 downto 0) <= "00000001111111"; 
				when "01001" =>
					s(13 downto 0) <= "00100001111111"; 


				when "01010" =>
					s(13 downto 0) <= "10000001111001";
				when "01011" =>
					s(13 downto 0) <= "11110011111001";
				when "01100" =>
					s(13 downto 0) <= "01001001111001";	
				when "01101" =>
					s(13 downto 0) <= "01100001111001";
				when "01110" =>
					s(13 downto 0) <= "00110011111001"; 
				when "01111" =>
					s(13 downto 0) <= "00100101111001";
				when "10000" =>
					s(13 downto 0) <= "00000101111001"; 
				when "10001" =>
					s(13 downto 0) <= "11110001111001"; 
				when "10010" =>
					s(13 downto 0) <= "00000001111001"; 
				when "10011" =>
					s(13 downto 0) <= "00100001111001"; 


				when "10100" =>
					s(13 downto 0) <= "10000000100100";
				when "10101" =>
					s(13 downto 0) <= "11110010100100";
				when "10110" =>
					s(13 downto 0) <= "01001000100100";	
				when "10111" =>
					s(13 downto 0) <= "01100000100100";
				when "11000" =>
					s(13 downto 0) <= "00110010100100"; 
				when "11001" =>
					s(13 downto 0) <= "00100100100100";
				when "11010" =>
					s(13 downto 0) <= "00000100100100"; 
				when "11011" =>
					s(13 downto 0) <= "11110000100100"; 
				when "11100" =>
					s(13 downto 0) <= "00000000100100"; 
				when "11101" =>
					s(13 downto 0) <= "00100000100100"; 


				when "11110" =>
					s(13 downto 0) <= "10000000110000";
				when "11111" =>
					s(13 downto 0) <= "11110010110000";




           	when others =>
           		s(13 downto 0) <= "11111111111111";
				end case;
    end process;
end Beh;