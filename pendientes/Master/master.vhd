library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity master is
    port(
        clk,minup,mindw,horaup,horadw: in std_logic;
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

    component UpDown is
        port(
            contHd,contHu,contMd,contMu: in std_logic_vector (3 downto 0);
            minup,mindw,horaup,horadw: in std_logic;
            numHd,numHu,numMd,numMu: out std_logic_vector (3 downto 0)
        );
    end component;

    signal contHd,contHu,contMd,contMu: std_logic_vector (3 downto 0):= "0000";
    signal numHd,numHu,numMd,numMu: std_logic_vector (3 downto 0);
    signal clk1s,or1,and1,and2: std_logic;

begin
    U0: DIV1Hz port map (clk,clk1s);
    U1: UpDown port map (contHd,contHu,contMd,contMu,minup,mindw,horaup,horadw,numHd,numHu,numMd,numMu);
    U2: display port map (clk,numHu, numMu, numMd, numHd,vgaBLUE,vgaRED,vgaGREEN,vgaHS,vgaVS,clkvga,vgaBLANK,vgaSYNC);

   process (clk1s)
   begin
        if rising_edge (clk1s) then
            contMu <= contMu + 1;
				
            if contMu = "1001" then
                contMu <="0000";
                contMd <= contMd + 1;
                if contMd = "0101" then
                    contMd <="0000";
                    contHu <= contHu + 1;
                    if contHu = "1001" then
                        contHu <="0000";
                        contHd <= contHd + 1;
                        or1 <= contHu(1) and contHd(1) and contHu(0);
                    end if;
                end if;
            end if;
        end if;
        if or1 = '1' then
            contMu <="0000";
            contMd <="0000";
            contHu <="0000";
            contHd <="0000";
        end if;
    end process; 
end architecture Beh;