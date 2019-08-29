library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity structuralComponent is
    port (
      door, ignition sbelt: in std_logic;
      swarning: out std_logic
    );
end structuralComponent;

architecture beh of structuralComponent is

    -- señales, constantes, componentes, tipo de señal

    signal door_not: std_logic := '0';
    signal sbelt_not, s1_and, s2_and : std_logic;

    component AND2 is
        port (
            a,b : in std_logic;
            c : out std_logic
        );
    end component;
    
    component OR2 is
        port (
            a,b : in std_logic;
            c : out std_logic
        );
    end component;

    component NOT1 is
        port (
            a : in std_logic;
            b : out std_logic
        );
    end component;

    begin
        --comportamiento

        U0: NOT1 port map(door, door_not);
        U1: NOT1 port map(sbelt, sbelt_not);
        U2: AND2 port map(door_not, ignition, s1_and);
        U3: AND2 port map(sbelt_not, ignition, s2_and);
        U4: OR2 port map(s1_and, s2_and, swarning);
        
end beh