library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Data is
port (
	clk: in std_logic;
	RSin: in std_logic;
	DB: in std_logic_vector (7 downto 0);
	send: in std_Logic;
	En, RSout, RW: out std_logic;
	DBout: out std_logic_vector (7 downto 0)
);
	
end Data ;

architecture beh of Data is

	component NLCD is
		port (
			clk: in std_logic;  --Nuevo de 1K
			enableS, rS, rW: out std_logic;
			dB: out std_logic_vector(7 downto 0);
			lcdBlon: out std_logic;
			bcdON:out std_logic;
			T: out std_logic
		);
	end component ;

	component LCD_data is
		port (
			clk: in std_logic;  --Nuevo de 1K
			T : in std_logic;
			send : in std_logic;
			rsin : in std_logic;
			dbin: in std_logic_vector(7 downto 0);
			enableS, rS, rW: out std_logic;
			dbout: out std_logic_vector(7 downto 0);
			lcdbinlon: out std_logic;
			bcdON:out std_logic
		);
	end component ;

	component antirebote is
		port (
			btn: in std_logic;
			response: out std_logic
		);
	end component;

	signal x: std_logic_vector (2 downto 0);
	signal y, w: std_logic_vector (10 downto 0);
	signal z: std_logic_vector (12 downto 0);
	signal sendRebot: std_Logic;

begin

	U2: antirebote port map (send,sendRebot);
	En <= (z(12) or x(2));
	RSout <= (x(1) or z(11));
	RW <= (x(0) or z(10));
	DBout (7 downto 0) <= (y(7 downto 0) or z(7 downto 0));
	U0: NLCD port map (clk, X(2), X(1), x(0), y(7 downto 0), y(8), y(9), y(10));
	U1: LCD_data port map (clk, y(10), send, rsin, db(7 downto 0), z(12), z(11), z(10), z(7 downto 0), z(9), z(8));



end architecture beh;