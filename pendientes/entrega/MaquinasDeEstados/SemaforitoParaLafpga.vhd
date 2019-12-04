library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SemaforitoParaLafpga is
    port(
        clkIn,reset,test: in std_logic;
        rojo,amarillo,verde: out std_logic
    );
end SemaforitoParaLafpga;

architecture BeH of SemaforitoParaLafpga is
    constant tiempoMax: integer:=31;
    constant tiempoVerde: integer:=16;
    constant tiempoAmarillo: integer:=6;
    constant tiempoRojo: integer:=11;
    constant tiempoTest: integer:=1;

    type FSM is(S0,S1,S2);
    signal current_state, next_state : FSM;
    signal temp: integer range 0 to tiempoMax;
    signal clk: std_logic;

    component DIV1Hz is
        port (
            Fi : in std_logic;
            Fo : out std_logic 
        );
    end component;

    begin

        U0: DIV1Hz port map (clkIn,clk);
        process(clk, reset)
            variable cont: integer range 0 to tiempoMax;
        begin
            if rising_edge(clk) then
                if (reset = '1') then
                    current_state <= S0;
                    cont:=0;
            elsif (clk'event and clk='1') then
                    cont:=cont+1;
                    if cont=temp then
                        current_state <= next_state;
                        cont:=0;
                    end if;
                end if;
            end if;
        end process;

        process(current_state,test)
        begin
            case (current_state) is
                when S0 =>
                    rojo<='0';
                    amarillo <= '0';
                    verde <= '1';
                    next_state <= S1;
                    if test='0' then temp <= tiempoVerde;
                    else temp <= tiempoTest;
                    end if;

                when S1 =>
                    rojo<='1';
                    amarillo <= '0';
                    verde <= '0';
                    next_state <= S2;
                    if test='0' then temp <= tiempoRojo;
                    else temp <= tiempoTest;
                    end if;
                
                when S2 =>
                    rojo<='0';
                    amarillo <= '1';
                    verde <= '0';
                    next_state <= S0;
						  if test='0' then temp <= tiempoAmarillo;
                    else temp <= tiempoTest;
                    end if;
            end case;
        end process; 
end BeH;