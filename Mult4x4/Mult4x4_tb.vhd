LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY Mult4x4_tb IS
END ENTITY;

ARCHITECTURE tb OF Mult4x4_tb IS

--- components DUTs
    component Mult4x4 is
        port (
            a,b: in std_logic_vector (3 downto 0);
            res: out std_logic_vector (8 downto 0)
        );	
    end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
    signal stop_clk	: boolean;
    signal A,B: std_logic_vector (3 downto 0);
	signal S: std_logic_vector (8 downto 0);

begin


-- instances DUTsc
 	U0: Mult4x4 port map (A,B,S);
    
stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
    A<="1100";
	B<="0110";
  
  wait for 160 ns;
  
	A<="0001";
	B<="0101";
	
  wait for 160 ns;
  
	A<="0111";
	B<="0011";
  
  wait for 160 ns;
  
    A<="0101";
    B<="1011";
  
  wait for 160 ns;

	stop_clk <= true;

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