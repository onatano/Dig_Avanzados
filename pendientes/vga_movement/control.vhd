LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity control is
	port(
	botder: in std_logic;
	botizq: in std_logic;
	botarr: in std_logic;
	botaba: in std_logic;
	corx: out integer; 
	cory: out integer;
clkk:in std_logic	
	);
end control;


architecture BeH of control is
	signal counter_1: integer;
	signal clk_reg_1: std_logic;
	signal counter_x: integer range 0 to 450:=100;
	signal counter_y: integer range 0 to 400:=100;
begin
process (counter_1, clkk, clk_reg_1)
		begin
            if rising_edge (clkk) then 
				if (counter_1 = 2499999)	then
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
		
process(clk_reg_1,botder, botizq, botarr, botaba, counter_x, counter_y)
        begin
             	if rising_edge (clk_reg_1) then 
				
					     if (botder = '0') then
                    counter_x <= counter_x +1;
                    
						  
						  elsif botizq = '0' then 
						  counter_x <= counter_x -1;
						  else 
						  counter_x <= counter_x;
						  end if;
                  
						  
						  if botarr = '0' then 
						  counter_y <= counter_y -1;
                  
						  
						  elsif botaba = '0' then
						  counter_y <= counter_y +1;
                    
						  
						  else 
						  counter_y <= counter_y;
						  
						  end if;
				end if;
	
		end process;
		
corx<= counter_x;
cory<= counter_y;
end BeH;