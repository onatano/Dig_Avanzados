library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity master is
    port(
        clk: in std_logic;
        vgaBLUE, vgaRED, vgaGREEN: out std_logic_vector(7 downto 0);
        vgaHS, vgaVS: out std_logic;
        clkvga: out std_logic;
        vgaBLANK, vgaSYNC: out std_logic
    );
end master;

architecture Beh of master is


Component VGA is
    port(
        clk: in std_logic;
        num_horu, num_minu, num_mind, num_hord : in std_logic_vector (6 downto 0);
        vgaBLUE, vgaRED, vgaGREEN: out std_logic_vector(7 downto 0);
        vgaHS, vgaVS: out std_logic;
        clkvga: out std_logic;
        vgaBLANK, vgaSYNC: out std_logic
        );
    end Component;

	component segmentos7 is
		port (a: in std_logic_vector (3 downto 0); --4 entradas
			s: out std_logic_vector (6 downto 0) -- 7 salidas
			);
	end component;

	signal hora_u, hora_d, min_u, min_d: std_logic_vector(6 downto 0);
    
	U0: segmentos7 port map ("1000",hora_d);
	U1: segmentos7 port map ("1000",hora_u);
	U2: segmentos7 port map ("1000",min_d);
	U3: segmentos7 port map ("1000",min_u);
    U4: VGA port map(clk,hora_u,min_u,min_d,hora_d,vgaBLUE, vgaRED, vgaGREEN,vgaHS,VgaVS,clkvga,vgaBLANK,vgaSYNC);
		
end architecture Beh;