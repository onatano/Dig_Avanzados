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
    component display is
        port(
            clk: in std_logic;
            numH_d, numH_u, numM_d, numM_u: in std_logic_vector(3 downto 0);
            vgaBLUE, vgaRED, vgaGREEN: out std_logic_vector(7 downto 0);
            vgaHS, vgaVS: out std_logic;
            clkvga: out std_logic;
            vgaBLANK, vgaSYNC: out std_logic
        );
    end component;

    component DIV1Hz is
        port (
            Fi : in std_logic;
            Fo : out std_logic 
        );
    end component;

    signal contH_d,contH_u,contM_d,contM_u: std_logic_vector (3 downto 0):= "0000";
    signal contH_dR,contH_uR,contM_dR,contM_uR: std_logic_vector (3 downto 0):= "0000";
    signal clk_1s: std_logic;

begin
    U0: DIV1Hz port map (clk,clk_1s);
    U1: display port map (clk,contH_d,contH_u,contM_d,contM_u,vgaBLUE,vgaRED,vgaGREEN,vgaHS,vgaVS,clkvga,vgaBLANK,vgaSYNC);

    contM_u <= contM_u + 1 when clk_1s='1';
    contM_d <= contM_d + 1 when contM_u="1001";
    with contM_u select
        contM_uR <= "1001" when "1001",
                    "0000" when others;
    
    contH_u <= contH_u + 1 when contM_d = "0110";
    contM_d <="0000" when contM_d = "0110";
    contH_d <= contH_d + 1 when contH_u = "1001";
    contH_u <="0000" when contH_u = "1001";
    contM_d <="0000" when contH_d = "0010" and contH_u = "0100";
    contM_u <="0000" when contH_d = "0010" and contH_u = "0100";
    contH_u <="0000" when contH_d = "0010" and contH_u = "0100";
    contH_d <="0000" when contH_d = "0010" and contH_u = "0100";
	
end architecture Beh;