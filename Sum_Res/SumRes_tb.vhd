LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY SumRes_tb IS
END ENTITY;

ARCHITECTURE tb OF SumRes_tb IS

--- components DUTs
component SumRes is
  port (
    s: in std_logic;
    a: in std_logic_vector (3 downto 0);
    b: in std_logic_vector (3 downto 0);
    o: out std_logic_vector (3 downto 0);
    cO: out std_logic
  );
  end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clock 	: std_logic;
  signal stop_clk	: boolean;
  signal A: std_logic_vector (3 downto 0);
	signal B: std_logic_vector (3 downto 0);
	signal S: std_logic;
	signal O: std_logic_vector (3 downto 0);
 	signal CO: std_logic;	

begin


-- instances DUTsc
 	U0: SumRes port map (S,A,B,O,CO);
    
stimulus: process(A,B,S,O,CO)

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  A<="1100";
	B<="0110";
	S<='0';
  
  wait for 160 ns;
  
	A<="0001";
	B<="0101";
	S<='1';
	
  wait for 160 ns;
  
	A<="0111";
	B<="0011";
	S<='0';
  
  wait for 160 ns;
  
	A<="0101";
	B<="1011";
  S<='1';
  
  wait for 60 ns;

	stop_clk <= true;

  end process; --stimulus
  
end tb;