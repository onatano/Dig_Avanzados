library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity letras is
	port (
		clk: in std_logic;
		RSin: in std_logic;
		DB1: in std_logic_vector (7 downto 0);
		send1: in std_Logic;
		Enable, RSout, RW: out std_logic;
		DBout: out std_logic_vector (7 downto 0)
		);
		
end entity;

Architecture beh of Letras is
	
	type FSM is (Estado0, Estado1, Estado2, Estado3, Estado4, Estado5, Estado6, Estado7); 
	signal current_state: FSM;

	
	signal RS: std_logic;
	signal DB: std_logic_vector (7 downto 0);
	signal send: std_Logic;

	
	begin
	
	
		process (clk)
		
		begin
		if (rising_edge(clk)) then
			case current_state is
				when Estado0  => 
					Enable<='1';	-- escritura / lectura
					RS <= '0';-- 0 instruccion / 1 datos
					rW <= '0'; --0 escritura / 1 lectura
					dB <= "01010011";
					
					current_state <= Estado1;
				when Estado1 => 
					Enable<='0';	
					RS <= '0';
					rW <= '0';
					dB <= "01010011";
					
					current_state <= Estado2;
				when Estado2  => 
					Enable<='1';	
					RS <= '0';
					rW <= '0';
					dB <= "01000100";
					
					current_state <= Estado3;
				when Estado3 => 
					Enable<='0';	
					RS <= '0';
					rW <= '0';
					dB <= "01000100";
					
					current_state <= Estado4;
				when Estado4  => 
					Enable<='1';	
					RS <= '0';
					rW <= '0';
					dB <= "01000001";
					
					current_state <= Estado5;
				when Estado5 => 
					Enable<='0';	
					RS <= '0';
					rW <= '0';
					dB <= "01000001";
					current_state <= Estado6;
				when Estado6  => 
					Enable<='1';	
					RS <= '0';
					rW <= '0';
					dB <= "01000001";
					
					current_state <= Estado7;
				when Estado7 => 
					Enable<='0';	
					RS <= '0';
					rW <= '0';
					dB <= "01000001";
					
					current_state <= current_state;
				when others => 
					Enable<='0';	
					RS <= '0';
					rW <= '0';
					dB <= "00000000";
					
					current_state <= Estado0;
			end case;
		else 
			current_state <= current_state;
		end if;
	end process;

	
	end architecture beh;