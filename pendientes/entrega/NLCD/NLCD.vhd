library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity NLCD is
port(
	clk: in std_logic;  --Nuevo de 1K
	enableS, rS, rW: out std_logic;
	dB: out std_logic_vector(7 downto 0);
	lcdBlon: out std_logic;
	bcdON:out std_logic;
	T: out std_logic
	);
end NLCD;

architecture Beh of NLCD is
	type FSM is (Estado0, Estado1, Estado2, Estado3, Estado4, Estado5, Estado6); 
	signal current_state: FSM;

	Component div5MS is
	port (
		Fi : in std_logic;
		Fo : out std_logic 
	);
	end Component div5MS;

	signal s1 : std_logic;

begin
	U0: div5MS port map (clk, s1);
	lcdBlon <= '1';
	bcdON  <= '1';
	process (s1, current_state)
	begin
		if (rising_edge(s1)) then
			case current_state is
				when Estado0  => 
					enableS<='1';	
					rS <= '0';
					rW <= '0';
					dB <= "00111000";--Ultimos dos dont care
					T <= '0';
					current_state <= Estado1;
				when Estado1 => 
					enableS<='0';	
					rS <= '0';
					rW <= '0';
					dB <= "00111000";--Ultimos dos dont care
					T <= '0';
					current_state <= Estado2;
				when Estado2  => 
					enableS<='1';	
					rS <= '0';
					rW <= '0';
					dB <= "00001111";
					T <= '0';
					current_state <= Estado3;
				when Estado3 => 
					enableS<='0';	
					rS <= '0';
					rW <= '0';
					dB <= "00001111";
					T <= '0';
					current_state <= Estado4;
				when Estado4  => 
					enableS<='1';	
					rS <= '0';
					rW <= '0';
					dB <= "00000001";
					T <= '0';
					current_state <= Estado5;
				when Estado5 => 
					enableS<='0';	
					rS <= '0';
					rW <= '0';
					dB <= "00000001";
					T <= '1';
					current_state <= current_state;
				when others => 
					enableS<='0';	
					rS <= '0';
					rW <= '0';
					dB <= "00000000";
					T <= '0';
					current_state <= Estado0;
			end case;
		else 
			current_state <= current_state;
		end if;
	end process;
end Beh;

