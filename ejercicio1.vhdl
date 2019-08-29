library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ejercicio1 is
    port (
        a,b,c : in std_logic;
        d : out std_logic
    );
end ejercicio1;

architecture beh of ejercicio1 is

    -- señales, constantes, componentes, tipo de señal

    begin
        --comportamiento

        d <= (a and b) or (a and c) or (b and c);
end beh