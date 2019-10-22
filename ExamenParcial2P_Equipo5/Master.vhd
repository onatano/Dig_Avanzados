library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Master is
    port (
        entrada: in std_logic_vector(2 downto 0);
        clear,enable,store : out std_logic;
        s: out std_logic_vector (13 downto 0)
	);
end entity;

architecture Beh of Master is

    begin
        component Mux is
            port (
                entrada: in std_logic_vector(2 downto 0);
                lim: out integer
            );
        end component;

        component Deco is
            port (
                stage : in std_logic_vector(2 downto 0);
                clear,enable,store : out std_logic
            );
        end component;

        component CountMod6 is
            port (
                Fi : in std_logic;
                Fo : out std_logic;
                stage : out std_logic_vector(2 downto 0)
            );
        end component;

        component DIV1Hz is
            port (
                lim: in integer;
                Fi : in std_logic;
                Fo : out std_logic 
            );
        end component;

        component bin_bcd is
            port (a: in std_logic_vector (4 downto 0); --5 entradas
                s: out std_logic_vector (13 downto 0) -- 14 salidas
                );
        end component;

        signal lim : integer;
        signal Fo,Fo2: std_logic;
        signal stage : std_logic_vector(2 downto 0);
        signal bcd : std_logic_vector(3 downto 0);

       
        U0: Mux port map (entrada,lim);
        U1: DIV1HZ port map (lim,Fi,Fo);
        U2: CountMod6 port map (Fo,Fo2,stage);
        U3: Deco port map (stage,clear,enable,store);
        bcd <= ('0' & stage(2) & stage(1) & stage(1));
        U4: bin_bcd port map (bcd,s);

    
end Beh;