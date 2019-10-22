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
	signal clk_div : std_logic;

begin
	process (Fi)
    variable cont0 : integer:=0;
    variable cont1 : integer:=0;
    variable cont2 : integer:=0;
    variable cont3 : integer:=0;
    variable cont4 : integer:=0;
    variable cont5 : integer:=0;
    variable cont6 : integer:=0;
    variable cont7 : integer:=0;
	begin
        process (Fi)
        variable cont : integer:=0;
        begin
		if rising_edge (Fi) then
            cont0:= cont0+1;
            HEX0 <= std_logic_vector(to_unsigned(cont0, HEX0'length));
                if cont0 = 9 then
                    cont0:=0;
                    cont1:= cont1+1;
                    HEX1 <= std_logic_vector(to_unsigned(cont1, HEX1'length));
                    if cont1 = 9 then
                        cont1:=0;
                        cont2:= cont2+1;
                        HEX2 <= std_logic_vector(to_unsigned(cont2, HEX2'length));
                        if cont2 = 9 then
                            cont2:=0;
                            cont3:= cont3+1;
                            HEX3 <= std_logic_vector(to_unsigned(cont3, HEX3'length));
                            if cont3 = 9 then
                                cont3:=0;
                                cont4:= cont4+1;
                                HEX4 <= std_logic_vector(to_unsigned(cont4, HEX4'length));
                                if cont4 = 9 then
                                    cont4:=0;
                                    cont5:= cont5+1;
                                    HEX5 <= std_logic_vector(to_unsigned(cont5, HEX5'length));
                                    if cont5 = 9 then
                                        cont5:=0;
                                        cont6:= cont6+1;
                                        HEX6 <= std_logic_vector(to_unsigned(cont6, HEX6'length));
                                        if cont6 = 9 then
                                            cont6:=0;
                                            cont7:= cont7+1;
                                            HEX7 <= std_logic_vector(to_unsigned(cont7, HEX7'length));
                                            if cont7 = 9 then
                                                cont7:=0;
                                                cont6:=0;
                                                cont5:=0;
                                                cont4:=0;
                                                cont3:=0;
                                                cont2:=0;
                                                cont1:=0;
                                                cont0:=0;
                                                HEX1 <= std_logic_vector(to_unsigned(cont0, HEX1'length));
                                            end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            else
                 cont:= cont;
            end if;
	end process; 
    Fo <= clk_div;
end architecture beh;