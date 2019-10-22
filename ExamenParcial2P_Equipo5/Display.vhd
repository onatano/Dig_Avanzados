library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Display is
	port (
        store: in std_logic;
        num0,num1,num2,num3,num4,num5,num6,num7 : in std_logic_vector (3 downto 0);
        HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7 : out std_logic_vector (6 downto 0)
	);
end entity;

architecture beh of Display is
	component segmentos7 is
        port (a: in std_logic_vector (3 downto 0);
            s: out std_logic_vector (6 downto 0)
            );
    end component;
    
    signal h0,h1,h2,h3,h4,h5,h6,h7 : std_logic_vector (6 downto 0);

    begin 

    U0: segmentos7 port map (num0,h0);
    U1: segmentos7 port map (num1,h1);
    U2: segmentos7 port map (num2,h2);
    U3: segmentos7 port map (num3,h3);
    U4: segmentos7 port map (num4,h4);
    U5: segmentos7 port map (num5,h5);
    U6: segmentos7 port map (num6,h6);
    U7: segmentos7 port map (num7,h7);
     
    process (store)
    begin
        if store='1' then
            HEX0 <= h0;
            HEX1 <= h1;
            HEX2 <= h2;
            HEX3 <= h3;
            HEX4 <= h4;
            HEX5 <= h5;
            HEX6 <= h6;
            HEX7 <= h7;
        end if;
    end process;

end architecture beh;