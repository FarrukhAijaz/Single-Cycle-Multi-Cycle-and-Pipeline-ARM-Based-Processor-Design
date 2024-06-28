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

-- DATE "04/22/2024 06:06:37"

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

ENTITY 	Pipeline_Test IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	Switches : IN std_logic_vector(3 DOWNTO 0);
	Cin : OUT std_logic;
	HEX_Debug : OUT std_logic_vector(31 DOWNTO 0);
	fetchPC : OUT std_logic_vector(31 DOWNTO 0)
	);
END Pipeline_Test;

-- Design Ports Information
-- Cin	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[0]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[1]	=>  Location: PIN_R18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[2]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[3]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[4]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[5]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[6]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[7]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[8]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[9]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[10]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[11]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[12]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[13]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[14]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[15]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[16]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[17]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[18]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[19]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[20]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[21]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[22]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[23]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[24]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[25]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[26]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[27]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[28]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[29]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[30]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[31]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[0]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[1]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[2]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[3]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[4]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[5]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[6]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[7]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[8]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[9]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[10]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[11]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[12]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[13]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[14]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[15]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[16]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[17]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[18]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[19]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[20]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[21]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[22]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[23]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[24]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[25]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[26]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[27]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[28]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[29]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[30]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetchPC[31]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[0]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[1]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[2]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[3]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Pipeline_Test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_Switches : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL ww_HEX_Debug : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_fetchPC : std_logic_vector(31 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Cin~output_o\ : std_logic;
SIGNAL \HEX_Debug[0]~output_o\ : std_logic;
SIGNAL \HEX_Debug[1]~output_o\ : std_logic;
SIGNAL \HEX_Debug[2]~output_o\ : std_logic;
SIGNAL \HEX_Debug[3]~output_o\ : std_logic;
SIGNAL \HEX_Debug[4]~output_o\ : std_logic;
SIGNAL \HEX_Debug[5]~output_o\ : std_logic;
SIGNAL \HEX_Debug[6]~output_o\ : std_logic;
SIGNAL \HEX_Debug[7]~output_o\ : std_logic;
SIGNAL \HEX_Debug[8]~output_o\ : std_logic;
SIGNAL \HEX_Debug[9]~output_o\ : std_logic;
SIGNAL \HEX_Debug[10]~output_o\ : std_logic;
SIGNAL \HEX_Debug[11]~output_o\ : std_logic;
SIGNAL \HEX_Debug[12]~output_o\ : std_logic;
SIGNAL \HEX_Debug[13]~output_o\ : std_logic;
SIGNAL \HEX_Debug[14]~output_o\ : std_logic;
SIGNAL \HEX_Debug[15]~output_o\ : std_logic;
SIGNAL \HEX_Debug[16]~output_o\ : std_logic;
SIGNAL \HEX_Debug[17]~output_o\ : std_logic;
SIGNAL \HEX_Debug[18]~output_o\ : std_logic;
SIGNAL \HEX_Debug[19]~output_o\ : std_logic;
SIGNAL \HEX_Debug[20]~output_o\ : std_logic;
SIGNAL \HEX_Debug[21]~output_o\ : std_logic;
SIGNAL \HEX_Debug[22]~output_o\ : std_logic;
SIGNAL \HEX_Debug[23]~output_o\ : std_logic;
SIGNAL \HEX_Debug[24]~output_o\ : std_logic;
SIGNAL \HEX_Debug[25]~output_o\ : std_logic;
SIGNAL \HEX_Debug[26]~output_o\ : std_logic;
SIGNAL \HEX_Debug[27]~output_o\ : std_logic;
SIGNAL \HEX_Debug[28]~output_o\ : std_logic;
SIGNAL \HEX_Debug[29]~output_o\ : std_logic;
SIGNAL \HEX_Debug[30]~output_o\ : std_logic;
SIGNAL \HEX_Debug[31]~output_o\ : std_logic;
SIGNAL \fetchPC[0]~output_o\ : std_logic;
SIGNAL \fetchPC[1]~output_o\ : std_logic;
SIGNAL \fetchPC[2]~output_o\ : std_logic;
SIGNAL \fetchPC[3]~output_o\ : std_logic;
SIGNAL \fetchPC[4]~output_o\ : std_logic;
SIGNAL \fetchPC[5]~output_o\ : std_logic;
SIGNAL \fetchPC[6]~output_o\ : std_logic;
SIGNAL \fetchPC[7]~output_o\ : std_logic;
SIGNAL \fetchPC[8]~output_o\ : std_logic;
SIGNAL \fetchPC[9]~output_o\ : std_logic;
SIGNAL \fetchPC[10]~output_o\ : std_logic;
SIGNAL \fetchPC[11]~output_o\ : std_logic;
SIGNAL \fetchPC[12]~output_o\ : std_logic;
SIGNAL \fetchPC[13]~output_o\ : std_logic;
SIGNAL \fetchPC[14]~output_o\ : std_logic;
SIGNAL \fetchPC[15]~output_o\ : std_logic;
SIGNAL \fetchPC[16]~output_o\ : std_logic;
SIGNAL \fetchPC[17]~output_o\ : std_logic;
SIGNAL \fetchPC[18]~output_o\ : std_logic;
SIGNAL \fetchPC[19]~output_o\ : std_logic;
SIGNAL \fetchPC[20]~output_o\ : std_logic;
SIGNAL \fetchPC[21]~output_o\ : std_logic;
SIGNAL \fetchPC[22]~output_o\ : std_logic;
SIGNAL \fetchPC[23]~output_o\ : std_logic;
SIGNAL \fetchPC[24]~output_o\ : std_logic;
SIGNAL \fetchPC[25]~output_o\ : std_logic;
SIGNAL \fetchPC[26]~output_o\ : std_logic;
SIGNAL \fetchPC[27]~output_o\ : std_logic;
SIGNAL \fetchPC[28]~output_o\ : std_logic;
SIGNAL \fetchPC[29]~output_o\ : std_logic;
SIGNAL \fetchPC[30]~output_o\ : std_logic;
SIGNAL \fetchPC[31]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~0_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~0_combout\ : std_logic;
SIGNAL \Switches[2]~input_o\ : std_logic;
SIGNAL \Switches[1]~input_o\ : std_logic;
SIGNAL \Switches[3]~input_o\ : std_logic;
SIGNAL \Switches[0]~input_o\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux29~0_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux29~1_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~1_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~1\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~2_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux28~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~2_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~3\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~4_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux27~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~3_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~5\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~6_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux26~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~4_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~7\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~8_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux25~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~5_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~9\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~10_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux24~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~6_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~11\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~12_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux23~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~7_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~13\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~14_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux22~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~8_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~15\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~16_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux21~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~9_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~17\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~18_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux20~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~10_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~19\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~20_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux19~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~11_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~21\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~22_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux18~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~12_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~23\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~24_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux17~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~13_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~25\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~26_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux16~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~14_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~27\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~28_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux15~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~15_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~29\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~30_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux14~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~16_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~31\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~32_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux13~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~17_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~33\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~34_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux12~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~18_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~35\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~36_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux11~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~19_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~37\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~38_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux10~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~20_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~39\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~40_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux9~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~21_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~41\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~42_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux8~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~22_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~43\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~44_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux7~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~23_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~45\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~46_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux6~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~24_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~47\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~48_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux5~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~25_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~49\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~50_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux4~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~26_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~51\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~52_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux3~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~27_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~53\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~54_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux2~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~28_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~55\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~56_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux1~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT~29_combout\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~57\ : std_logic;
SIGNAL \My_DP|My_Adder|Add0~58_combout\ : std_logic;
SIGNAL \My_DP|My_RegFile|mux_2|Mux0~0_combout\ : std_logic;
SIGNAL \My_DP|Fetch_Pipeline_Register|OUT\ : std_logic_vector(31 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_Switches <= Switches;
Cin <= ww_Cin;
HEX_Debug <= ww_HEX_Debug;
fetchPC <= ww_fetchPC;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X7_Y0_N23
\Cin~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Cin~output_o\);

-- Location: IOOBUF_X5_Y41_N2
\HEX_Debug[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX_Debug[0]~output_o\);

-- Location: IOOBUF_X52_Y12_N2
\HEX_Debug[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX_Debug[1]~output_o\);

-- Location: IOOBUF_X52_Y19_N2
\HEX_Debug[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux29~1_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[2]~output_o\);

-- Location: IOOBUF_X46_Y41_N9
\HEX_Debug[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux28~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[3]~output_o\);

-- Location: IOOBUF_X29_Y41_N9
\HEX_Debug[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux27~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[4]~output_o\);

-- Location: IOOBUF_X52_Y16_N2
\HEX_Debug[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux26~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[5]~output_o\);

-- Location: IOOBUF_X36_Y0_N2
\HEX_Debug[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux25~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[6]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\HEX_Debug[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux24~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[7]~output_o\);

-- Location: IOOBUF_X23_Y41_N9
\HEX_Debug[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux23~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[8]~output_o\);

-- Location: IOOBUF_X31_Y41_N9
\HEX_Debug[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux22~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[9]~output_o\);

-- Location: IOOBUF_X48_Y41_N9
\HEX_Debug[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux21~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[10]~output_o\);

-- Location: IOOBUF_X50_Y41_N9
\HEX_Debug[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux20~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[11]~output_o\);

-- Location: IOOBUF_X43_Y41_N9
\HEX_Debug[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux19~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[12]~output_o\);

-- Location: IOOBUF_X52_Y18_N9
\HEX_Debug[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux18~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[13]~output_o\);

-- Location: IOOBUF_X18_Y41_N2
\HEX_Debug[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux17~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[14]~output_o\);

-- Location: IOOBUF_X46_Y41_N2
\HEX_Debug[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux16~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[15]~output_o\);

-- Location: IOOBUF_X41_Y41_N2
\HEX_Debug[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux15~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[16]~output_o\);

-- Location: IOOBUF_X52_Y15_N2
\HEX_Debug[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux14~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[17]~output_o\);

-- Location: IOOBUF_X31_Y41_N2
\HEX_Debug[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux13~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[18]~output_o\);

-- Location: IOOBUF_X52_Y19_N9
\HEX_Debug[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux12~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[19]~output_o\);

-- Location: IOOBUF_X43_Y41_N2
\HEX_Debug[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux11~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[20]~output_o\);

-- Location: IOOBUF_X48_Y41_N2
\HEX_Debug[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux10~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[21]~output_o\);

-- Location: IOOBUF_X52_Y13_N9
\HEX_Debug[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux9~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[22]~output_o\);

-- Location: IOOBUF_X25_Y41_N9
\HEX_Debug[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux8~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[23]~output_o\);

-- Location: IOOBUF_X21_Y41_N2
\HEX_Debug[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux7~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[24]~output_o\);

-- Location: IOOBUF_X50_Y41_N2
\HEX_Debug[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[25]~output_o\);

-- Location: IOOBUF_X52_Y13_N2
\HEX_Debug[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[26]~output_o\);

-- Location: IOOBUF_X52_Y23_N2
\HEX_Debug[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[27]~output_o\);

-- Location: IOOBUF_X52_Y25_N2
\HEX_Debug[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[28]~output_o\);

-- Location: IOOBUF_X23_Y41_N2
\HEX_Debug[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[29]~output_o\);

-- Location: IOOBUF_X29_Y41_N2
\HEX_Debug[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[30]~output_o\);

-- Location: IOOBUF_X46_Y41_N23
\HEX_Debug[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|My_RegFile|mux_2|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[31]~output_o\);

-- Location: IOOBUF_X41_Y0_N2
\fetchPC[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \fetchPC[0]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\fetchPC[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \fetchPC[1]~output_o\);

-- Location: IOOBUF_X52_Y18_N2
\fetchPC[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(2),
	devoe => ww_devoe,
	o => \fetchPC[2]~output_o\);

-- Location: IOOBUF_X21_Y41_N9
\fetchPC[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(3),
	devoe => ww_devoe,
	o => \fetchPC[3]~output_o\);

-- Location: IOOBUF_X52_Y15_N9
\fetchPC[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(4),
	devoe => ww_devoe,
	o => \fetchPC[4]~output_o\);

-- Location: IOOBUF_X18_Y41_N9
\fetchPC[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(5),
	devoe => ww_devoe,
	o => \fetchPC[5]~output_o\);

-- Location: IOOBUF_X41_Y41_N16
\fetchPC[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(6),
	devoe => ww_devoe,
	o => \fetchPC[6]~output_o\);

-- Location: IOOBUF_X36_Y41_N2
\fetchPC[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(7),
	devoe => ww_devoe,
	o => \fetchPC[7]~output_o\);

-- Location: IOOBUF_X31_Y41_N16
\fetchPC[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(8),
	devoe => ww_devoe,
	o => \fetchPC[8]~output_o\);

-- Location: IOOBUF_X52_Y30_N2
\fetchPC[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(9),
	devoe => ww_devoe,
	o => \fetchPC[9]~output_o\);

-- Location: IOOBUF_X34_Y41_N2
\fetchPC[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(10),
	devoe => ww_devoe,
	o => \fetchPC[10]~output_o\);

-- Location: IOOBUF_X38_Y41_N9
\fetchPC[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(11),
	devoe => ww_devoe,
	o => \fetchPC[11]~output_o\);

-- Location: IOOBUF_X31_Y41_N23
\fetchPC[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(12),
	devoe => ww_devoe,
	o => \fetchPC[12]~output_o\);

-- Location: IOOBUF_X41_Y41_N9
\fetchPC[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(13),
	devoe => ww_devoe,
	o => \fetchPC[13]~output_o\);

-- Location: IOOBUF_X46_Y41_N16
\fetchPC[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(14),
	devoe => ww_devoe,
	o => \fetchPC[14]~output_o\);

-- Location: IOOBUF_X52_Y27_N2
\fetchPC[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(15),
	devoe => ww_devoe,
	o => \fetchPC[15]~output_o\);

-- Location: IOOBUF_X52_Y31_N9
\fetchPC[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(16),
	devoe => ww_devoe,
	o => \fetchPC[16]~output_o\);

-- Location: IOOBUF_X52_Y23_N9
\fetchPC[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(17),
	devoe => ww_devoe,
	o => \fetchPC[17]~output_o\);

-- Location: IOOBUF_X36_Y41_N9
\fetchPC[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(18),
	devoe => ww_devoe,
	o => \fetchPC[18]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\fetchPC[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(19),
	devoe => ww_devoe,
	o => \fetchPC[19]~output_o\);

-- Location: IOOBUF_X52_Y30_N9
\fetchPC[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(20),
	devoe => ww_devoe,
	o => \fetchPC[20]~output_o\);

-- Location: IOOBUF_X52_Y31_N2
\fetchPC[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(21),
	devoe => ww_devoe,
	o => \fetchPC[21]~output_o\);

-- Location: IOOBUF_X52_Y27_N9
\fetchPC[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(22),
	devoe => ww_devoe,
	o => \fetchPC[22]~output_o\);

-- Location: IOOBUF_X34_Y41_N9
\fetchPC[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(23),
	devoe => ww_devoe,
	o => \fetchPC[23]~output_o\);

-- Location: IOOBUF_X52_Y32_N2
\fetchPC[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(24),
	devoe => ww_devoe,
	o => \fetchPC[24]~output_o\);

-- Location: IOOBUF_X52_Y25_N9
\fetchPC[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(25),
	devoe => ww_devoe,
	o => \fetchPC[25]~output_o\);

-- Location: IOOBUF_X52_Y32_N9
\fetchPC[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(26),
	devoe => ww_devoe,
	o => \fetchPC[26]~output_o\);

-- Location: IOOBUF_X25_Y41_N2
\fetchPC[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(27),
	devoe => ww_devoe,
	o => \fetchPC[27]~output_o\);

-- Location: IOOBUF_X38_Y41_N2
\fetchPC[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(28),
	devoe => ww_devoe,
	o => \fetchPC[28]~output_o\);

-- Location: IOOBUF_X52_Y32_N23
\fetchPC[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(29),
	devoe => ww_devoe,
	o => \fetchPC[29]~output_o\);

-- Location: IOOBUF_X16_Y41_N2
\fetchPC[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(30),
	devoe => ww_devoe,
	o => \fetchPC[30]~output_o\);

-- Location: IOOBUF_X52_Y32_N16
\fetchPC[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_DP|Fetch_Pipeline_Register|OUT\(31),
	devoe => ww_devoe,
	o => \fetchPC[31]~output_o\);

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

-- Location: IOIBUF_X41_Y41_N22
\reset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X39_Y34_N30
\My_DP|Fetch_Pipeline_Register|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~0_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~0_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~0_combout\);

-- Location: FF_X38_Y34_N11
\My_DP|Fetch_Pipeline_Register|OUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \My_DP|Fetch_Pipeline_Register|OUT~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(2));

-- Location: LCCOMB_X38_Y34_N2
\My_DP|My_Adder|Add0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~0_combout\ = \My_DP|Fetch_Pipeline_Register|OUT\(2) $ (VCC)
-- \My_DP|My_Adder|Add0~1\ = CARRY(\My_DP|Fetch_Pipeline_Register|OUT\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(2),
	datad => VCC,
	combout => \My_DP|My_Adder|Add0~0_combout\,
	cout => \My_DP|My_Adder|Add0~1\);

-- Location: IOIBUF_X52_Y28_N1
\Switches[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(2),
	o => \Switches[2]~input_o\);

-- Location: IOIBUF_X52_Y12_N8
\Switches[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(1),
	o => \Switches[1]~input_o\);

-- Location: IOIBUF_X52_Y16_N8
\Switches[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(3),
	o => \Switches[3]~input_o\);

-- Location: IOIBUF_X52_Y28_N8
\Switches[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(0),
	o => \Switches[0]~input_o\);

-- Location: LCCOMB_X51_Y32_N24
\My_DP|My_RegFile|mux_2|Mux29~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux29~0_combout\ = (\Switches[2]~input_o\ & (\Switches[1]~input_o\ & (\Switches[3]~input_o\ & \Switches[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switches[2]~input_o\,
	datab => \Switches[1]~input_o\,
	datac => \Switches[3]~input_o\,
	datad => \Switches[0]~input_o\,
	combout => \My_DP|My_RegFile|mux_2|Mux29~0_combout\);

-- Location: LCCOMB_X39_Y34_N20
\My_DP|My_RegFile|mux_2|Mux29~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux29~1_combout\ = (\My_DP|My_Adder|Add0~0_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|My_Adder|Add0~0_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux29~1_combout\);

-- Location: LCCOMB_X39_Y34_N0
\My_DP|Fetch_Pipeline_Register|OUT~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~1_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~2_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~1_combout\);

-- Location: FF_X38_Y34_N9
\My_DP|Fetch_Pipeline_Register|OUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \My_DP|Fetch_Pipeline_Register|OUT~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(3));

-- Location: LCCOMB_X38_Y34_N4
\My_DP|My_Adder|Add0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~2_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(3) & (!\My_DP|My_Adder|Add0~1\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(3) & ((\My_DP|My_Adder|Add0~1\) # (GND)))
-- \My_DP|My_Adder|Add0~3\ = CARRY((!\My_DP|My_Adder|Add0~1\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(3),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~1\,
	combout => \My_DP|My_Adder|Add0~2_combout\,
	cout => \My_DP|My_Adder|Add0~3\);

-- Location: LCCOMB_X39_Y34_N26
\My_DP|My_RegFile|mux_2|Mux28~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux28~0_combout\ = (\My_DP|My_Adder|Add0~2_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~2_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux28~0_combout\);

-- Location: LCCOMB_X37_Y34_N6
\My_DP|Fetch_Pipeline_Register|OUT~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~2_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~4_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~2_combout\);

-- Location: FF_X38_Y34_N5
\My_DP|Fetch_Pipeline_Register|OUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \My_DP|Fetch_Pipeline_Register|OUT~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(4));

-- Location: LCCOMB_X38_Y34_N6
\My_DP|My_Adder|Add0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~4_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(4) & (\My_DP|My_Adder|Add0~3\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(4) & (!\My_DP|My_Adder|Add0~3\ & VCC))
-- \My_DP|My_Adder|Add0~5\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(4) & !\My_DP|My_Adder|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(4),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~3\,
	combout => \My_DP|My_Adder|Add0~4_combout\,
	cout => \My_DP|My_Adder|Add0~5\);

-- Location: LCCOMB_X37_Y34_N4
\My_DP|My_RegFile|mux_2|Mux27~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux27~0_combout\ = (\My_DP|My_Adder|Add0~4_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|My_Adder|Add0~4_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux27~0_combout\);

-- Location: LCCOMB_X38_Y34_N0
\My_DP|Fetch_Pipeline_Register|OUT~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~3_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~6_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~3_combout\);

-- Location: FF_X38_Y34_N1
\My_DP|Fetch_Pipeline_Register|OUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(5));

-- Location: LCCOMB_X38_Y34_N8
\My_DP|My_Adder|Add0~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~6_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(5) & (!\My_DP|My_Adder|Add0~5\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(5) & ((\My_DP|My_Adder|Add0~5\) # (GND)))
-- \My_DP|My_Adder|Add0~7\ = CARRY((!\My_DP|My_Adder|Add0~5\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(5),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~5\,
	combout => \My_DP|My_Adder|Add0~6_combout\,
	cout => \My_DP|My_Adder|Add0~7\);

-- Location: LCCOMB_X37_Y34_N10
\My_DP|My_RegFile|mux_2|Mux26~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux26~0_combout\ = (\My_DP|My_Adder|Add0~6_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~6_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux26~0_combout\);

-- Location: LCCOMB_X37_Y34_N0
\My_DP|Fetch_Pipeline_Register|OUT~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~4_combout\ = (\My_DP|My_Adder|Add0~8_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~8_combout\,
	datad => \reset~input_o\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~4_combout\);

-- Location: FF_X38_Y34_N3
\My_DP|Fetch_Pipeline_Register|OUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \My_DP|Fetch_Pipeline_Register|OUT~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(6));

-- Location: LCCOMB_X38_Y34_N10
\My_DP|My_Adder|Add0~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~8_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(6) & (\My_DP|My_Adder|Add0~7\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(6) & (!\My_DP|My_Adder|Add0~7\ & VCC))
-- \My_DP|My_Adder|Add0~9\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(6) & !\My_DP|My_Adder|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(6),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~7\,
	combout => \My_DP|My_Adder|Add0~8_combout\,
	cout => \My_DP|My_Adder|Add0~9\);

-- Location: LCCOMB_X37_Y34_N8
\My_DP|My_RegFile|mux_2|Mux25~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux25~0_combout\ = (\My_DP|My_Adder|Add0~8_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~8_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux25~0_combout\);

-- Location: LCCOMB_X37_Y34_N14
\My_DP|Fetch_Pipeline_Register|OUT~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~5_combout\ = (\My_DP|My_Adder|Add0~10_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~10_combout\,
	datad => \reset~input_o\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~5_combout\);

-- Location: FF_X37_Y34_N15
\My_DP|Fetch_Pipeline_Register|OUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(7));

-- Location: LCCOMB_X38_Y34_N12
\My_DP|My_Adder|Add0~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~10_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(7) & (!\My_DP|My_Adder|Add0~9\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(7) & ((\My_DP|My_Adder|Add0~9\) # (GND)))
-- \My_DP|My_Adder|Add0~11\ = CARRY((!\My_DP|My_Adder|Add0~9\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(7),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~9\,
	combout => \My_DP|My_Adder|Add0~10_combout\,
	cout => \My_DP|My_Adder|Add0~11\);

-- Location: LCCOMB_X37_Y34_N28
\My_DP|My_RegFile|mux_2|Mux24~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux24~0_combout\ = (\My_DP|My_Adder|Add0~10_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~10_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux24~0_combout\);

-- Location: LCCOMB_X37_Y34_N18
\My_DP|Fetch_Pipeline_Register|OUT~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~6_combout\ = (\My_DP|My_Adder|Add0~12_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~12_combout\,
	datad => \reset~input_o\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~6_combout\);

-- Location: FF_X37_Y34_N19
\My_DP|Fetch_Pipeline_Register|OUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(8));

-- Location: LCCOMB_X38_Y34_N14
\My_DP|My_Adder|Add0~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~12_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(8) & (\My_DP|My_Adder|Add0~11\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(8) & (!\My_DP|My_Adder|Add0~11\ & VCC))
-- \My_DP|My_Adder|Add0~13\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(8) & !\My_DP|My_Adder|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(8),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~11\,
	combout => \My_DP|My_Adder|Add0~12_combout\,
	cout => \My_DP|My_Adder|Add0~13\);

-- Location: LCCOMB_X37_Y34_N12
\My_DP|My_RegFile|mux_2|Mux23~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux23~0_combout\ = (\My_DP|My_Adder|Add0~12_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~12_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux23~0_combout\);

-- Location: LCCOMB_X39_Y34_N28
\My_DP|Fetch_Pipeline_Register|OUT~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~7_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~14_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~7_combout\);

-- Location: FF_X39_Y34_N29
\My_DP|Fetch_Pipeline_Register|OUT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(9));

