LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY template_tb IS
END ENTITY;

ARCHITECTURE tb OF template_tb IS

--- components DUTs


--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

begin


-- instances DUTs

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here


	stop_clk <= true;

  wait;
  end process; --stimulus

clocking: process
  begin
    while NOT stop_clk loop
      clk <= '1', '0' after clk_T / 2;
      wait for clk_T;
    end loop;
    wait;
  end process; --clocking

end tb;