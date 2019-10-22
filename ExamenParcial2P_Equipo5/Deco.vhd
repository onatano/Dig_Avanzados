library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Deco is
    port (
        stage : in std_logic_vector(2 downto 0);
        clear,enable,store : out std_logic
	);
end entity;

architecture Beh of Deco is

    begin

        process (stage) 
        begin
            case stage is 
                when "001" =>
                    clear <= '1';
                    enable <= '0';
                    store <= '0';
                when "011" =>
                    clear <= '0';
                    enable <= '1';
                    store <= '0';
                when "101" =>
                    clear <= '0';
                    enable <= '0';
                    store <= '1';
                when others =>
                    clear <= '0';
                    enable <= '0';
                    store <= '0';
                

    
end Beh;