-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "04/01/2024 08:44:05"

-- 
-- Device: Altera EP4CGX22CF19C6 Package FBGA324
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Controller IS
    PORT (
	PCWrite : OUT std_logic;
	AdrSrc : OUT std_logic;
	MemWrite : OUT std_logic;
	IRWrite : OUT std_logic;
	ResultSrc : OUT std_logic_vector(1 DOWNTO 0);
	ALUControl : OUT std_logic_vector(3 DOWNTO 0);
	ALUSrcB : OUT std_logic_vector(1 DOWNTO 0);
	ALUSrcA : OUT std_logic;
	ImmSrc : OUT std_logic_vector(1 DOWNTO 0);
	RegWrite : OUT std_logic;
	RegSrc : OUT std_logic_vector(1 DOWNTO 0);
	BL_ctrl : OUT std_logic;
	ALUFlags : IN std_logic_vector(3 DOWNTO 0);
	Cond : IN std_logic_vector(3 DOWNTO 0);
	Op : IN std_logic_vector(1 DOWNTO 0);
	Funct : IN std_logic_vector(5 DOWNTO 0);
	Rd : IN std_logic_vector(3 DOWNTO 0);
	clk : IN std_logic;
	RESET : IN std_logic
	);
END Controller;

-- Design Ports Information
-- PCWrite	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AdrSrc	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemWrite	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IRWrite	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ResultSrc[0]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ResultSrc[1]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControl[0]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControl[1]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControl[2]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControl[3]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUSrcB[0]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUSrcB[1]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUSrcA	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ImmSrc[0]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ImmSrc[1]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegWrite	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegSrc[0]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegSrc[1]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BL_ctrl	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[0]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[1]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[3]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[0]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[2]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[3]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[1]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[3]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[4]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[2]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[0]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[1]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[1]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[0]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[2]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[3]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[5]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[2]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Controller IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_PCWrite : std_logic;
SIGNAL ww_AdrSrc : std_logic;
SIGNAL ww_MemWrite : std_logic;
SIGNAL ww_IRWrite : std_logic;
SIGNAL ww_ResultSrc : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ALUControl : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_ALUSrcB : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ALUSrcA : std_logic;
SIGNAL ww_ImmSrc : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_RegWrite : std_logic;
SIGNAL ww_RegSrc : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_BL_ctrl : std_logic;
SIGNAL ww_ALUFlags : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cond : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Op : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Funct : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_Rd : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALUFlags[0]~input_o\ : std_logic;
SIGNAL \ALUFlags[1]~input_o\ : std_logic;
SIGNAL \ALUFlags[3]~input_o\ : std_logic;
SIGNAL \PCWrite~output_o\ : std_logic;
SIGNAL \AdrSrc~output_o\ : std_logic;
SIGNAL \MemWrite~output_o\ : std_logic;
SIGNAL \IRWrite~output_o\ : std_logic;
SIGNAL \ResultSrc[0]~output_o\ : std_logic;
SIGNAL \ResultSrc[1]~output_o\ : std_logic;
SIGNAL \ALUControl[0]~output_o\ : std_logic;
SIGNAL \ALUControl[1]~output_o\ : std_logic;
SIGNAL \ALUControl[2]~output_o\ : std_logic;
SIGNAL \ALUControl[3]~output_o\ : std_logic;
SIGNAL \ALUSrcB[0]~output_o\ : std_logic;
SIGNAL \ALUSrcB[1]~output_o\ : std_logic;
SIGNAL \ALUSrcA~output_o\ : std_logic;
SIGNAL \ImmSrc[0]~output_o\ : std_logic;
SIGNAL \ImmSrc[1]~output_o\ : std_logic;
SIGNAL \RegWrite~output_o\ : std_logic;
SIGNAL \RegSrc[0]~output_o\ : std_logic;
SIGNAL \RegSrc[1]~output_o\ : std_logic;
SIGNAL \BL_ctrl~output_o\ : std_logic;
SIGNAL \Rd[0]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Cond[1]~input_o\ : std_logic;
SIGNAL \Cond[2]~input_o\ : std_logic;
SIGNAL \Cond[3]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Cond[0]~input_o\ : std_logic;
SIGNAL \Funct[4]~input_o\ : std_logic;
SIGNAL \Funct[3]~input_o\ : std_logic;
SIGNAL \Funct[2]~input_o\ : std_logic;
SIGNAL \Funct[1]~input_o\ : std_logic;
SIGNAL \FlagWrite[1]~0_combout\ : std_logic;
SIGNAL \Funct[0]~input_o\ : std_logic;
SIGNAL \FlagWrite[1]~1_combout\ : std_logic;
SIGNAL \ALUFlags[2]~input_o\ : std_logic;
SIGNAL \Flag_reg32|OUT[0]~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \RESET~input_o\ : std_logic;
SIGNAL \Op[0]~input_o\ : std_logic;
SIGNAL \Op[1]~input_o\ : std_logic;
SIGNAL \state~17_combout\ : std_logic;
SIGNAL \Funct[5]~input_o\ : std_logic;
SIGNAL \state~28_combout\ : std_logic;
SIGNAL \state~29_combout\ : std_logic;
SIGNAL \state.EXECUTER~q\ : std_logic;
SIGNAL \state~26_combout\ : std_logic;
SIGNAL \state~27_combout\ : std_logic;
SIGNAL \state.EXECUTEI~q\ : std_logic;
SIGNAL \state~21_combout\ : std_logic;
SIGNAL \state.ALUWB~q\ : std_logic;
SIGNAL \state~25_combout\ : std_logic;
SIGNAL \state.MEMADR~q\ : std_logic;
SIGNAL \state~22_combout\ : std_logic;
SIGNAL \state.MEMREAD~q\ : std_logic;
SIGNAL \state~20_combout\ : std_logic;
SIGNAL \state.MEMWB~q\ : std_logic;
SIGNAL \state~23_combout\ : std_logic;
SIGNAL \state.MEMWRITE~q\ : std_logic;
SIGNAL \state~18_combout\ : std_logic;
SIGNAL \state~19_combout\ : std_logic;
SIGNAL \state.FETCH~q\ : std_logic;
SIGNAL \state~24_combout\ : std_logic;
SIGNAL \state.DECODE~q\ : std_logic;
SIGNAL \state~16_combout\ : std_logic;
SIGNAL \state.BRANCH~q\ : std_logic;
SIGNAL \PCWrite~0_combout\ : std_logic;
SIGNAL \Rd[1]~input_o\ : std_logic;
SIGNAL \Rd[3]~input_o\ : std_logic;
SIGNAL \Rd[2]~input_o\ : std_logic;
SIGNAL \PCWrite~2_combout\ : std_logic;
SIGNAL \PCWrite~1_combout\ : std_logic;
SIGNAL \PCWrite~3_combout\ : std_logic;
SIGNAL \AdrSrc~2_combout\ : std_logic;
SIGNAL \MemWrite~0_combout\ : std_logic;
SIGNAL \WideOr0~combout\ : std_logic;
SIGNAL \ALUControl~0_combout\ : std_logic;
SIGNAL \WideOr8~0_combout\ : std_logic;
SIGNAL \WideOr7~0_combout\ : std_logic;
SIGNAL \ALUControl~1_combout\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL \Decoder1~0_combout\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \RegSrc[0]$latch~combout\ : std_logic;
SIGNAL \Decoder1~1_combout\ : std_logic;
SIGNAL \RegSrc[1]$latch~combout\ : std_logic;
SIGNAL \Flag_reg32|OUT\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \CondEx_Reg|OUT\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \ALT_INV_state.FETCH~q\ : std_logic;