-- Location: LCCOMB_X38_Y34_N16
\My_DP|My_Adder|Add0~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~14_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(9) & (!\My_DP|My_Adder|Add0~13\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(9) & ((\My_DP|My_Adder|Add0~13\) # (GND)))
-- \My_DP|My_Adder|Add0~15\ = CARRY((!\My_DP|My_Adder|Add0~13\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(9),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~13\,
	combout => \My_DP|My_Adder|Add0~14_combout\,
	cout => \My_DP|My_Adder|Add0~15\);

-- Location: LCCOMB_X39_Y34_N6
\My_DP|My_RegFile|mux_2|Mux22~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux22~0_combout\ = (\My_DP|My_Adder|Add0~14_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~14_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux22~0_combout\);

-- Location: LCCOMB_X37_Y34_N30
\My_DP|Fetch_Pipeline_Register|OUT~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~8_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~16_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~8_combout\);

-- Location: FF_X37_Y34_N31
\My_DP|Fetch_Pipeline_Register|OUT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(10));

-- Location: LCCOMB_X38_Y34_N18
\My_DP|My_Adder|Add0~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~16_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(10) & (\My_DP|My_Adder|Add0~15\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(10) & (!\My_DP|My_Adder|Add0~15\ & VCC))
-- \My_DP|My_Adder|Add0~17\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(10) & !\My_DP|My_Adder|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(10),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~15\,
	combout => \My_DP|My_Adder|Add0~16_combout\,
	cout => \My_DP|My_Adder|Add0~17\);

