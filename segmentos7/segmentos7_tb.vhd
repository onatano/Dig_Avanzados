LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY segmentos7_tb IS
END ENTITY;

ARCHITECTURE tb OF segmentos7_tb IS

--- components DUTs

component segmentos7 is
	port (a: in std_logic_vector (3 downto 0); --4 entradas
		s: out std_logic_vector (6 downto 0) -- 7 salidas
		);
end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
  signal stop_clk	: boolean;
  signal A : std_logic_vector(0 downto 3);
  signal S : std_logic_vector(6 downto 0);

begin


-- instances DUTs
U0 : segmentos7 port map (A,S);
stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  A <="0010";
  wait for 160 ns;
  A <= "0101";
  wait for 160 ns;
  A <= "0110";
  wait for 160 ns;
  
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