BEGIN

PCWrite <= ww_PCWrite;
AdrSrc <= ww_AdrSrc;
MemWrite <= ww_MemWrite;
IRWrite <= ww_IRWrite;
ResultSrc <= ww_ResultSrc;
ALUControl <= ww_ALUControl;
ALUSrcB <= ww_ALUSrcB;
ALUSrcA <= ww_ALUSrcA;
ImmSrc <= ww_ImmSrc;
RegWrite <= ww_RegWrite;
RegSrc <= ww_RegSrc;
BL_ctrl <= ww_BL_ctrl;
ww_ALUFlags <= ALUFlags;
ww_Cond <= Cond;
ww_Op <= Op;
ww_Funct <= Funct;
ww_Rd <= Rd;
ww_clk <= clk;
ww_RESET <= RESET;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_WideOr0~0_combout\ <= NOT \WideOr0~0_combout\;
\ALT_INV_state.FETCH~q\ <= NOT \state.FETCH~q\;

-- Location: IOOBUF_X31_Y41_N23
\PCWrite~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PCWrite~3_combout\,
	devoe => ww_devoe,
	o => \PCWrite~output_o\);

-- Location: IOOBUF_X38_Y41_N2
\AdrSrc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \AdrSrc~2_combout\,
	devoe => ww_devoe,
	o => \AdrSrc~output_o\);

