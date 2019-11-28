LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity controladorVGAA is
	port(
	clkk:in std_logic;
		clockgen: in std_logic;
        resetgen: in std_logic;
        redgen: out std_logic_vector (7 downto 0);
        greengen: out std_logic_vector (7 downto 0);
        bluegen: out std_logic_vector (7 downto 0);
        h_sync_signal: out std_logic;
        v_sync_signal: out std_logic;
        n_blank_signal: out  std_logic;
        n_sync_signal: out std_logic;
		  clock_vga: out std_logic;
		  botder: in std_LOGIC;
		  botizq: in std_LOGIC;
		  botarr: in std_LOGIC;
		  botaba: in std_LOGIC

    );
end controladorVGAA;

architecture BeH of controladorVGAA is

    signal clock_vga_s: std_logic;
	 signal disp_ena_signal : std_logic;
    signal column_signal : integer;
    signal row_signal: integer;
	 signal x_position: integer;
	 signal y_position: integer;
	 

    component divisor is
    port(
	    clk_in: in std_logic;
	    clk_out: out std_logic
        );
    end component;
    
    component vga_controller is
    GENERIC(
        h_pulse 	:	INTEGER := 96;    	--horiztonal sync pulse width in pixels
        h_bp	 	:	INTEGER := 48;		--horiztonal back porch width in pixels
        h_pixels	:	INTEGER := 640;		--horiztonal display width in pixels
        h_fp	 	:	INTEGER := 16;		--horiztonal front porch width in pixels
        h_pol		:	STD_LOGIC := '0';		--horizontal sync pulse polarity (1 = positive, 0 = negative)
        v_pulse 	:	INTEGER := 2;			--vertical sync pulse width in rows
        v_bp	 	:	INTEGER := 33;			--vertical back porch width in rows
        v_pixels	:	INTEGER := 480;		--vertical display width in rows
        v_fp	 	:	INTEGER := 10;			--vertical front porch width in rows
        v_pol		:	STD_LOGIC := '1');	--vertical sync pulse polarity (1 = positive, 0 = negative)
    PORT(
		pixel_clk	:	IN		STD_LOGIC;	--pixel clock at frequency of VGA mode being used
		reset_n		:	IN		STD_LOGIC;	--active low asycnchronous reset
		h_sync		:	OUT	STD_LOGIC;	--horiztonal sync pulse
		v_sync		:	OUT	STD_LOGIC;	--vertical sync pulse
		disp_ena		:	OUT	STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		column		:	OUT	INTEGER;		--horizontal pixel coordinate
		row			:	OUT	INTEGER;		--vertical pixel coordinate
		n_blank		:	OUT	STD_LOGIC;	--direct blacking output to DAC
		n_sync		:	OUT	STD_LOGIC --sync-on-green output to DAC
        );
    end component;

    component hw_image_generator is
        PORT(
	 pixels_y :  in INTEGER;   --row that first color will persist until
    pixels_x :  in INTEGER;  --column that first color will persist until
    disp_ena :  IN   STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    row      :  IN   INTEGER;    --row pixel coordinate
    column   :  IN   INTEGER;    --column pixel coordinate
    red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --blue magnitude output to DAC
    end component;
	 
	 component control is 
	 	port(
	botder: in std_logic;
	botizq: in std_logic;
	botarr: in std_logic;
	botaba: in std_logic;
	corx: out integer; 
	cory: out integer;
	clkk:in std_logic	
	);
end component;

    begin
        U0: divisor port map(clockgen,clock_vga_s);		
        U1: vga_controller generic map(96,48,640,16,'0',2,33,480,10,'1') port map(clock_vga_s,resetgen,h_sync_signal,v_sync_signal,disp_ena_signal,column_signal,row_signal,n_blank_signal,n_sync_signal);
        U2: hw_image_generator port map(y_position,x_position,disp_ena_signal,row_signal,column_signal,redgen,greengen,bluegen);
		  U3: control port map (botder, botizq, botarr, botaba, x_position, y_position,clkk);
		  clock_vga <= clock_vga_s;

	end BeH;