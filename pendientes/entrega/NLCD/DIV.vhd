library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DIV is
    port (
        clk: in std_logic;
	botonin: in std_logic;
	botonout: out std_logic
	);
end entity;

architecture beh of DIV is
    signal Tamaño: integer := 19;
    signal botonprev: std_logic := '0';
    signal count: std_logic_vector(Tamaño downto 0) := (others => '0');

begin
    process(clk)
    begin
	if (clk'event and clk='1') then
		if (botonprev xor botonin) = '1' then
			count <= (others => '0');
			botonprev <= botonin;
		elsif (count(Tamaño) = '0') then
			count <= count + 1;
        	else
			botonout <= botonprev;
		end if;
	end if;
    end process;
end beh;