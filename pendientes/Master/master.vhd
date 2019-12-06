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

    signal contHd,contHu,contMd,contMu: std_logic_vector (3 downto 0):= "0000";
    signal clk1s,or1,and1,and2: std_logic;

begin
    U0: DIV1Hz port map (clk,clk1s);
    U1: display port map (clk,contHd,contHu,contMd,contMu,vgaBLUE,vgaRED,vgaGREEN,vgaHS,vgaVS,clkvga,vgaBLANK,vgaSYNC);

    

   process (clk1s, contHd,contHu,contMd,contMu)
   begin
        if rising_edge (clk1s) then
            contMu <= contMu + 1;
				or1<= contHu(2) and contHu(3) and contHd(2);
            if contMu = "1001" then
                contMu <="0000";
                contMd <= contMd + 1;
                if contMd = "0101" then
                    contMd <="0000";
                    contHu <= contHu + 1;
                    if contHu = "1001" then
                        contHu <="0000";
                        contHd <= contHd + 1;

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