library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
 
entity SumBCD is
    port (
        a: in std_logic_vector (3 downto 0);
        b: in std_logic_vector (3 downto 0);
        res: out std_logic_vector (13 downto 0)
    );
    end SumBCD;

architecture Beh of SumBCD is
    
    component SumRes is
        port (
            s: in std_logic;
            a: in std_logic_vector (3 downto 0);
            b: in std_logic_vector (3 downto 0);
            o: out std_logic_vector (3 downto 0);
            cO: out std_logic
        );
    end component;

    component bin_bcd is
        port (
            a: in std_logic_vector (4 downto 0); 
            s: out std_logic_vector (13 downto 0)
        );
    end component;
    
    signal x : std_logic_vector (3 downto 0);
    signal y : std_logic;
    signal z : std_logic_vector (4 downto 0);

    begin

        U0 : SumRes port map ('0',a,b,x,y);
        z(4) <= 0;
        z(3) <= x(3);
        z(2) <= x(2);
        z(1) <= x(1);
        z(0) <= x(0);
        U1 : bin_bcd port map (z,res);
        
end Beh;