-- Location: LCCOMB_X37_Y34_N24
\My_DP|My_RegFile|mux_2|Mux21~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux21~0_combout\ = (\My_DP|My_Adder|Add0~16_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~16_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux21~0_combout\);

-- Location: LCCOMB_X39_Y34_N24
\My_DP|Fetch_Pipeline_Register|OUT~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~9_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~18_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~9_combout\);

-- Location: FF_X39_Y34_N25
\My_DP|Fetch_Pipeline_Register|OUT[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(11));

-- Location: LCCOMB_X38_Y34_N20
\My_DP|My_Adder|Add0~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~18_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(11) & (!\My_DP|My_Adder|Add0~17\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(11) & ((\My_DP|My_Adder|Add0~17\) # (GND)))
-- \My_DP|My_Adder|Add0~19\ = CARRY((!\My_DP|My_Adder|Add0~17\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(11),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~17\,
	combout => \My_DP|My_Adder|Add0~18_combout\,
	cout => \My_DP|My_Adder|Add0~19\);

-- Location: LCCOMB_X39_Y34_N14
\My_DP|My_RegFile|mux_2|Mux20~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux20~0_combout\ = (\My_DP|My_Adder|Add0~18_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~18_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux20~0_combout\);

-- Location: LCCOMB_X37_Y34_N2
\My_DP|Fetch_Pipeline_Register|OUT~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~10_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~20_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~10_combout\);

-- Location: FF_X37_Y34_N3
\My_DP|Fetch_Pipeline_Register|OUT[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(12));

-- Location: LCCOMB_X38_Y34_N22
\My_DP|My_Adder|Add0~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~20_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(12) & (\My_DP|My_Adder|Add0~19\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(12) & (!\My_DP|My_Adder|Add0~19\ & VCC))
-- \My_DP|My_Adder|Add0~21\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(12) & !\My_DP|My_Adder|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(12),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~19\,
	combout => \My_DP|My_Adder|Add0~20_combout\,
	cout => \My_DP|My_Adder|Add0~21\);

-- Location: LCCOMB_X37_Y34_N16
\My_DP|My_RegFile|mux_2|Mux19~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux19~0_combout\ = (\My_DP|My_Adder|Add0~20_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~20_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux19~0_combout\);

-- Location: LCCOMB_X39_Y34_N12
\My_DP|Fetch_Pipeline_Register|OUT~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~11_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~22_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~11_combout\);

