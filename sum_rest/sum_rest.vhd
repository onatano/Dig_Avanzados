library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity sum_rest is
	port (
	sel: in std_logic;
	x0, x1, x2, x3: in std_logic;
	y0, y1, y2, y3: in std_logic;
	z0, z1, z2, z3, z4: out std_logic;
	co, signo: out std_logic
	);
	
end entity;

architecture beh of sum_rest is
	component Sumador4BitsB is
		port (
			cI: in std_logic;
			a0, a1, a2, a3: in std_logic;
			b0, b1, b2, b3: in std_logic;
			out0, out1, out2, out3: out std_logic;
			cO: out std_logic
			
		);
	end component;

	signal yr0, yr1, yr2, yr3, o0, o1, o2, o3, c1, c1not, selnot,zero , sig: std_logic;
	signal ox0, ox1, ox2, ox3: std_logic;

begin
	zero <= ('0');
	process (y0, y1, y2, y3)
		begin
		yr0<=(sel xor y0);
		yr1<=(sel xor y1);
		yr2<=(sel xor y2);
		yr3<=(sel xor y3);
	end process;
	
		u0: Sumador4BitsB port map ( sel, x0, x1, x2, x3, yr0, yr1, yr2, yr3, c1 );
	process (sig, sel )
	begin
		selnot<=(not sel);
		z4<= (c1 and selnot);
		c1not<=(not c1);
		sig<=(sel and c1not);
		signo<=(sel);
		ox0<=(o0 xor sig);
		ox1<=(o1 xor sig);
		ox2<=(o2 xor sig);
		ox3<=(o3 xor sig);
	end process;

		u1: Sumador4BitsB port map ( sig, ox0, ox1, ox2, ox3, zero, zero, zero, zero, z0, z1, z2, z3, co);
	

end architecture;