library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity master is
    port(
        clk,min_up,min_dw,hora_up,hora_dw: in std_logic;
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
    signal clk_1s, or1, or2, or3, and1: std_logic;

begin
    U0: DIV1Hz port map (clk,clk_1s);
    U1: display port map (clk,contH_d,contH_u,contM_d,contM_u,vgaBLUE,vgaRED,vgaGREEN,vgaHS,vgaVS,clkvga,vgaBLANK,vgaSYNC);

    process (clk_1s)
    begin
        or1 <= (rising_edge (clk_1s) or min_up ='1'); 
        if or1 then
            contM_u <= contM_u + 1;
            if contM_u = "1001" then
                contM_u <="0000";
                contM_d <= contM_d + 1;
                or2 <= (contM_d = "0101" or hora_up='1');
                if or2 then
                    contM_d <="0000";
                    contH_u <= contH_u + 1;
                    if contH_u = "1001" then
                        contH_u <="0000";
                        contH_d <= contH_d + 1;
                        and1 <= (contH_d = "0010" and contH_u = "0011"); 
                        if and1 then
                            contM_u <="0000";
                            contM_d <="0000";
                            contH_u <="0000";
                            contH_d <="0000";
                        end if;
                    end if;
                end if;
            end if;
        end if;
        if min_dw='1' then
            contM_u <= contM_u - 1;
            if contM_u = "0000" then
                contM_u <="1001";
                contM_d <= contM_d - 1;
                or3 <= (contM_d = "0000" or hora_dw='1');
                if or3 then
                    contM_d <="0101";
                    contH_u <= contH_u - 1;
                    if contH_u = "0000" then
                        contH_u <="1001";
                        contH_d <= contH_d - 1;
                        if contH_d = "0000" then
                            contM_u <="1001";
                            contM_d <="0101";
                            contH_u <="0011";
                            contH_d <="0010";
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process; 
end architecture Beh;