-- Location: FF_X39_Y34_N13
\My_DP|Fetch_Pipeline_Register|OUT[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(13));

-- Location: LCCOMB_X38_Y34_N24
\My_DP|My_Adder|Add0~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~22_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(13) & (!\My_DP|My_Adder|Add0~21\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(13) & ((\My_DP|My_Adder|Add0~21\) # (GND)))
-- \My_DP|My_Adder|Add0~23\ = CARRY((!\My_DP|My_Adder|Add0~21\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(13),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~21\,
	combout => \My_DP|My_Adder|Add0~22_combout\,
	cout => \My_DP|My_Adder|Add0~23\);

-- Location: LCCOMB_X39_Y34_N18
\My_DP|My_RegFile|mux_2|Mux18~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux18~0_combout\ = (\My_DP|My_Adder|Add0~22_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~22_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux18~0_combout\);

-- Location: LCCOMB_X37_Y34_N26
\My_DP|Fetch_Pipeline_Register|OUT~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~12_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~24_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~12_combout\);

-- Location: FF_X38_Y34_N31
\My_DP|Fetch_Pipeline_Register|OUT[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \My_DP|Fetch_Pipeline_Register|OUT~12_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(14));

-- Location: LCCOMB_X38_Y34_N26
\My_DP|My_Adder|Add0~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~24_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(14) & (\My_DP|My_Adder|Add0~23\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(14) & (!\My_DP|My_Adder|Add0~23\ & VCC))
-- \My_DP|My_Adder|Add0~25\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(14) & !\My_DP|My_Adder|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(14),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~23\,
	combout => \My_DP|My_Adder|Add0~24_combout\,
	cout => \My_DP|My_Adder|Add0~25\);

-- Location: LCCOMB_X37_Y34_N22
\My_DP|My_RegFile|mux_2|Mux17~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux17~0_combout\ = (\My_DP|My_Adder|Add0~24_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~24_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux17~0_combout\);

-- Location: LCCOMB_X39_Y34_N8
\My_DP|Fetch_Pipeline_Register|OUT~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~13_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~26_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~13_combout\);

