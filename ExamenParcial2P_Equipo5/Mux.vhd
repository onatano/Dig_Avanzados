library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Mux is
    port (
        entrada: in std_logic_vector(2 downto 0);
        lim: out integer
    );
        
end Mux;

architecture Beh of Mux is

    begin

        process (entrada) 
        begin
            case entrada is 
                when "000" => --1Hz
                    lim <= 50000000;
                when "001" => --10Hz
                    lim <= 5000000;
                when "010" => --100Hz
                    lim <= 500000;
                when "011" => --1KHz
                    lim <= 50000;
                when "100" => --10KHz
                    lim <= 5000;
                when "101" => --100KHz
                    lim <= 500;
                when others =>
                    lim <= 1;
            end case;
        end process;
    
end Beh;