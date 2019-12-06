library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity UpDown is
    port(
        contMd,contMu: in std_logic_vector (3 downto 0);
        minup,mindw: in std_logic;
        numMd,numMu: out std_logic_vector (3 downto 0)
    );
end UpDown;

architecture Beh of UpDown is

    signal parMd,parMu: std_logic_vector (3 downto 0);

begin
    process(minup,mindw)
    begin
        parMu <= contMu;
        parMd <= contMd;
        if minup='1' then
            parMu <= parMu+1;
            if parMu = "1001" then
                parMu <="0000";
                parMd <= parMd + 1;
                if parMd = "0101" then
                    parMu <="0000";
                    parMd <="0000";
                end if;
            end if;
        end if;
        if mindw='1' then
            parMu <= parMu-1;
            if parMu = "0000" then
                parMu <="1001";
                parMd <= parMd - 1;
                if parMd = "0000" then
                    parMu <="1001";
                    parMd <="0101";
                end if;
            end if;
        end if;
        numMu <= parMu;
        numMd <= parMd;
    end process;
end Beh;