-- Location: FF_X39_Y34_N9
\My_DP|Fetch_Pipeline_Register|OUT[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(15));

-- Location: LCCOMB_X38_Y34_N28
\My_DP|My_Adder|Add0~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~26_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(15) & (!\My_DP|My_Adder|Add0~25\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(15) & ((\My_DP|My_Adder|Add0~25\) # (GND)))
-- \My_DP|My_Adder|Add0~27\ = CARRY((!\My_DP|My_Adder|Add0~25\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(15),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~25\,
	combout => \My_DP|My_Adder|Add0~26_combout\,
	cout => \My_DP|My_Adder|Add0~27\);

-- Location: LCCOMB_X39_Y34_N22
\My_DP|My_RegFile|mux_2|Mux16~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux16~0_combout\ = (\My_DP|My_Adder|Add0~26_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~26_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux16~0_combout\);

-- Location: LCCOMB_X39_Y34_N16
\My_DP|Fetch_Pipeline_Register|OUT~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~14_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~28_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~14_combout\);

-- Location: FF_X39_Y34_N17
\My_DP|Fetch_Pipeline_Register|OUT[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(16));

-- Location: LCCOMB_X38_Y34_N30
\My_DP|My_Adder|Add0~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~28_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(16) & (\My_DP|My_Adder|Add0~27\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(16) & (!\My_DP|My_Adder|Add0~27\ & VCC))
-- \My_DP|My_Adder|Add0~29\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(16) & !\My_DP|My_Adder|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(16),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~27\,
	combout => \My_DP|My_Adder|Add0~28_combout\,
	cout => \My_DP|My_Adder|Add0~29\);

-- Location: LCCOMB_X39_Y34_N2
\My_DP|My_RegFile|mux_2|Mux15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux15~0_combout\ = (\My_DP|My_Adder|Add0~28_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~28_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux15~0_combout\);

-- Location: LCCOMB_X39_Y33_N4
\My_DP|Fetch_Pipeline_Register|OUT~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~15_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~30_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~15_combout\);

-- Location: FF_X39_Y33_N5
\My_DP|Fetch_Pipeline_Register|OUT[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(17));

