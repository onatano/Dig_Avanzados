library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity LCD_data is
port(
	clk: in std_logic;  --Nuevo de 1K
	T : in std_logic;
	send : in std_logic;
	rsin : in std_logic;
	dbin: in std_logic_vector(7 downto 0);
	enableS, rS, rW: out std_logic;
	dbout: out std_logic_vector(7 downto 0);
	lcdbinlon: out std_logic;
	bcdON:out std_logic
	
	);
end LCD_data;

architecture Beh of LCD_data is
	type FSM is (Estado0, Estado1); 
	signal current_state: FSM;

	Component div5MS is
	port (
		Fi : in std_logic;
		Fo : out std_logic 
	);
	end Component div5MS;

	signal s1, s2: std_logic;

begin
	U0: div5MS port map (clk, s1);
	lcdbinlon <= '1';
	bcdON  <= '1';
	process (s1, current_state, s2)
	begin
		if T ='1' then
			if (rising_edge(s1)) then
				if send = '0' then
					case current_state is
						when Estado0  => 
							enableS<='1';	
							rS <= rsin;
							rW <= '0';
							dbout <= dbin;
							current_state <= Estado1;
						when Estado1 => 
							enableS<='0';	
							rS <= rsin;
							rW <= '0';
							dbout <= dbin;
							current_state <= Estado0;
						when others => 
							enableS<='0';	
							rS <= '0';
							rW <= '0';
							dbout <= "00000000";
							current_state <= Estado0;
					end case;
				else
					current_state <= current_state;
				end if;
			else 
				current_state <= current_state;
			end if;
		else 
			current_state <= current_state;
		end if ;
	end process;
end Beh;


