library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity BCD_counter is
    port (
        Fi : in std_logic;
        HEX0 : out std_logic_vector (6 downto 0);
        HEX1 : out std_logic_vector (6 downto 0);
        HEX2 : out std_logic_vector (6 downto 0);
        HEX3 : out std_logic_vector (6 downto 0);
        HEX4 : out std_logic_vector (6 downto 0);
        HEX5 : out std_logic_vector (6 downto 0);
        HEX6 : out std_logic_vector (6 downto 0);
        HEX7 : out std_logic_vector (6 downto 0)
	);
end entity;

architecture beh of BCD_counter is
	signal cont0 : std_logic_vector (3 downto 0):= "0000";
    signal cont1 : std_logic_vector (3 downto 0):= "0000";
    signal cont2 : std_logic_vector (3 downto 0):= "0000";
    signal cont3 : std_logic_vector (3 downto 0):= "0000";
    signal cont4 : std_logic_vector (3 downto 0):= "0000";
    signal cont5 : std_logic_vector (3 downto 0):= "0000";
    signal cont6 : std_logic_vector (3 downto 0):= "0000";
    signal cont7 : std_logic_vector (3 downto 0):= "0000";

begin
	process (Fi)
    
	begin
        
		if rising_edge (Fi) then
            cont0:= cont0+1;
                if cont0 = "1000" then
                    cont0:="0000";
                    cont1:= cont1+1;
                    if cont1 = "1000" then
                        cont1:="0000";
                        cont2:= cont2+1;
                        if cont2 = "1000" then
                            cont2:="0000";
                            cont3:= cont3+1;
                            if cont3 = "1000" then
                                cont3:="0000";
                                cont4:= cont4+1;
                                if cont4 = "1000" then
                                    cont4:="0000";
                                    cont5:= cont5+1;
                                    if cont5 = "1000" then
                                        cont5:="0000";
                                        cont6:= cont6+1;
                                        if cont6 = "1000" then
                                            cont6:="0000";
                                            cont7:= cont7+1;
                                            if cont7 = "1000" then
                                                cont7:="0000";
                                                cont6:="0000";
                                                cont5:="0000";
                                                cont4:="0000";
                                                cont3:="0000";
                                                cont2:="0000";
                                                cont1:="0000";
                                                cont0:="0000";
                                            end if; 
                                        end if; 
                                    end if; 
                                end if; 
                            end if; 
                        end if; 
                    end if; 
                end if; 
        end if;
	end process; 
end architecture beh;