-- Location: LCCOMB_X38_Y33_N0
\My_DP|My_Adder|Add0~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~30_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(17) & (!\My_DP|My_Adder|Add0~29\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(17) & ((\My_DP|My_Adder|Add0~29\) # (GND)))
-- \My_DP|My_Adder|Add0~31\ = CARRY((!\My_DP|My_Adder|Add0~29\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(17),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~29\,
	combout => \My_DP|My_Adder|Add0~30_combout\,
	cout => \My_DP|My_Adder|Add0~31\);

-- Location: LCCOMB_X39_Y33_N10
\My_DP|My_RegFile|mux_2|Mux14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux14~0_combout\ = (\My_DP|My_Adder|Add0~30_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~30_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux14~0_combout\);

-- Location: LCCOMB_X37_Y33_N8
\My_DP|Fetch_Pipeline_Register|OUT~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~16_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~32_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~16_combout\);

-- Location: FF_X37_Y33_N9
\My_DP|Fetch_Pipeline_Register|OUT[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(18));

-- Location: LCCOMB_X38_Y33_N2
\My_DP|My_Adder|Add0~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~32_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(18) & (\My_DP|My_Adder|Add0~31\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(18) & (!\My_DP|My_Adder|Add0~31\ & VCC))
-- \My_DP|My_Adder|Add0~33\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(18) & !\My_DP|My_Adder|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(18),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~31\,
	combout => \My_DP|My_Adder|Add0~32_combout\,
	cout => \My_DP|My_Adder|Add0~33\);

-- Location: LCCOMB_X37_Y33_N22
\My_DP|My_RegFile|mux_2|Mux13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux13~0_combout\ = (\My_DP|My_Adder|Add0~32_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|My_Adder|Add0~32_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux13~0_combout\);

-- Location: LCCOMB_X37_Y33_N20
\My_DP|Fetch_Pipeline_Register|OUT~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~17_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~34_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~17_combout\);

-- Location: FF_X37_Y33_N21
\My_DP|Fetch_Pipeline_Register|OUT[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(19));

-- Location: LCCOMB_X38_Y33_N4
\My_DP|My_Adder|Add0~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~34_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(19) & (!\My_DP|My_Adder|Add0~33\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(19) & ((\My_DP|My_Adder|Add0~33\) # (GND)))
-- \My_DP|My_Adder|Add0~35\ = CARRY((!\My_DP|My_Adder|Add0~33\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(19),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~33\,
	combout => \My_DP|My_Adder|Add0~34_combout\,
	cout => \My_DP|My_Adder|Add0~35\);

-- Location: LCCOMB_X37_Y33_N10
\My_DP|My_RegFile|mux_2|Mux12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux12~0_combout\ = (\My_DP|My_Adder|Add0~34_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|My_Adder|Add0~34_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux12~0_combout\);

-- Location: LCCOMB_X39_Y33_N20
\My_DP|Fetch_Pipeline_Register|OUT~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~18_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~36_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~18_combout\);

-- Location: FF_X39_Y33_N21
\My_DP|Fetch_Pipeline_Register|OUT[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(20));

-- Location: LCCOMB_X38_Y33_N6
\My_DP|My_Adder|Add0~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~36_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(20) & (\My_DP|My_Adder|Add0~35\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(20) & (!\My_DP|My_Adder|Add0~35\ & VCC))
-- \My_DP|My_Adder|Add0~37\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(20) & !\My_DP|My_Adder|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(20),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~35\,
	combout => \My_DP|My_Adder|Add0~36_combout\,
	cout => \My_DP|My_Adder|Add0~37\);

-- Location: LCCOMB_X39_Y33_N2
\My_DP|My_RegFile|mux_2|Mux11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux11~0_combout\ = (\My_DP|My_Adder|Add0~36_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~36_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux11~0_combout\);

-- Location: LCCOMB_X39_Y33_N24
\My_DP|Fetch_Pipeline_Register|OUT~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~19_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~38_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~19_combout\);

-- Location: FF_X39_Y33_N25
\My_DP|Fetch_Pipeline_Register|OUT[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(21));

-- Location: LCCOMB_X38_Y33_N8
\My_DP|My_Adder|Add0~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~38_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(21) & (!\My_DP|My_Adder|Add0~37\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(21) & ((\My_DP|My_Adder|Add0~37\) # (GND)))
-- \My_DP|My_Adder|Add0~39\ = CARRY((!\My_DP|My_Adder|Add0~37\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(21),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~37\,
	combout => \My_DP|My_Adder|Add0~38_combout\,
	cout => \My_DP|My_Adder|Add0~39\);

-- Location: LCCOMB_X39_Y33_N14
\My_DP|My_RegFile|mux_2|Mux10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux10~0_combout\ = (\My_DP|My_Adder|Add0~38_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|My_Adder|Add0~38_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux10~0_combout\);

-- Location: LCCOMB_X39_Y33_N16
\My_DP|Fetch_Pipeline_Register|OUT~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~20_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~40_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~20_combout\);

-- Location: FF_X39_Y33_N17
\My_DP|Fetch_Pipeline_Register|OUT[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(22));

-- Location: LCCOMB_X38_Y33_N10
\My_DP|My_Adder|Add0~40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~40_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(22) & (\My_DP|My_Adder|Add0~39\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(22) & (!\My_DP|My_Adder|Add0~39\ & VCC))
-- \My_DP|My_Adder|Add0~41\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(22) & !\My_DP|My_Adder|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(22),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~39\,
	combout => \My_DP|My_Adder|Add0~40_combout\,
	cout => \My_DP|My_Adder|Add0~41\);

-- Location: LCCOMB_X39_Y33_N6
\My_DP|My_RegFile|mux_2|Mux9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux9~0_combout\ = (\My_DP|My_Adder|Add0~40_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|My_Adder|Add0~40_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux9~0_combout\);

-- Location: LCCOMB_X37_Y33_N0
\My_DP|Fetch_Pipeline_Register|OUT~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~21_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~42_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~21_combout\);

-- Location: FF_X37_Y33_N1
\My_DP|Fetch_Pipeline_Register|OUT[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(23));

-- Location: LCCOMB_X38_Y33_N12
\My_DP|My_Adder|Add0~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~42_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(23) & (!\My_DP|My_Adder|Add0~41\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(23) & ((\My_DP|My_Adder|Add0~41\) # (GND)))
-- \My_DP|My_Adder|Add0~43\ = CARRY((!\My_DP|My_Adder|Add0~41\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(23),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~41\,
	combout => \My_DP|My_Adder|Add0~42_combout\,
	cout => \My_DP|My_Adder|Add0~43\);

-- Location: LCCOMB_X37_Y33_N14
\My_DP|My_RegFile|mux_2|Mux8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux8~0_combout\ = (\My_DP|My_Adder|Add0~42_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~42_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux8~0_combout\);

-- Location: LCCOMB_X37_Y33_N16
\My_DP|Fetch_Pipeline_Register|OUT~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~22_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~44_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~22_combout\);

-- Location: FF_X37_Y33_N17
\My_DP|Fetch_Pipeline_Register|OUT[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(24));

-- Location: LCCOMB_X38_Y33_N14
\My_DP|My_Adder|Add0~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~44_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(24) & (\My_DP|My_Adder|Add0~43\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(24) & (!\My_DP|My_Adder|Add0~43\ & VCC))
-- \My_DP|My_Adder|Add0~45\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(24) & !\My_DP|My_Adder|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(24),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~43\,
	combout => \My_DP|My_Adder|Add0~44_combout\,
	cout => \My_DP|My_Adder|Add0~45\);

-- Location: LCCOMB_X37_Y33_N26
\My_DP|My_RegFile|mux_2|Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux7~0_combout\ = (\My_DP|My_Adder|Add0~44_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~44_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux7~0_combout\);

-- Location: LCCOMB_X39_Y33_N0
\My_DP|Fetch_Pipeline_Register|OUT~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~23_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~46_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~23_combout\);

