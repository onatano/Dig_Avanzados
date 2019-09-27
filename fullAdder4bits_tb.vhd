LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY fullAdder4bits_tb IS
END ENTITY;

ARCHITECTURE tb OF fullAdder4bits_tb IS

--- components DUTs
component fullAdder4bits is
	port( 	CIN : in std_logic;
			A, B : in std_logic_vector (3 downto 0);
			Y : out std_logic_vector (4 downto 0)
			);
end component;


--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

	signal  A, B : std_logic_vector (3 downto 0);
	signal CIN: std_logic;
	signal Y : std_logic_vector (4 downto 0);
	signal  c1,c2,c3: std_logic;
	
begin

-- instances DUTs

	U0:fullAdder4bits port map (A(0),B(0),CIN,Y(0));
	U1:fullAdder4bits port map (A(1),B(1),C1,Y(1));
	U2:fullAdder4bits port map (A(2),B(2),C2,Y(2));
	U3:fullAdder4bits port map (A(3),B(3),C3,Y(3),Y(4));

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  
  	A<='1100';
	B<='0110';
	CIN<='0';
  
  wait for 160 ns;
  
	A<='0001';
	B<='0101';
	CIN<='0';
	
  wait for 240 ns;
  
	A<='0111';
	B<='0011';
	CIN<='0';
  
  wait for 60 ns;
  
  
	stop_clk <= true;

  wait;
  end process; --stimulus


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