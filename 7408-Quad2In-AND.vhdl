library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AND2 is
    port (
        a,b : in std_logic;
        c : out std_logic
    );
end AND2;

architecture beh of AND2 is

    -- señales, constantes, componentes, tipo de señal

    begin
        --comportamiento

        c <= a and b;
end beh