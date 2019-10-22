library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Mux is
    port (
        entrada: in std_logic_vector(2 down to 0);
        Fi: in std_logic;
        sal: out std_logic
    );
        
end Mux;

architecture Beh of Mux is
    component DIV1Hz is
        port (
            lim: in integer;
            Fi : in std_logic;
            Fo : out std_logic 
        );
    end component;

    begin

        U0: DIV1Hz port map (lim,Fi,sal);

        process (entrada) 
        begin
            case entrada is 
                when "000" =>
                    lim <= 25000000;
                when "001" =>
                    lim <= 2500000;
                when "010" =>
                    lim <= 250000;
                when "011" =>
                    lim <= 25000;
                when "100" =>
                    lim <= 2500;
                when "101" =>
                    lim <= 250;
                when others =>
                    lim <= 1;
            end case;
        end process;
    
end Beh;