-- Location: IOOBUF_X18_Y41_N2
\MemWrite~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MemWrite~0_combout\,
	devoe => ww_devoe,
	o => \MemWrite~output_o\);

-- Location: IOOBUF_X31_Y41_N16
\IRWrite~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.FETCH~q\,
	devoe => ww_devoe,
	o => \IRWrite~output_o\);

-- Location: IOOBUF_X34_Y41_N9
\ResultSrc[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.MEMWB~q\,
	devoe => ww_devoe,
	o => \ResultSrc[0]~output_o\);

-- Location: IOOBUF_X34_Y41_N2
\ResultSrc[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr0~combout\,
	devoe => ww_devoe,
	o => \ResultSrc[1]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\ALUControl[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUControl~0_combout\,
	devoe => ww_devoe,
	o => \ALUControl[0]~output_o\);

-- Location: IOOBUF_X23_Y41_N2
\ALUControl[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr8~0_combout\,
	devoe => ww_devoe,
	o => \ALUControl[1]~output_o\);

-- Location: IOOBUF_X23_Y41_N9
\ALUControl[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr7~0_combout\,
	devoe => ww_devoe,
	o => \ALUControl[2]~output_o\);

-- Location: IOOBUF_X18_Y41_N9
\ALUControl[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUControl~1_combout\,
	devoe => ww_devoe,
	o => \ALUControl[3]~output_o\);

-- Location: IOOBUF_X38_Y41_N9
\ALUSrcB[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr1~0_combout\,
	devoe => ww_devoe,
	o => \ALUSrcB[0]~output_o\);

-- Location: IOOBUF_X14_Y41_N9
\ALUSrcB[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => \ALUSrcB[1]~output_o\);

-- Location: IOOBUF_X14_Y41_N2
\ALUSrcA~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => \ALUSrcA~output_o\);

-- Location: IOOBUF_X41_Y41_N16
\ImmSrc[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op[0]~input_o\,
	devoe => ww_devoe,
	o => \ImmSrc[0]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\ImmSrc[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op[1]~input_o\,
	devoe => ww_devoe,
	o => \ImmSrc[1]~output_o\);

-- Location: IOOBUF_X23_Y0_N2
\RegWrite~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PCWrite~1_combout\,
	devoe => ww_devoe,
	o => \RegWrite~output_o\);

-- Location: IOOBUF_X41_Y41_N9
\RegSrc[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegSrc[0]$latch~combout\,
	devoe => ww_devoe,
	o => \RegSrc[0]~output_o\);

-- Location: IOOBUF_X41_Y41_N23
\RegSrc[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegSrc[1]$latch~combout\,
	devoe => ww_devoe,
	o => \RegSrc[1]~output_o\);

-- Location: IOOBUF_X52_Y11_N9
\BL_ctrl~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \BL_ctrl~output_o\);

-- Location: IOIBUF_X16_Y41_N8
\Rd[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rd(0),
	o => \Rd[0]~input_o\);

-- Location: IOIBUF_X27_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X25_Y0_N1
\Cond[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cond(1),
	o => \Cond[1]~input_o\);

-- Location: IOIBUF_X16_Y41_N1
\Cond[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cond(2),
	o => \Cond[2]~input_o\);

-- Location: IOIBUF_X31_Y41_N8
\Cond[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cond(3),
	o => \Cond[3]~input_o\);

-- Location: LCCOMB_X24_Y40_N10
\Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Cond[1]~input_o\ & (\Cond[2]~input_o\ & \Cond[3]~input_o\)) # (!\Cond[1]~input_o\ & (!\Cond[2]~input_o\ & !\Cond[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cond[1]~input_o\,
	datac => \Cond[2]~input_o\,
	datad => \Cond[3]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X25_Y0_N8
\Cond[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cond(0),
	o => \Cond[0]~input_o\);

-- Location: IOIBUF_X21_Y41_N8
\Funct[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Funct(4),
	o => \Funct[4]~input_o\);

-- Location: IOIBUF_X25_Y41_N8
\Funct[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Funct(3),
	o => \Funct[3]~input_o\);

-- Location: IOIBUF_X21_Y41_N1
\Funct[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Funct(2),
	o => \Funct[2]~input_o\);

