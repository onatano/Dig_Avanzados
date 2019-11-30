Library IEEE;
use IEEE.std_logic_1164.all;
entity VGA is
port(
		R,G,B: out std_logic_vector(7 downto 0);
		Blank, Sync, HS, VGA_clk, VS: out std_logic;
		Der, Izq, UP, Down, clk: in std_logic
	);
end VGA;

architecture BeH of VGA is


	signal h,v: integer range 0 to 800:=0;
	


	component DIV is
		port(
			clkIn: in std_logic;
			clkOut25: out std_logic
		);
	end component;
	
	signal clkIn,clkOut25: std_logic;
	signal i,bajo:integer range 0 to 800:=0;
	signal d: integer range 0 to 800:=300;
	signal u: integer range 0 to 800:=350;
	


begin
	
	clkIn<= clk;
	VGA_clk<=clkOut25;
	Blank<='1';
	Sync<='0';
	

	U0: DIV port map(clkIn,clkOut25);
	
	
	 
	process(clkOut25,h,v,Der)
	begin
		
		if rising_edge(clkOut25) then
			h<=h+1;
		
			if (h<48) then
				HS<='0';
				
			
			elsif (h<688) then 
				HS<='1';
			
			elsif (h<704) then
				HS<='1';
			
			elsif (h< 800) then
				HS<='1';
				h<=0;
				v<=v+1;
			
			end if;
			
			if (v<48) then
				VS<='0';
							
			elsif (v<688) then 
				VS<='1';
			
			elsif (v<704) then
				VS<='1';
							
			elsif (v< 800) then
				VS<='0';
				v<=0;
			
			end if;
		end if;
		
				
		if rising_edge(Der) then
			d <= d+1;
		
		end if;
		
		if rising_edge(Izq) then
			i <= i+1;
		
		end if;
		
		if rising_edge(UP) then
			u <= u+1;
		
		end if;
		
		if rising_edge(Down) then
			bajo <= bajo+1;
		
		end if;
		
		if((h > d - i and h < (d + 2)- i) or (v > u-bajo and v <(u + 2)- bajo)) then
			R <= "01111001";
			G <= "00000000";
			B <= "00010101";
	
		else
			R <= "10010010";
			G <= "00010101";
			B <= "00000000";
			
		end if;
	
	end process;


end BeH;
		