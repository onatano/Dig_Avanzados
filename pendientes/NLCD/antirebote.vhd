Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity antirebote is

port (
	btn: in std_logic;
	response: out std_logic
);
	
end antirebote;


architecture beh of antirebote is

	type FSM is (cont, btn_on);
	signal IDLE: FSM;
	signal current_state: FSM;
	signal contador: integer := 0;


begin
	
	process(btn,current_state, btn_on)

	begin

		if(IDLE = 0) then

			current_state <= IDLE;

			if (rising_edge(btn)) then

				case (current_state) is
					when IDLE =>

						if (btn = '1') then

							response <= '0';
							current_state <= cont;

							else
								
								response  <= '0';
								current_state <= current_state;
							
						end if;

					when cont =>

						if (rising_edge(btn)) then
							

							if (contador < "1000000" ) then
							contador <= contador + '1';

							else
								response <= '0';
								current_state <= btn_on;
								
							end if;

							

						else
								
							response  <= '0';
							current_state <= btn_on;
							
						end if;

					when btn_on =>

						if (btn = '1') then
							response <= '1';
							current_state <= IDLE;

						else

							response <= '0';
							current_state <= IDLE;
							
						end if;


					when others =>
					response <= '0';
					current_state <= IDLE;
				end case;
			else
				current_state <=  current_state;					

			end if;
			
		end if;

	end process;

end  beh;