-- Location: FF_X39_Y33_N1
\My_DP|Fetch_Pipeline_Register|OUT[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(25));

-- Location: LCCOMB_X38_Y33_N16
\My_DP|My_Adder|Add0~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~46_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(25) & (!\My_DP|My_Adder|Add0~45\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(25) & ((\My_DP|My_Adder|Add0~45\) # (GND)))
-- \My_DP|My_Adder|Add0~47\ = CARRY((!\My_DP|My_Adder|Add0~45\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(25),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~45\,
	combout => \My_DP|My_Adder|Add0~46_combout\,
	cout => \My_DP|My_Adder|Add0~47\);

-- Location: LCCOMB_X39_Y33_N22
\My_DP|My_RegFile|mux_2|Mux6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux6~0_combout\ = (\My_DP|My_Adder|Add0~46_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~46_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux6~0_combout\);

-- Location: LCCOMB_X39_Y33_N12
\My_DP|Fetch_Pipeline_Register|OUT~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~24_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~48_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~24_combout\);

-- Location: FF_X39_Y33_N13
\My_DP|Fetch_Pipeline_Register|OUT[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(26));

-- Location: LCCOMB_X38_Y33_N18
\My_DP|My_Adder|Add0~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~48_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(26) & (\My_DP|My_Adder|Add0~47\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(26) & (!\My_DP|My_Adder|Add0~47\ & VCC))
-- \My_DP|My_Adder|Add0~49\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(26) & !\My_DP|My_Adder|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(26),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~47\,
	combout => \My_DP|My_Adder|Add0~48_combout\,
	cout => \My_DP|My_Adder|Add0~49\);

-- Location: LCCOMB_X39_Y33_N30
\My_DP|My_RegFile|mux_2|Mux5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux5~0_combout\ = (\My_DP|My_Adder|Add0~48_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~48_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux5~0_combout\);

-- Location: LCCOMB_X37_Y33_N24
\My_DP|Fetch_Pipeline_Register|OUT~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~25_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~50_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~25_combout\);

-- Location: FF_X37_Y33_N25
\My_DP|Fetch_Pipeline_Register|OUT[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(27));

-- Location: LCCOMB_X38_Y33_N20
\My_DP|My_Adder|Add0~50\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~50_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(27) & (!\My_DP|My_Adder|Add0~49\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(27) & ((\My_DP|My_Adder|Add0~49\) # (GND)))
-- \My_DP|My_Adder|Add0~51\ = CARRY((!\My_DP|My_Adder|Add0~49\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(27),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~49\,
	combout => \My_DP|My_Adder|Add0~50_combout\,
	cout => \My_DP|My_Adder|Add0~51\);

-- Location: LCCOMB_X37_Y33_N2
\My_DP|My_RegFile|mux_2|Mux4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux4~0_combout\ = (\My_DP|My_Adder|Add0~50_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~50_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux4~0_combout\);

-- Location: LCCOMB_X39_Y33_N8
\My_DP|Fetch_Pipeline_Register|OUT~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~26_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~52_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~52_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~26_combout\);

-- Location: FF_X39_Y33_N9
\My_DP|Fetch_Pipeline_Register|OUT[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(28));

-- Location: LCCOMB_X38_Y33_N22
\My_DP|My_Adder|Add0~52\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~52_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(28) & (\My_DP|My_Adder|Add0~51\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(28) & (!\My_DP|My_Adder|Add0~51\ & VCC))
-- \My_DP|My_Adder|Add0~53\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(28) & !\My_DP|My_Adder|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|Fetch_Pipeline_Register|OUT\(28),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~51\,
	combout => \My_DP|My_Adder|Add0~52_combout\,
	cout => \My_DP|My_Adder|Add0~53\);

-- Location: LCCOMB_X39_Y33_N18
\My_DP|My_RegFile|mux_2|Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux3~0_combout\ = (\My_DP|My_Adder|Add0~52_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~52_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux3~0_combout\);

-- Location: LCCOMB_X37_Y33_N12
\My_DP|Fetch_Pipeline_Register|OUT~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~27_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~54_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~54_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~27_combout\);

-- Location: FF_X37_Y33_N13
\My_DP|Fetch_Pipeline_Register|OUT[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(29));

-- Location: LCCOMB_X38_Y33_N24
\My_DP|My_Adder|Add0~54\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~54_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(29) & (!\My_DP|My_Adder|Add0~53\)) # (!\My_DP|Fetch_Pipeline_Register|OUT\(29) & ((\My_DP|My_Adder|Add0~53\) # (GND)))
-- \My_DP|My_Adder|Add0~55\ = CARRY((!\My_DP|My_Adder|Add0~53\) # (!\My_DP|Fetch_Pipeline_Register|OUT\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(29),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~53\,
	combout => \My_DP|My_Adder|Add0~54_combout\,
	cout => \My_DP|My_Adder|Add0~55\);

-- Location: LCCOMB_X37_Y33_N18
\My_DP|My_RegFile|mux_2|Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux2~0_combout\ = (\My_DP|My_Adder|Add0~54_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_DP|My_Adder|Add0~54_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux2~0_combout\);

-- Location: LCCOMB_X38_Y33_N30
\My_DP|Fetch_Pipeline_Register|OUT~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~28_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \My_DP|My_Adder|Add0~56_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~28_combout\);

-- Location: FF_X38_Y33_N31
\My_DP|Fetch_Pipeline_Register|OUT[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(30));

