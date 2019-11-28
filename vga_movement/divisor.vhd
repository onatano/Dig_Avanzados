LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity divisor is
	port(
	clk_in: in std_logic;
	clk_out: out std_logic
	);
end divisor;


architecture BeH of divisor is
	signal counter_1: integer;
	signal clk_reg_1: std_logic;
begin
	process (counter_1, clk_in, clk_reg_1)
		begin
			if rising_edge (clk_in) then 
				if (counter_1 = 0)	then
				clk_reg_1 <= not clk_reg_1;
				counter_1<= 0;
					else 
				counter_1<= counter_1+1;
				clk_reg_1<=clk_reg_1;
				end if;
			else 
			counter_1 <= counter_1;
			clk_reg_1 <= clk_reg_1;
			end if;
		end process;
clk_out<= clk_reg_1;
end BeH;