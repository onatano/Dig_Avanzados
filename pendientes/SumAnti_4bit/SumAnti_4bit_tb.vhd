LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY SumAnti_4bit_tb IS
END ENTITY;

ARCHITECTURE tb OF SumAnti_4bit_tb IS

--- components DUTs
    component SumAnti_4bit is
        port (
            a,b: in std_logic_vector (3 downto 0);
            Cin: in std_logic;
            s: out std_logic_vector (3 downto 0);
            Cout: out std_logic
        );
    end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
    signal stop_clk	: boolean;
    signal A,B: std_logic_vector (3 downto 0);
	signal CIn: std_logic;
	signal S: std_logic_vector (3 downto 0);
 	signal COut: std_logic;	

begin


-- instances DUTsc
 	U0: SumAnti_4bit port map (A,B,CIn,S,COut);
    
stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
    A<="1100";
	B<="0110";
	CIn<='0';
  
  wait for 160 ns;
  
	A<="0001";
	B<="0101";
	CIn<='0';
	
  wait for 160 ns;
  
	A<="0111";
	B<="0011";
	CIn<='0';
  
  wait for 160 ns;
  
    A<="0101";
    B<="1011";
    CIn<='0';
  
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