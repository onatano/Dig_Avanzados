library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Master is
    port (
        entrada: in std_logic_vector(2 downto 0);
        Fi,Fmedir : in std_logic;
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

architecture Beh of Master is

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

        component BCD_counter is
            port (
                Fmedir,enable,clear : in std_logic;
                num0,num1,num2,num3,num4,num5,num6,num7 : out std_logic_vector (3 downto 0)
            );
        end component;

        component Display is
            port (
                store: in std_logic;
                num0,num1,num2,num3,num4,num5,num6,num7 : in std_logic_vector (3 downto 0);
                HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7 : out std_logic_vector (6 downto 0)
            );
        end component;

        signal lim : integer;
        signal Fo,clear,enable,store: std_logic;
        signal stage : std_logic_vector(2 downto 0);
        signal num0,num1,num2,num3,num4,num5,num6,num7 : std_logic_vector(3 downto 0);
    
        begin
       
        U0: Mux port map (entrada,lim);
        U1: DIV1HZ port map (lim,Fi,Fo);
        U2: CountMod6 port map (Fo,stage);
        U3: Deco port map (stage,clear,enable,store);
        U4: BCD_counter port map (Fmedir,enable,clear,num0,num1,num2,num3,num4,num5,num6,num7);
        U5: Display port map (store,num0,num1,num2,num3,num4,num5,num6,num7,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);
    
end Beh;