-- Location: IOIBUF_X31_Y41_N1
\Funct[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Funct(1),
	o => \Funct[1]~input_o\);

-- Location: LCCOMB_X24_Y40_N12
\FlagWrite[1]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \FlagWrite[1]~0_combout\ = (\Funct[2]~input_o\ & (((\Funct[3]~input_o\) # (\Funct[1]~input_o\)))) # (!\Funct[2]~input_o\ & ((\Funct[4]~input_o\ & (!\Funct[3]~input_o\)) # (!\Funct[4]~input_o\ & ((\Funct[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct[4]~input_o\,
	datab => \Funct[3]~input_o\,
	datac => \Funct[2]~input_o\,
	datad => \Funct[1]~input_o\,
	combout => \FlagWrite[1]~0_combout\);

-- Location: IOIBUF_X29_Y41_N8
\Funct[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Funct(0),
	o => \Funct[0]~input_o\);

-- Location: LCCOMB_X25_Y40_N4
\FlagWrite[1]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \FlagWrite[1]~1_combout\ = (\FlagWrite[1]~0_combout\) # (\Funct[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FlagWrite[1]~0_combout\,
	datad => \Funct[0]~input_o\,
	combout => \FlagWrite[1]~1_combout\);

-- Location: IOIBUF_X25_Y41_N1
\ALUFlags[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFlags(2),
	o => \ALUFlags[2]~input_o\);

-- Location: LCCOMB_X24_Y40_N24
\Flag_reg32|OUT[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Flag_reg32|OUT[0]~0_combout\ = (\FlagWrite[1]~1_combout\ & ((\Mux0~1_combout\ & (\ALUFlags[2]~input_o\)) # (!\Mux0~1_combout\ & ((\Flag_reg32|OUT\(0)))))) # (!\FlagWrite[1]~1_combout\ & (((\Flag_reg32|OUT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FlagWrite[1]~1_combout\,
	datab => \ALUFlags[2]~input_o\,
	datac => \Flag_reg32|OUT\(0),
	datad => \Mux0~1_combout\,
	combout => \Flag_reg32|OUT[0]~0_combout\);

-- Location: FF_X24_Y40_N25
\Flag_reg32|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Flag_reg32|OUT[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Flag_reg32|OUT\(0));

-- Location: LCCOMB_X24_Y40_N28
\Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux0~0_combout\ & (\Cond[0]~input_o\ $ (((\Cond[1]~input_o\) # (\Flag_reg32|OUT\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \Cond[0]~input_o\,
	datac => \Cond[1]~input_o\,
	datad => \Flag_reg32|OUT\(0),
	combout => \Mux0~1_combout\);

-- Location: FF_X24_Y40_N29
\CondEx_Reg|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CondEx_Reg|OUT\(0));

-- Location: IOIBUF_X36_Y41_N1
\RESET~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET,
	o => \RESET~input_o\);

-- Location: IOIBUF_X29_Y41_N1
\Op[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(0),
	o => \Op[0]~input_o\);

-- Location: IOIBUF_X29_Y0_N1
\Op[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(1),
	o => \Op[1]~input_o\);

-- Location: LCCOMB_X28_Y40_N28
\state~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~17_combout\ = (\RESET~input_o\) # ((\Op[1]~input_o\ & (\Op[0]~input_o\ & \state.DECODE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[1]~input_o\,
	datab => \RESET~input_o\,
	datac => \Op[0]~input_o\,
	datad => \state.DECODE~q\,
	combout => \state~17_combout\);

-- Location: IOIBUF_X36_Y41_N8
\Funct[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Funct(5),
	o => \Funct[5]~input_o\);

-- Location: LCCOMB_X28_Y40_N10
\state~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~28_combout\ = (!\RESET~input_o\ & \state.DECODE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RESET~input_o\,
	datad => \state.DECODE~q\,
	combout => \state~28_combout\);

-- Location: LCCOMB_X28_Y40_N12
\state~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~29_combout\ = (!\Op[0]~input_o\ & (!\Funct[5]~input_o\ & (!\Op[1]~input_o\ & \state~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[0]~input_o\,
	datab => \Funct[5]~input_o\,
	datac => \Op[1]~input_o\,
	datad => \state~28_combout\,
	combout => \state~29_combout\);

-- Location: FF_X28_Y40_N13
\state.EXECUTER\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.EXECUTER~q\);

-- Location: LCCOMB_X30_Y40_N24
\state~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~26_combout\ = (!\Op[1]~input_o\ & !\RESET~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op[1]~input_o\,
	datad => \RESET~input_o\,
	combout => \state~26_combout\);

-- Location: LCCOMB_X28_Y40_N8
\state~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~27_combout\ = (\state~26_combout\ & (!\Op[0]~input_o\ & (\Funct[5]~input_o\ & \state.DECODE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~26_combout\,
	datab => \Op[0]~input_o\,
	datac => \Funct[5]~input_o\,
	datad => \state.DECODE~q\,
	combout => \state~27_combout\);

-- Location: FF_X28_Y40_N17
\state.EXECUTEI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \state~27_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.EXECUTEI~q\);

-- Location: LCCOMB_X28_Y40_N26
\state~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~21_combout\ = (!\RESET~input_o\ & ((\state.EXECUTER~q\) # (\state.EXECUTEI~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.EXECUTER~q\,
	datab => \RESET~input_o\,
	datad => \state.EXECUTEI~q\,
	combout => \state~21_combout\);

-- Location: FF_X28_Y40_N27
\state.ALUWB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.ALUWB~q\);

-- Location: LCCOMB_X28_Y40_N14
\state~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~25_combout\ = (!\Op[1]~input_o\ & (\Op[0]~input_o\ & (!\RESET~input_o\ & \state.DECODE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[1]~input_o\,
	datab => \Op[0]~input_o\,
	datac => \RESET~input_o\,
	datad => \state.DECODE~q\,
	combout => \state~25_combout\);

-- Location: FF_X28_Y40_N21
\state.MEMADR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \state~25_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.MEMADR~q\);

-- Location: LCCOMB_X28_Y40_N24
\state~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~22_combout\ = (!\RESET~input_o\ & (\Funct[0]~input_o\ & \state.MEMADR~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RESET~input_o\,
	datac => \Funct[0]~input_o\,
	datad => \state.MEMADR~q\,
	combout => \state~22_combout\);

-- Location: FF_X28_Y40_N25
\state.MEMREAD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.MEMREAD~q\);

-- Location: LCCOMB_X28_Y40_N4
\state~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~20_combout\ = (!\RESET~input_o\ & \state.MEMREAD~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RESET~input_o\,
	datad => \state.MEMREAD~q\,
	combout => \state~20_combout\);

-- Location: FF_X28_Y40_N5
\state.MEMWB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.MEMWB~q\);

-- Location: LCCOMB_X28_Y40_N18
\state~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~23_combout\ = (!\RESET~input_o\ & (!\Funct[0]~input_o\ & \state.MEMADR~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RESET~input_o\,
	datac => \Funct[0]~input_o\,
	datad => \state.MEMADR~q\,
	combout => \state~23_combout\);

-- Location: FF_X28_Y40_N19
\state.MEMWRITE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.MEMWRITE~q\);

-- Location: LCCOMB_X28_Y40_N2
\state~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~18_combout\ = (\state.ALUWB~q\) # ((\state.BRANCH~q\) # ((\state.MEMWB~q\) # (\state.MEMWRITE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.ALUWB~q\,
	datab => \state.BRANCH~q\,
	datac => \state.MEMWB~q\,
	datad => \state.MEMWRITE~q\,
	combout => \state~18_combout\);

-- Location: LCCOMB_X28_Y40_N22
\state~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~19_combout\ = (!\state~17_combout\ & !\state~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state~17_combout\,
	datad => \state~18_combout\,
	combout => \state~19_combout\);

-- Location: FF_X28_Y40_N23
\state.FETCH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.FETCH~q\);

-- Location: LCCOMB_X28_Y40_N6
\state~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~24_combout\ = (!\RESET~input_o\ & !\state.FETCH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RESET~input_o\,
	datad => \state.FETCH~q\,
	combout => \state~24_combout\);

-- Location: FF_X28_Y40_N7
\state.DECODE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.DECODE~q\);

-- Location: LCCOMB_X28_Y40_N30
\state~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \state~16_combout\ = (!\RESET~input_o\ & (!\Op[0]~input_o\ & (\Op[1]~input_o\ & \state.DECODE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET~input_o\,
	datab => \Op[0]~input_o\,
	datac => \Op[1]~input_o\,
	datad => \state.DECODE~q\,
	combout => \state~16_combout\);

-- Location: FF_X28_Y40_N1
\state.BRANCH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \state~16_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.BRANCH~q\);

-- Location: LCCOMB_X24_Y40_N18
\PCWrite~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCWrite~0_combout\ = ((\CondEx_Reg|OUT\(0) & \state.BRANCH~q\)) # (!\state.FETCH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CondEx_Reg|OUT\(0),
	datac => \state.BRANCH~q\,
	datad => \state.FETCH~q\,
	combout => \PCWrite~0_combout\);

-- Location: IOIBUF_X12_Y41_N1
\Rd[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rd(1),
	o => \Rd[1]~input_o\);

-- Location: IOIBUF_X10_Y41_N8
\Rd[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rd(3),
	o => \Rd[3]~input_o\);

-- Location: IOIBUF_X12_Y41_N8
\Rd[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rd(2),
	o => \Rd[2]~input_o\);

-- Location: LCCOMB_X12_Y40_N20
\PCWrite~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCWrite~2_combout\ = (\Rd[1]~input_o\ & (\Rd[3]~input_o\ & \Rd[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rd[1]~input_o\,
	datac => \Rd[3]~input_o\,
	datad => \Rd[2]~input_o\,
	combout => \PCWrite~2_combout\);

-- Location: LCCOMB_X24_Y40_N20
\PCWrite~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCWrite~1_combout\ = (\CondEx_Reg|OUT\(0) & ((\state.ALUWB~q\) # (\state.MEMWB~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.ALUWB~q\,
	datac => \state.MEMWB~q\,
	datad => \CondEx_Reg|OUT\(0),
	combout => \PCWrite~1_combout\);

-- Location: LCCOMB_X24_Y40_N30
\PCWrite~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCWrite~3_combout\ = (\PCWrite~0_combout\) # ((\Rd[0]~input_o\ & (\PCWrite~2_combout\ & \PCWrite~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rd[0]~input_o\,
	datab => \PCWrite~0_combout\,
	datac => \PCWrite~2_combout\,
	datad => \PCWrite~1_combout\,
	combout => \PCWrite~3_combout\);

-- Location: LCCOMB_X28_Y40_N20
\AdrSrc~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \AdrSrc~2_combout\ = (\state.MEMWRITE~q\) # (\state.MEMREAD~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.MEMWRITE~q\,
	datad => \state.MEMREAD~q\,
	combout => \AdrSrc~2_combout\);

-- Location: LCCOMB_X24_Y40_N8
\MemWrite~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MemWrite~0_combout\ = (\state.MEMWRITE~q\ & \CondEx_Reg|OUT\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.MEMWRITE~q\,
	datad => \CondEx_Reg|OUT\(0),
	combout => \MemWrite~0_combout\);

-- Location: LCCOMB_X28_Y40_N0
WideOr0 : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~combout\ = ((\state.BRANCH~q\) # (\state.DECODE~q\)) # (!\state.FETCH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.FETCH~q\,
	datac => \state.BRANCH~q\,
	datad => \state.DECODE~q\,
	combout => \WideOr0~combout\);

-- Location: LCCOMB_X24_Y40_N22
\ALUControl~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALUControl~0_combout\ = (\Funct[4]~input_o\ & (\Funct[3]~input_o\ & (!\Funct[2]~input_o\ & \Funct[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct[4]~input_o\,
	datab => \Funct[3]~input_o\,
	datac => \Funct[2]~input_o\,
	datad => \Funct[1]~input_o\,
	combout => \ALUControl~0_combout\);

-- Location: LCCOMB_X24_Y40_N0
\WideOr8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr8~0_combout\ = (\Funct[2]~input_o\) # ((\Funct[4]~input_o\ & (!\Funct[3]~input_o\)) # (!\Funct[4]~input_o\ & ((\Funct[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct[4]~input_o\,
	datab => \Funct[3]~input_o\,
	datac => \Funct[2]~input_o\,
	datad => \Funct[1]~input_o\,
	combout => \WideOr8~0_combout\);

-- Location: LCCOMB_X24_Y40_N6
\WideOr7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr7~0_combout\ = (\Funct[3]~input_o\ & (!\Funct[2]~input_o\ & ((\Funct[4]~input_o\) # (!\Funct[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct[4]~input_o\,
	datab => \Funct[3]~input_o\,
	datac => \Funct[2]~input_o\,
	datad => \Funct[1]~input_o\,
	combout => \WideOr7~0_combout\);

-- Location: LCCOMB_X24_Y40_N16
\ALUControl~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALUControl~1_combout\ = (\Funct[4]~input_o\ & (!\Funct[2]~input_o\ & \Funct[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct[4]~input_o\,
	datac => \Funct[2]~input_o\,
	datad => \Funct[3]~input_o\,
	combout => \ALUControl~1_combout\);

-- Location: LCCOMB_X28_Y40_N16
\WideOr1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = (\state.BRANCH~q\) # ((\state.EXECUTEI~q\) # (\state.MEMADR~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.BRANCH~q\,
	datac => \state.EXECUTEI~q\,
	datad => \state.MEMADR~q\,
	combout => \WideOr1~0_combout\);

-- Location: LCCOMB_X24_Y40_N26
\WideOr0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = (!\state.DECODE~q\ & \state.FETCH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.DECODE~q\,
	datad => \state.FETCH~q\,
	combout => \WideOr0~0_combout\);

-- Location: LCCOMB_X30_Y40_N10
\Decoder1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Decoder1~0_combout\ = (\Op[1]~input_o\ & !\Op[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[1]~input_o\,
	datac => \Op[0]~input_o\,
	combout => \Decoder1~0_combout\);

-- Location: LCCOMB_X30_Y40_N14
\comb~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = \Op[1]~input_o\ $ (\Op[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[1]~input_o\,
	datac => \Op[0]~input_o\,
	combout => \comb~0_combout\);

-- Location: LCCOMB_X30_Y40_N12
\RegSrc[0]$latch\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RegSrc[0]$latch~combout\ = (\comb~0_combout\ & ((\Decoder1~0_combout\) # (\RegSrc[0]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder1~0_combout\,
	datac => \comb~0_combout\,
	datad => \RegSrc[0]$latch~combout\,
	combout => \RegSrc[0]$latch~combout\);

-- Location: LCCOMB_X30_Y40_N26
\Decoder1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Decoder1~1_combout\ = (!\Op[1]~input_o\ & \Op[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[1]~input_o\,
	datac => \Op[0]~input_o\,
	combout => \Decoder1~1_combout\);

-- Location: LCCOMB_X30_Y40_N18
\RegSrc[1]$latch\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RegSrc[1]$latch~combout\ = (\Decoder1~0_combout\ & (\RegSrc[1]$latch~combout\)) # (!\Decoder1~0_combout\ & ((\Decoder1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegSrc[1]$latch~combout\,
	datac => \Decoder1~1_combout\,
	datad => \Decoder1~0_combout\,
	combout => \RegSrc[1]$latch~combout\);

-- Location: IOIBUF_X48_Y41_N8
\ALUFlags[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFlags(0),
	o => \ALUFlags[0]~input_o\);

-- Location: IOIBUF_X48_Y0_N8
\ALUFlags[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFlags(1),
	o => \ALUFlags[1]~input_o\);

-- Location: IOIBUF_X52_Y16_N8
\ALUFlags[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFlags(3),
	o => \ALUFlags[3]~input_o\);

ww_PCWrite <= \PCWrite~output_o\;

ww_AdrSrc <= \AdrSrc~output_o\;

ww_MemWrite <= \MemWrite~output_o\;

ww_IRWrite <= \IRWrite~output_o\;

ww_ResultSrc(0) <= \ResultSrc[0]~output_o\;

ww_ResultSrc(1) <= \ResultSrc[1]~output_o\;

ww_ALUControl(0) <= \ALUControl[0]~output_o\;

ww_ALUControl(1) <= \ALUControl[1]~output_o\;

ww_ALUControl(2) <= \ALUControl[2]~output_o\;

ww_ALUControl(3) <= \ALUControl[3]~output_o\;

ww_ALUSrcB(0) <= \ALUSrcB[0]~output_o\;

ww_ALUSrcB(1) <= \ALUSrcB[1]~output_o\;

ww_ALUSrcA <= \ALUSrcA~output_o\;

ww_ImmSrc(0) <= \ImmSrc[0]~output_o\;

ww_ImmSrc(1) <= \ImmSrc[1]~output_o\;

ww_RegWrite <= \RegWrite~output_o\;

ww_RegSrc(0) <= \RegSrc[0]~output_o\;

ww_RegSrc(1) <= \RegSrc[1]~output_o\;

ww_BL_ctrl <= \BL_ctrl~output_o\;
END structure;


