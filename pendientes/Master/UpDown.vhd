library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity UpDown is
    port(
        contHd,contHu,contMd,contMu: in std_logic_vector (3 downto 0);
        minup,mindw,horaup,horadw: in std_logic;
        numHd,numHu,numMd,numMu: out std_logic_vector (3 downto 0)
    );
end UpDown;

architecture Beh of UpDown is

    signal parHd,parHu,parMd,parMu: std_logic_vector (3 downto 0);

begin
    process(minup,mindw,horaup,horadw)
    begin
        parMu <= contMu;
        parMd <= contMd;
        parHu <= contHu;
        parHd <= contHd;
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
        if horaup='1' then
            parHu <= parHu+1;
            if parHu = "1001" then
                parHu <="0000";
                parHd <= parHd + 1;
                if parHd = "0001" and parHu = "0011" then
                    parHu <="0000";
                    parHd <="0000";
                end if;
            end if;
        end if;
        if horadw='1' then
            parHu <= parHu-1;
            if parHu = "0000" then
                parHu <="1001";
                parHd <= parHd - 1;
                if parHd = "0000" then
                    parHu <="0011";
                    parHd <="0010";
                end if;
            end if;
        end if;
    end process;
    numMu <= parMu;
    numMd <= parMd;
    numHu <= parHu;
    numHd <= parHd;
end Beh;