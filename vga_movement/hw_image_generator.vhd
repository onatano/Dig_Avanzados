LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
  PORT(
	 pixels_y :  in INTEGER;   --row that first color will persist until
    pixels_x :  in INTEGER;  --column that first color will persist until
    disp_ena :  IN   STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    row      :  IN   INTEGER;    --row pixel coordinate
    column   :  IN   INTEGER;    --column pixel coordinate
    red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --blue magnitude output to DAC
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
BEGIN
  PROCESS(disp_ena, row, column, pixels_y, pixels_x)
  variable x:integer := pixels_x+20;
variable y :integer:= pixels_y+20;
  BEGIN

    IF(disp_ena = '1') THEN        --display time
      IF( column < (x) AND column > pixels_x) THEN
        red <= (OTHERS => '0');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '1');
      ELSIF (row > pixels_y and row< (y)) then 
         red <= (OTHERS => '0');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '1');
		  else 
		   red <= (OTHERS => '1');
        green  <= (OTHERS => '1');
        blue <= (OTHERS => '0');
      END IF;
    ELSE                           --blanking time
      red <= (OTHERS => '0');
      green <= (OTHERS => '0');
      blue <= (OTHERS => '0');
    END IF;
  
  END PROCESS;
END behavior;