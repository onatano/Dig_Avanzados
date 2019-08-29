library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOT1 is
    port (
        a : in std_logic;
        b : out std_logic
    );
end NOT1;

architecture beh of NOT1 is

    -- señales, constantes, componentes, tipo de señal

    begin
        --comportamiento

        b <=  not a;
end beh