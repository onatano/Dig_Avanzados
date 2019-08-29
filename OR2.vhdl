library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR2 is
    port (
        a,b : in std_logic;
        c : out std_logic
    );
end OR2;

architecture beh of OR2 is

    -- señales, constantes, componentes, tipo de señal

    begin
        --comportamiento

        c <= a and b;
end beh