-- Location: LCCOMB_X38_Y33_N26
\My_DP|My_Adder|Add0~56\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~56_combout\ = (\My_DP|Fetch_Pipeline_Register|OUT\(30) & (\My_DP|My_Adder|Add0~55\ $ (GND))) # (!\My_DP|Fetch_Pipeline_Register|OUT\(30) & (!\My_DP|My_Adder|Add0~55\ & VCC))
-- \My_DP|My_Adder|Add0~57\ = CARRY((\My_DP|Fetch_Pipeline_Register|OUT\(30) & !\My_DP|My_Adder|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \My_DP|Fetch_Pipeline_Register|OUT\(30),
	datad => VCC,
	cin => \My_DP|My_Adder|Add0~55\,
	combout => \My_DP|My_Adder|Add0~56_combout\,
	cout => \My_DP|My_Adder|Add0~57\);

-- Location: LCCOMB_X37_Y34_N20
\My_DP|My_RegFile|mux_2|Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux1~0_combout\ = (\My_DP|My_Adder|Add0~56_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~56_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux1~0_combout\);

-- Location: LCCOMB_X39_Y33_N28
\My_DP|Fetch_Pipeline_Register|OUT~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|Fetch_Pipeline_Register|OUT~29_combout\ = (!\reset~input_o\ & \My_DP|My_Adder|Add0~58_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \My_DP|My_Adder|Add0~58_combout\,
	combout => \My_DP|Fetch_Pipeline_Register|OUT~29_combout\);

-- Location: FF_X39_Y33_N29
\My_DP|Fetch_Pipeline_Register|OUT[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \My_DP|Fetch_Pipeline_Register|OUT~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_DP|Fetch_Pipeline_Register|OUT\(31));

-- Location: LCCOMB_X38_Y33_N28
\My_DP|My_Adder|Add0~58\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_Adder|Add0~58_combout\ = \My_DP|My_Adder|Add0~57\ $ (\My_DP|Fetch_Pipeline_Register|OUT\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \My_DP|Fetch_Pipeline_Register|OUT\(31),
	cin => \My_DP|My_Adder|Add0~57\,
	combout => \My_DP|My_Adder|Add0~58_combout\);

-- Location: LCCOMB_X39_Y34_N4
\My_DP|My_RegFile|mux_2|Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_DP|My_RegFile|mux_2|Mux0~0_combout\ = (\My_DP|My_Adder|Add0~58_combout\ & \My_DP|My_RegFile|mux_2|Mux29~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_DP|My_Adder|Add0~58_combout\,
	datad => \My_DP|My_RegFile|mux_2|Mux29~0_combout\,
	combout => \My_DP|My_RegFile|mux_2|Mux0~0_combout\);

ww_Cin <= \Cin~output_o\;

ww_HEX_Debug(0) <= \HEX_Debug[0]~output_o\;

ww_HEX_Debug(1) <= \HEX_Debug[1]~output_o\;

ww_HEX_Debug(2) <= \HEX_Debug[2]~output_o\;

ww_HEX_Debug(3) <= \HEX_Debug[3]~output_o\;

ww_HEX_Debug(4) <= \HEX_Debug[4]~output_o\;

ww_HEX_Debug(5) <= \HEX_Debug[5]~output_o\;

ww_HEX_Debug(6) <= \HEX_Debug[6]~output_o\;

ww_HEX_Debug(7) <= \HEX_Debug[7]~output_o\;

ww_HEX_Debug(8) <= \HEX_Debug[8]~output_o\;

ww_HEX_Debug(9) <= \HEX_Debug[9]~output_o\;

ww_HEX_Debug(10) <= \HEX_Debug[10]~output_o\;

ww_HEX_Debug(11) <= \HEX_Debug[11]~output_o\;

ww_HEX_Debug(12) <= \HEX_Debug[12]~output_o\;

ww_HEX_Debug(13) <= \HEX_Debug[13]~output_o\;

ww_HEX_Debug(14) <= \HEX_Debug[14]~output_o\;

ww_HEX_Debug(15) <= \HEX_Debug[15]~output_o\;

ww_HEX_Debug(16) <= \HEX_Debug[16]~output_o\;

ww_HEX_Debug(17) <= \HEX_Debug[17]~output_o\;

ww_HEX_Debug(18) <= \HEX_Debug[18]~output_o\;

ww_HEX_Debug(19) <= \HEX_Debug[19]~output_o\;

ww_HEX_Debug(20) <= \HEX_Debug[20]~output_o\;

ww_HEX_Debug(21) <= \HEX_Debug[21]~output_o\;

ww_HEX_Debug(22) <= \HEX_Debug[22]~output_o\;

ww_HEX_Debug(23) <= \HEX_Debug[23]~output_o\;

ww_HEX_Debug(24) <= \HEX_Debug[24]~output_o\;

ww_HEX_Debug(25) <= \HEX_Debug[25]~output_o\;

ww_HEX_Debug(26) <= \HEX_Debug[26]~output_o\;

ww_HEX_Debug(27) <= \HEX_Debug[27]~output_o\;

ww_HEX_Debug(28) <= \HEX_Debug[28]~output_o\;

ww_HEX_Debug(29) <= \HEX_Debug[29]~output_o\;

ww_HEX_Debug(30) <= \HEX_Debug[30]~output_o\;

ww_HEX_Debug(31) <= \HEX_Debug[31]~output_o\;

ww_fetchPC(0) <= \fetchPC[0]~output_o\;

ww_fetchPC(1) <= \fetchPC[1]~output_o\;

ww_fetchPC(2) <= \fetchPC[2]~output_o\;

ww_fetchPC(3) <= \fetchPC[3]~output_o\;

ww_fetchPC(4) <= \fetchPC[4]~output_o\;

ww_fetchPC(5) <= \fetchPC[5]~output_o\;

ww_fetchPC(6) <= \fetchPC[6]~output_o\;

ww_fetchPC(7) <= \fetchPC[7]~output_o\;

ww_fetchPC(8) <= \fetchPC[8]~output_o\;

ww_fetchPC(9) <= \fetchPC[9]~output_o\;

ww_fetchPC(10) <= \fetchPC[10]~output_o\;

ww_fetchPC(11) <= \fetchPC[11]~output_o\;

ww_fetchPC(12) <= \fetchPC[12]~output_o\;

ww_fetchPC(13) <= \fetchPC[13]~output_o\;

ww_fetchPC(14) <= \fetchPC[14]~output_o\;

ww_fetchPC(15) <= \fetchPC[15]~output_o\;

ww_fetchPC(16) <= \fetchPC[16]~output_o\;

ww_fetchPC(17) <= \fetchPC[17]~output_o\;

ww_fetchPC(18) <= \fetchPC[18]~output_o\;

ww_fetchPC(19) <= \fetchPC[19]~output_o\;

ww_fetchPC(20) <= \fetchPC[20]~output_o\;

ww_fetchPC(21) <= \fetchPC[21]~output_o\;

ww_fetchPC(22) <= \fetchPC[22]~output_o\;

ww_fetchPC(23) <= \fetchPC[23]~output_o\;

ww_fetchPC(24) <= \fetchPC[24]~output_o\;

ww_fetchPC(25) <= \fetchPC[25]~output_o\;

ww_fetchPC(26) <= \fetchPC[26]~output_o\;

ww_fetchPC(27) <= \fetchPC[27]~output_o\;

ww_fetchPC(28) <= \fetchPC[28]~output_o\;

ww_fetchPC(29) <= \fetchPC[29]~output_o\;

ww_fetchPC(30) <= \fetchPC[30]~output_o\;

ww_fetchPC(31) <= \fetchPC[31]~output_o\;
END structure;


