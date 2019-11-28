LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY vga_controller IS
	GENERIC(
		h_pulse 	:	INTEGER := 96;    	--horiztonal sync pulse en pixeles
		h_bp	 	:	INTEGER := 48;		--horiztonal back porch width en pixeles
		h_pixels	:	INTEGER := 640;		--horiztonal display width en pixeles
		h_fp	 	:	INTEGER := 16;		--horiztonal front porch width en pixeles
		h_pol		:	STD_LOGIC := '0';		--polaridad del horizontal sync pulse (1 = positivo, 0 = negativo)
		v_pulse 	:	INTEGER := 2;			--vertical sync pulse width en la fila
		v_bp	 	:	INTEGER := 33;			--vertical back porch width en la fila
		v_pixels	:	INTEGER := 480;		--vertical display width en filas
		v_fp	 	:	INTEGER := 10;			--vertical front porch width en filas
		v_pol		:	STD_LOGIC := '1');	--polaridad del vertical sync pulse (1 = positivo, 0 = negativo)
	PORT(
		pixel_clk	:	IN		STD_LOGIC;	--pixel clock
		reset_n		:	IN		STD_LOGIC;	--reset asincrono activo en bajo
		h_sync		:	OUT	STD_LOGIC;	--horiztonal sync pulse
		v_sync		:	OUT	STD_LOGIC;	--vertical sync pulse
		disp_ena		:	OUT	STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		column		:	OUT	INTEGER;		--coordenada horizontal
		row			:	OUT	INTEGER;		--coordenada vertical
		n_blank		:	OUT	STD_LOGIC;	--salida n_blank
		n_sync		:	OUT	STD_LOGIC); --salida n_sync
END vga_controller;

ARCHITECTURE behavior OF vga_controller IS
	CONSTANT	h_period	:	INTEGER := h_pulse + h_bp + h_pixels + h_fp;  --numero total de clocks en una fila
	CONSTANT	v_period	:	INTEGER := v_pulse + v_bp + v_pixels + v_fp;  --numero total de filas en una columna
BEGIN

	n_blank <= '1';  --no direct blanking
	n_sync <= '0';   --no sync on green
	
	PROCESS(pixel_clk, reset_n)
		VARIABLE h_count	:	INTEGER RANGE 0 TO h_period - 1 := 0;  --contador horizontal(columnas)
		VARIABLE v_count	:	INTEGER RANGE 0 TO v_period - 1 := 0;  --contador vertical (filas)
	BEGIN
	
		IF(reset_n = '0') THEN		--activar reset
			h_count := 0;				--reset de contador horizontal
			v_count := 0;				--reset de contador vertical
			h_sync <= NOT h_pol;		--deassert horizontal sync
			v_sync <= NOT v_pol;		--deassert vertical sync
			disp_ena <= '0';			--deshabilitar display
			column <= 0;				--reset coordenada de columna
			row <= 0;					--reset coordenada de fila
			
		ELSIF(pixel_clk'EVENT AND pixel_clk = '1') THEN

			--counters
			IF(h_count < h_period - 1) THEN		--horizontal counter (pixels)
				h_count := h_count + 1;
			ELSE
				h_count := 0;
				IF(v_count < v_period - 1) THEN	--veritcal counter (rows)
					v_count := v_count + 1;
				ELSE
					v_count := 0;
				END IF;
			END IF;

			--horizontal sync signal
			IF(h_count < h_pixels + h_fp OR h_count >= h_pixels + h_fp + h_pulse) THEN
				h_sync <= NOT h_pol;		--deassert horiztonal sync pulse
			ELSE
				h_sync <= h_pol;			--assert horiztonal sync pulse
			END IF;
			
			--vertical sync signal
			IF(v_count < v_pixels + v_fp OR v_count >= v_pixels + v_fp + v_pulse) THEN
				v_sync <= NOT v_pol;		--deassert vertical sync pulse
			ELSE
				v_sync <= v_pol;			--assert vertical sync pulse
			END IF;
			
			--set pixel coordinates
			IF(h_count < h_pixels) THEN  	--horiztonal display time
				column <= h_count;			--set horiztonal pixel coordinate
			END IF;
			IF(v_count < v_pixels) THEN	--vertical display time
				row <= v_count;				--set vertical pixel coordinate
			END IF;

			--set display enable output
			IF(h_count < h_pixels AND v_count < v_pixels) THEN  	--display time
				disp_ena <= '1';											 	--enable display
			ELSE																	--blanking time
				disp_ena <= '0';												--disable display
			END IF;

		END IF;
	END PROCESS;

END behavior;