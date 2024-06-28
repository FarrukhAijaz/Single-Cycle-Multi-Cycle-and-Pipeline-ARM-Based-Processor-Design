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

-- DATE "04/22/2024 03:35:39"

-- 
-- Device: Altera EP4CGX110DF27C7 Package FBGA672
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

ENTITY 	Datapath IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	PCSrcW : IN std_logic;
	BranchTakenE : IN std_logic;
	RegSrcD : IN std_logic_vector(1 DOWNTO 0);
	ALUSrcE : IN std_logic;
	BL_ctrl : IN std_logic;
	shamt : IN std_logic_vector(4 DOWNTO 0);
	shifter_ctrl : IN std_logic_vector(1 DOWNTO 0);
	MemWriteM : IN std_logic;
	MemtoRegW : IN std_logic;
	ImmSrcD : IN std_logic_vector(1 DOWNTO 0);
	RegWriteW : IN std_logic;
	StallF : IN std_logic;
	StallD : IN std_logic;
	FlushD : IN std_logic;
	FlushE : IN std_logic;
	ForwardAE : IN std_logic_vector(1 DOWNTO 0);
	ForwardBE : IN std_logic_vector(1 DOWNTO 0);
	ALUControlE : IN std_logic_vector(3 DOWNTO 0);
	Op : OUT std_logic_vector(1 DOWNTO 0);
	Funct : OUT std_logic_vector(4 DOWNTO 0);
	Rd : OUT std_logic_vector(3 DOWNTO 0);
	Cond : OUT std_logic_vector(3 DOWNTO 0);
	Src2 : OUT std_logic_vector(11 DOWNTO 0);
	ALUFlags : OUT std_logic_vector(3 DOWNTO 0);
	RD1E_Out : OUT std_logic_vector(31 DOWNTO 0);
	RD2E_Out : OUT std_logic_vector(31 DOWNTO 0);
	WA3M_Out : OUT std_logic_vector(3 DOWNTO 0);
	WA3W_Out : OUT std_logic_vector(3 DOWNTO 0);
	WA3E_Out : OUT std_logic_vector(3 DOWNTO 0);
	RD1D_Out : OUT std_logic_vector(31 DOWNTO 0);
	RD2D_Out : OUT std_logic_vector(31 DOWNTO 0);
	Switches : IN std_logic_vector(3 DOWNTO 0);
	HEX_Debug : OUT std_logic_vector(31 DOWNTO 0);
	PC_Out : OUT std_logic_vector(31 DOWNTO 0)
	);
END Datapath;

-- Design Ports Information
-- RegSrcD[1]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ImmSrcD[0]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ImmSrcD[1]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[0]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[1]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[0]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[1]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[2]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[3]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Funct[4]	=>  Location: PIN_A24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[0]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[1]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[2]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rd[3]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[0]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[1]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[2]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cond[3]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[0]	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[1]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[2]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[3]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[4]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[5]	=>  Location: PIN_W23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[7]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[8]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[9]	=>  Location: PIN_AC5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[10]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Src2[11]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[0]	=>  Location: PIN_E23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[1]	=>  Location: PIN_K24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFlags[3]	=>  Location: PIN_R20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[0]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[1]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[2]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[3]	=>  Location: PIN_AD6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[4]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[5]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[6]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[7]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[8]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[9]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[10]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[11]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[12]	=>  Location: PIN_AD9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[13]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[14]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[15]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[16]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[17]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[18]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[19]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[20]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[21]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[22]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[23]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[24]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[25]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[26]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[27]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[28]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[29]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[30]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1E_Out[31]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[1]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[2]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[3]	=>  Location: PIN_AD15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[4]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[5]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[6]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[7]	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[8]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[9]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[10]	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[11]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[12]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[13]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[14]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[15]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[16]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[17]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[18]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[19]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[20]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[21]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[22]	=>  Location: PIN_AF3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[23]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[24]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[25]	=>  Location: PIN_AC15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[26]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[27]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[28]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[29]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[30]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2E_Out[31]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3M_Out[0]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3M_Out[1]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3M_Out[2]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3M_Out[3]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3W_Out[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3W_Out[1]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3W_Out[2]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3W_Out[3]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3E_Out[0]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3E_Out[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3E_Out[2]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WA3E_Out[3]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[0]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[1]	=>  Location: PIN_AE3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[2]	=>  Location: PIN_AE25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[3]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[4]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[5]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[6]	=>  Location: PIN_D21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[7]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[8]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[9]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[10]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[11]	=>  Location: PIN_AD22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[12]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[13]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[14]	=>  Location: PIN_AD13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[15]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[16]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[17]	=>  Location: PIN_AD23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[18]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[19]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[20]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[21]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[22]	=>  Location: PIN_AE21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[23]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[24]	=>  Location: PIN_U18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[25]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[26]	=>  Location: PIN_AC13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[27]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[28]	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[29]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[30]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD1D_Out[31]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[0]	=>  Location: PIN_N23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[1]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[2]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[3]	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[4]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[5]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[6]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[7]	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[8]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[9]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[10]	=>  Location: PIN_AC20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[11]	=>  Location: PIN_AC19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[12]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[13]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[14]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[15]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[16]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[17]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[18]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[19]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[20]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[21]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[22]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[23]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[24]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[25]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[26]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[27]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[28]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[29]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[30]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RD2D_Out[31]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[0]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[1]	=>  Location: PIN_F26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[2]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[3]	=>  Location: PIN_C25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[4]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[5]	=>  Location: PIN_C24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[6]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[7]	=>  Location: PIN_D24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[8]	=>  Location: PIN_U19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[9]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[10]	=>  Location: PIN_K19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[11]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[12]	=>  Location: PIN_B26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[13]	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[14]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[15]	=>  Location: PIN_H24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[16]	=>  Location: PIN_G23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[17]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[18]	=>  Location: PIN_J25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[19]	=>  Location: PIN_G26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[20]	=>  Location: PIN_C23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[21]	=>  Location: PIN_J26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[22]	=>  Location: PIN_C26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[23]	=>  Location: PIN_F24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[24]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[25]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[26]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[27]	=>  Location: PIN_G25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[28]	=>  Location: PIN_M25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[29]	=>  Location: PIN_K26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[30]	=>  Location: PIN_L23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX_Debug[31]	=>  Location: PIN_J23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[0]	=>  Location: PIN_P23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[1]	=>  Location: PIN_T26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[2]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[3]	=>  Location: PIN_J20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[4]	=>  Location: PIN_H26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[5]	=>  Location: PIN_G24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[6]	=>  Location: PIN_H23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[7]	=>  Location: PIN_K20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[8]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[9]	=>  Location: PIN_K23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[10]	=>  Location: PIN_F23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[11]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[12]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[13]	=>  Location: PIN_E26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[14]	=>  Location: PIN_J24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[15]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[16]	=>  Location: PIN_A25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[17]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[18]	=>  Location: PIN_H25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[19]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[20]	=>  Location: PIN_H18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[21]	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[22]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[23]	=>  Location: PIN_B25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[24]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[25]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[26]	=>  Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[27]	=>  Location: PIN_D26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[28]	=>  Location: PIN_R19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[29]	=>  Location: PIN_P20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[30]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Out[31]	=>  Location: PIN_L24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shifter_ctrl[1]	=>  Location: PIN_V22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shifter_ctrl[0]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControlE[2]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControlE[3]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControlE[0]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shamt[2]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shamt[3]	=>  Location: PIN_T24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shamt[4]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUSrcE	=>  Location: PIN_N22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ForwardBE[0]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ForwardBE[1]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shamt[0]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shamt[1]	=>  Location: PIN_V24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemtoRegW	=>  Location: PIN_T23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ForwardAE[1]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ForwardAE[0]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUControlE[1]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegSrcD[0]	=>  Location: PIN_T25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[0]	=>  Location: PIN_R23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[1]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[2]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[3]	=>  Location: PIN_U26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCSrcW	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BranchTakenE	=>  Location: PIN_M26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- FlushE	=>  Location: PIN_N24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegWriteW	=>  Location: PIN_U25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BL_ctrl	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- StallF	=>  Location: PIN_T21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemWriteM	=>  Location: PIN_P24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- StallD	=>  Location: PIN_R25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- FlushD	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Datapath IS
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
SIGNAL ww_PCSrcW : std_logic;
SIGNAL ww_BranchTakenE : std_logic;
SIGNAL ww_RegSrcD : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ALUSrcE : std_logic;
SIGNAL ww_BL_ctrl : std_logic;
SIGNAL ww_shamt : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_shifter_ctrl : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_MemWriteM : std_logic;
SIGNAL ww_MemtoRegW : std_logic;
SIGNAL ww_ImmSrcD : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_RegWriteW : std_logic;
SIGNAL ww_StallF : std_logic;
SIGNAL ww_StallD : std_logic;
SIGNAL ww_FlushD : std_logic;
SIGNAL ww_FlushE : std_logic;
SIGNAL ww_ForwardAE : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ForwardBE : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ALUControlE : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Op : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Funct : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Rd : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cond : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Src2 : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_ALUFlags : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_RD1E_Out : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_RD2E_Out : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_WA3M_Out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_WA3W_Out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_WA3E_Out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_RD1D_Out : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_RD2D_Out : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_Switches : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_HEX_Debug : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_PC_Out : std_logic_vector(31 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RegSrcD[1]~input_o\ : std_logic;
SIGNAL \ImmSrcD[0]~input_o\ : std_logic;
SIGNAL \ImmSrcD[1]~input_o\ : std_logic;
SIGNAL \shifter_ctrl[1]~input_o\ : std_logic;
SIGNAL \shifter_ctrl[0]~input_o\ : std_logic;
SIGNAL \Op[0]~output_o\ : std_logic;
SIGNAL \Op[1]~output_o\ : std_logic;
SIGNAL \Funct[0]~output_o\ : std_logic;
SIGNAL \Funct[1]~output_o\ : std_logic;
SIGNAL \Funct[2]~output_o\ : std_logic;
SIGNAL \Funct[3]~output_o\ : std_logic;
SIGNAL \Funct[4]~output_o\ : std_logic;
SIGNAL \Rd[0]~output_o\ : std_logic;
SIGNAL \Rd[1]~output_o\ : std_logic;
SIGNAL \Rd[2]~output_o\ : std_logic;
SIGNAL \Rd[3]~output_o\ : std_logic;
SIGNAL \Cond[0]~output_o\ : std_logic;
SIGNAL \Cond[1]~output_o\ : std_logic;
SIGNAL \Cond[2]~output_o\ : std_logic;
SIGNAL \Cond[3]~output_o\ : std_logic;
SIGNAL \Src2[0]~output_o\ : std_logic;
SIGNAL \Src2[1]~output_o\ : std_logic;
SIGNAL \Src2[2]~output_o\ : std_logic;
SIGNAL \Src2[3]~output_o\ : std_logic;
SIGNAL \Src2[4]~output_o\ : std_logic;
SIGNAL \Src2[5]~output_o\ : std_logic;
SIGNAL \Src2[6]~output_o\ : std_logic;
SIGNAL \Src2[7]~output_o\ : std_logic;
SIGNAL \Src2[8]~output_o\ : std_logic;
SIGNAL \Src2[9]~output_o\ : std_logic;
SIGNAL \Src2[10]~output_o\ : std_logic;
SIGNAL \Src2[11]~output_o\ : std_logic;
SIGNAL \ALUFlags[0]~output_o\ : std_logic;
SIGNAL \ALUFlags[1]~output_o\ : std_logic;
SIGNAL \ALUFlags[2]~output_o\ : std_logic;
SIGNAL \ALUFlags[3]~output_o\ : std_logic;
SIGNAL \RD1E_Out[0]~output_o\ : std_logic;
SIGNAL \RD1E_Out[1]~output_o\ : std_logic;
SIGNAL \RD1E_Out[2]~output_o\ : std_logic;
SIGNAL \RD1E_Out[3]~output_o\ : std_logic;
SIGNAL \RD1E_Out[4]~output_o\ : std_logic;
SIGNAL \RD1E_Out[5]~output_o\ : std_logic;
SIGNAL \RD1E_Out[6]~output_o\ : std_logic;
SIGNAL \RD1E_Out[7]~output_o\ : std_logic;
SIGNAL \RD1E_Out[8]~output_o\ : std_logic;
SIGNAL \RD1E_Out[9]~output_o\ : std_logic;
SIGNAL \RD1E_Out[10]~output_o\ : std_logic;
SIGNAL \RD1E_Out[11]~output_o\ : std_logic;
SIGNAL \RD1E_Out[12]~output_o\ : std_logic;
SIGNAL \RD1E_Out[13]~output_o\ : std_logic;
SIGNAL \RD1E_Out[14]~output_o\ : std_logic;
SIGNAL \RD1E_Out[15]~output_o\ : std_logic;
SIGNAL \RD1E_Out[16]~output_o\ : std_logic;
SIGNAL \RD1E_Out[17]~output_o\ : std_logic;
SIGNAL \RD1E_Out[18]~output_o\ : std_logic;
SIGNAL \RD1E_Out[19]~output_o\ : std_logic;
SIGNAL \RD1E_Out[20]~output_o\ : std_logic;
SIGNAL \RD1E_Out[21]~output_o\ : std_logic;
SIGNAL \RD1E_Out[22]~output_o\ : std_logic;
SIGNAL \RD1E_Out[23]~output_o\ : std_logic;
SIGNAL \RD1E_Out[24]~output_o\ : std_logic;
SIGNAL \RD1E_Out[25]~output_o\ : std_logic;
SIGNAL \RD1E_Out[26]~output_o\ : std_logic;
SIGNAL \RD1E_Out[27]~output_o\ : std_logic;
SIGNAL \RD1E_Out[28]~output_o\ : std_logic;
SIGNAL \RD1E_Out[29]~output_o\ : std_logic;
SIGNAL \RD1E_Out[30]~output_o\ : std_logic;
SIGNAL \RD1E_Out[31]~output_o\ : std_logic;
SIGNAL \RD2E_Out[0]~output_o\ : std_logic;
SIGNAL \RD2E_Out[1]~output_o\ : std_logic;
SIGNAL \RD2E_Out[2]~output_o\ : std_logic;
SIGNAL \RD2E_Out[3]~output_o\ : std_logic;
SIGNAL \RD2E_Out[4]~output_o\ : std_logic;
SIGNAL \RD2E_Out[5]~output_o\ : std_logic;
SIGNAL \RD2E_Out[6]~output_o\ : std_logic;
SIGNAL \RD2E_Out[7]~output_o\ : std_logic;
SIGNAL \RD2E_Out[8]~output_o\ : std_logic;
SIGNAL \RD2E_Out[9]~output_o\ : std_logic;
SIGNAL \RD2E_Out[10]~output_o\ : std_logic;
SIGNAL \RD2E_Out[11]~output_o\ : std_logic;
SIGNAL \RD2E_Out[12]~output_o\ : std_logic;
SIGNAL \RD2E_Out[13]~output_o\ : std_logic;
SIGNAL \RD2E_Out[14]~output_o\ : std_logic;
SIGNAL \RD2E_Out[15]~output_o\ : std_logic;
SIGNAL \RD2E_Out[16]~output_o\ : std_logic;
SIGNAL \RD2E_Out[17]~output_o\ : std_logic;
SIGNAL \RD2E_Out[18]~output_o\ : std_logic;
SIGNAL \RD2E_Out[19]~output_o\ : std_logic;
SIGNAL \RD2E_Out[20]~output_o\ : std_logic;
SIGNAL \RD2E_Out[21]~output_o\ : std_logic;
SIGNAL \RD2E_Out[22]~output_o\ : std_logic;
SIGNAL \RD2E_Out[23]~output_o\ : std_logic;
SIGNAL \RD2E_Out[24]~output_o\ : std_logic;
SIGNAL \RD2E_Out[25]~output_o\ : std_logic;
SIGNAL \RD2E_Out[26]~output_o\ : std_logic;
SIGNAL \RD2E_Out[27]~output_o\ : std_logic;
SIGNAL \RD2E_Out[28]~output_o\ : std_logic;
SIGNAL \RD2E_Out[29]~output_o\ : std_logic;
SIGNAL \RD2E_Out[30]~output_o\ : std_logic;
SIGNAL \RD2E_Out[31]~output_o\ : std_logic;
SIGNAL \WA3M_Out[0]~output_o\ : std_logic;
SIGNAL \WA3M_Out[1]~output_o\ : std_logic;
SIGNAL \WA3M_Out[2]~output_o\ : std_logic;
SIGNAL \WA3M_Out[3]~output_o\ : std_logic;
SIGNAL \WA3W_Out[0]~output_o\ : std_logic;
SIGNAL \WA3W_Out[1]~output_o\ : std_logic;
SIGNAL \WA3W_Out[2]~output_o\ : std_logic;
SIGNAL \WA3W_Out[3]~output_o\ : std_logic;
SIGNAL \WA3E_Out[0]~output_o\ : std_logic;
SIGNAL \WA3E_Out[1]~output_o\ : std_logic;
SIGNAL \WA3E_Out[2]~output_o\ : std_logic;
SIGNAL \WA3E_Out[3]~output_o\ : std_logic;
SIGNAL \RD1D_Out[0]~output_o\ : std_logic;
SIGNAL \RD1D_Out[1]~output_o\ : std_logic;
SIGNAL \RD1D_Out[2]~output_o\ : std_logic;
SIGNAL \RD1D_Out[3]~output_o\ : std_logic;
SIGNAL \RD1D_Out[4]~output_o\ : std_logic;
SIGNAL \RD1D_Out[5]~output_o\ : std_logic;
SIGNAL \RD1D_Out[6]~output_o\ : std_logic;
SIGNAL \RD1D_Out[7]~output_o\ : std_logic;
SIGNAL \RD1D_Out[8]~output_o\ : std_logic;
SIGNAL \RD1D_Out[9]~output_o\ : std_logic;
SIGNAL \RD1D_Out[10]~output_o\ : std_logic;
SIGNAL \RD1D_Out[11]~output_o\ : std_logic;
SIGNAL \RD1D_Out[12]~output_o\ : std_logic;
SIGNAL \RD1D_Out[13]~output_o\ : std_logic;
SIGNAL \RD1D_Out[14]~output_o\ : std_logic;
SIGNAL \RD1D_Out[15]~output_o\ : std_logic;
SIGNAL \RD1D_Out[16]~output_o\ : std_logic;
SIGNAL \RD1D_Out[17]~output_o\ : std_logic;
SIGNAL \RD1D_Out[18]~output_o\ : std_logic;
SIGNAL \RD1D_Out[19]~output_o\ : std_logic;
SIGNAL \RD1D_Out[20]~output_o\ : std_logic;
SIGNAL \RD1D_Out[21]~output_o\ : std_logic;
SIGNAL \RD1D_Out[22]~output_o\ : std_logic;
SIGNAL \RD1D_Out[23]~output_o\ : std_logic;
SIGNAL \RD1D_Out[24]~output_o\ : std_logic;
SIGNAL \RD1D_Out[25]~output_o\ : std_logic;
SIGNAL \RD1D_Out[26]~output_o\ : std_logic;
SIGNAL \RD1D_Out[27]~output_o\ : std_logic;
SIGNAL \RD1D_Out[28]~output_o\ : std_logic;
SIGNAL \RD1D_Out[29]~output_o\ : std_logic;
SIGNAL \RD1D_Out[30]~output_o\ : std_logic;
SIGNAL \RD1D_Out[31]~output_o\ : std_logic;
SIGNAL \RD2D_Out[0]~output_o\ : std_logic;
SIGNAL \RD2D_Out[1]~output_o\ : std_logic;
SIGNAL \RD2D_Out[2]~output_o\ : std_logic;
SIGNAL \RD2D_Out[3]~output_o\ : std_logic;
SIGNAL \RD2D_Out[4]~output_o\ : std_logic;
SIGNAL \RD2D_Out[5]~output_o\ : std_logic;
SIGNAL \RD2D_Out[6]~output_o\ : std_logic;
SIGNAL \RD2D_Out[7]~output_o\ : std_logic;
SIGNAL \RD2D_Out[8]~output_o\ : std_logic;
SIGNAL \RD2D_Out[9]~output_o\ : std_logic;
SIGNAL \RD2D_Out[10]~output_o\ : std_logic;
SIGNAL \RD2D_Out[11]~output_o\ : std_logic;
SIGNAL \RD2D_Out[12]~output_o\ : std_logic;
SIGNAL \RD2D_Out[13]~output_o\ : std_logic;
SIGNAL \RD2D_Out[14]~output_o\ : std_logic;
SIGNAL \RD2D_Out[15]~output_o\ : std_logic;
SIGNAL \RD2D_Out[16]~output_o\ : std_logic;
SIGNAL \RD2D_Out[17]~output_o\ : std_logic;
SIGNAL \RD2D_Out[18]~output_o\ : std_logic;
SIGNAL \RD2D_Out[19]~output_o\ : std_logic;
SIGNAL \RD2D_Out[20]~output_o\ : std_logic;
SIGNAL \RD2D_Out[21]~output_o\ : std_logic;
SIGNAL \RD2D_Out[22]~output_o\ : std_logic;
SIGNAL \RD2D_Out[23]~output_o\ : std_logic;
SIGNAL \RD2D_Out[24]~output_o\ : std_logic;
SIGNAL \RD2D_Out[25]~output_o\ : std_logic;
SIGNAL \RD2D_Out[26]~output_o\ : std_logic;
SIGNAL \RD2D_Out[27]~output_o\ : std_logic;
SIGNAL \RD2D_Out[28]~output_o\ : std_logic;
SIGNAL \RD2D_Out[29]~output_o\ : std_logic;
SIGNAL \RD2D_Out[30]~output_o\ : std_logic;
SIGNAL \RD2D_Out[31]~output_o\ : std_logic;
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
SIGNAL \PC_Out[0]~output_o\ : std_logic;
SIGNAL \PC_Out[1]~output_o\ : std_logic;
SIGNAL \PC_Out[2]~output_o\ : std_logic;
SIGNAL \PC_Out[3]~output_o\ : std_logic;
SIGNAL \PC_Out[4]~output_o\ : std_logic;
SIGNAL \PC_Out[5]~output_o\ : std_logic;
SIGNAL \PC_Out[6]~output_o\ : std_logic;
SIGNAL \PC_Out[7]~output_o\ : std_logic;
SIGNAL \PC_Out[8]~output_o\ : std_logic;
SIGNAL \PC_Out[9]~output_o\ : std_logic;
SIGNAL \PC_Out[10]~output_o\ : std_logic;
SIGNAL \PC_Out[11]~output_o\ : std_logic;
SIGNAL \PC_Out[12]~output_o\ : std_logic;
SIGNAL \PC_Out[13]~output_o\ : std_logic;
SIGNAL \PC_Out[14]~output_o\ : std_logic;
SIGNAL \PC_Out[15]~output_o\ : std_logic;
SIGNAL \PC_Out[16]~output_o\ : std_logic;
SIGNAL \PC_Out[17]~output_o\ : std_logic;
SIGNAL \PC_Out[18]~output_o\ : std_logic;
SIGNAL \PC_Out[19]~output_o\ : std_logic;
SIGNAL \PC_Out[20]~output_o\ : std_logic;
SIGNAL \PC_Out[21]~output_o\ : std_logic;
SIGNAL \PC_Out[22]~output_o\ : std_logic;
SIGNAL \PC_Out[23]~output_o\ : std_logic;
SIGNAL \PC_Out[24]~output_o\ : std_logic;
SIGNAL \PC_Out[25]~output_o\ : std_logic;
SIGNAL \PC_Out[26]~output_o\ : std_logic;
SIGNAL \PC_Out[27]~output_o\ : std_logic;
SIGNAL \PC_Out[28]~output_o\ : std_logic;
SIGNAL \PC_Out[29]~output_o\ : std_logic;
SIGNAL \PC_Out[30]~output_o\ : std_logic;
SIGNAL \PC_Out[31]~output_o\ : std_logic;
SIGNAL \ALUControlE[3]~input_o\ : std_logic;
SIGNAL \ALUControlE[2]~input_o\ : std_logic;
SIGNAL \ALUControlE[0]~input_o\ : std_logic;
SIGNAL \shamt[4]~input_o\ : std_logic;
SIGNAL \shamt[2]~input_o\ : std_logic;
SIGNAL \shamt[3]~input_o\ : std_logic;
SIGNAL \My_Shifter|ShiftLeft0~5_combout\ : std_logic;
SIGNAL \ForwardAE[1]~input_o\ : std_logic;
SIGNAL \ForwardAE[0]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \ALUControlE[1]~input_o\ : std_logic;
SIGNAL \My_ALU|Add0~0_combout\ : std_logic;
SIGNAL \ForwardBE[0]~input_o\ : std_logic;
SIGNAL \ForwardBE[1]~input_o\ : std_logic;
SIGNAL \MemtoRegW~input_o\ : std_logic;
SIGNAL \ALUOut_Memory_to_WriteBack|OUT~0_combout\ : std_logic;
SIGNAL \MemWriteM~input_o\ : std_logic;
SIGNAL \FlushE~input_o\ : std_logic;
SIGNAL \RegWriteW~input_o\ : std_logic;
SIGNAL \BL_ctrl~input_o\ : std_logic;
SIGNAL \StallD~input_o\ : std_logic;
SIGNAL \BranchTakenE~input_o\ : std_logic;
SIGNAL \MUX9|output_value[0]~0_combout\ : std_logic;
SIGNAL \PCSrcW~input_o\ : std_logic;
SIGNAL \MUX1|output_value[0]~16_combout\ : std_logic;
SIGNAL \My_Shifter|ShiftLeft0~4_combout\ : std_logic;
SIGNAL \My_ALU|Mux31~0_combout\ : std_logic;
SIGNAL \My_ALU|Mux31~1_combout\ : std_logic;
SIGNAL \My_ALU|Mux31~2_combout\ : std_logic;
SIGNAL \My_ALU|Mux31~5_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~0_combout\ : std_logic;
SIGNAL \StallF~input_o\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT[23]~1_combout\ : std_logic;
SIGNAL \PCPlus4_Fetch_to_Decode|OUT~0_combout\ : std_logic;
SIGNAL \FlushD~input_o\ : std_logic;
SIGNAL \PCPlus4_Fetch_to_Decode|OUT~1_combout\ : std_logic;
SIGNAL \PCPlus4_Decode_to_Execute|OUT~0_combout\ : std_logic;
SIGNAL \PCPlus4_Execute_to_Memory|OUT~0_combout\ : std_logic;
SIGNAL \PCPlus4_Memory_to_WriteBack|OUT~0_combout\ : std_logic;
SIGNAL \My_RegFile|registers[0].Reg|OUT[0]~0_combout\ : std_logic;
SIGNAL \My_RegFile|registers[0].Reg|OUT[0]~1_combout\ : std_logic;
SIGNAL \RD2_Decode_to_Execute|OUT~0_combout\ : std_logic;
SIGNAL \WriteData_Execute_to_Memory|OUT~0_combout\ : std_logic;
SIGNAL \Data_Memory|mem[1][0]~0_combout\ : std_logic;
SIGNAL \Data_Memory|mem[1][0]~q\ : std_logic;
SIGNAL \Data_Memory|mem[0][0]~1_combout\ : std_logic;
SIGNAL \Data_Memory|mem[0][0]~q\ : std_logic;
SIGNAL \Data_Memory|Mux7~0_combout\ : std_logic;
SIGNAL \My_Shifter|ShiftLeft0~2_combout\ : std_logic;
SIGNAL \shamt[1]~input_o\ : std_logic;
SIGNAL \shamt[0]~input_o\ : std_logic;
SIGNAL \My_Shifter|ShiftLeft0~1_combout\ : std_logic;
SIGNAL \ALUSrcE~input_o\ : std_logic;
SIGNAL \My_Shifter|ShiftLeft0~0_combout\ : std_logic;
SIGNAL \My_Shifter|ShiftLeft0~3_combout\ : std_logic;
SIGNAL \My_ALU|Add0~1_combout\ : std_logic;
SIGNAL \My_ALU|Mux31~3_combout\ : std_logic;
SIGNAL \My_ALU|Mux31~4_combout\ : std_logic;
SIGNAL \ALUResult_Execute_to_Memory|OUT~0_combout\ : std_logic;
SIGNAL \RegSrcD[0]~input_o\ : std_logic;
SIGNAL \RD1_Decode_to_Execute|OUT~0_combout\ : std_logic;
SIGNAL \MUX6|Mux31~0_combout\ : std_logic;
SIGNAL \MUX6|Mux31~1_combout\ : std_logic;
SIGNAL \My_ALU|Add0~2_combout\ : std_logic;
SIGNAL \My_ALU|Mux1~0_combout\ : std_logic;
SIGNAL \My_ALU|Mux0~0_combout\ : std_logic;
SIGNAL \My_ALU|Mux0~1_combout\ : std_logic;
SIGNAL \My_ALU|Mux30~0_combout\ : std_logic;
SIGNAL \My_ALU|Mux30~1_combout\ : std_logic;
SIGNAL \My_ALU|Mux30~2_combout\ : std_logic;
SIGNAL \My_ALU|Mux30~3_combout\ : std_logic;
SIGNAL \My_ALU|WideOr0~0_combout\ : std_logic;
SIGNAL \My_ALU|WideOr0~1_combout\ : std_logic;
SIGNAL \My_ALU|Mux32~0_combout\ : std_logic;
SIGNAL \My_ALU|Mux32~1_combout\ : std_logic;
SIGNAL \My_RegFile|mux_0|Mux31~0_combout\ : std_logic;
SIGNAL \Switches[0]~input_o\ : std_logic;
SIGNAL \Switches[1]~input_o\ : std_logic;
SIGNAL \Switches[3]~input_o\ : std_logic;
SIGNAL \Switches[2]~input_o\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux31~0_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux30~0_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux31~1_combout\ : std_logic;
SIGNAL \MUX1|output_value[1]~18_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~2_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux30~1_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~3_combout\ : std_logic;
SIGNAL \MUX1|output_value[2]~20_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~4_combout\ : std_logic;
SIGNAL \My_Adder|OUT[2]~0_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux29~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~5_combout\ : std_logic;
SIGNAL \My_Adder|OUT[2]~1\ : std_logic;
SIGNAL \My_Adder|OUT[3]~2_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux28~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~6_combout\ : std_logic;
SIGNAL \My_Adder|OUT[3]~3\ : std_logic;
SIGNAL \My_Adder|OUT[4]~4_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux27~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~7_combout\ : std_logic;
SIGNAL \My_Adder|OUT[4]~5\ : std_logic;
SIGNAL \My_Adder|OUT[5]~6_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux26~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~8_combout\ : std_logic;
SIGNAL \My_Adder|OUT[5]~7\ : std_logic;
SIGNAL \My_Adder|OUT[6]~8_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux25~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~9_combout\ : std_logic;
SIGNAL \My_Adder|OUT[6]~9\ : std_logic;
SIGNAL \My_Adder|OUT[7]~10_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux24~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~10_combout\ : std_logic;
SIGNAL \My_Adder|OUT[7]~11\ : std_logic;
SIGNAL \My_Adder|OUT[8]~12_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux23~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~11_combout\ : std_logic;
SIGNAL \My_Adder|OUT[8]~13\ : std_logic;
SIGNAL \My_Adder|OUT[9]~14_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux22~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~12_combout\ : std_logic;
SIGNAL \My_Adder|OUT[9]~15\ : std_logic;
SIGNAL \My_Adder|OUT[10]~16_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux21~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~13_combout\ : std_logic;
SIGNAL \My_Adder|OUT[10]~17\ : std_logic;
SIGNAL \My_Adder|OUT[11]~18_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux20~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~14_combout\ : std_logic;
SIGNAL \My_Adder|OUT[11]~19\ : std_logic;
SIGNAL \My_Adder|OUT[12]~20_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux19~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~15_combout\ : std_logic;
SIGNAL \My_Adder|OUT[12]~21\ : std_logic;
SIGNAL \My_Adder|OUT[13]~22_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux18~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~16_combout\ : std_logic;
SIGNAL \My_Adder|OUT[13]~23\ : std_logic;
SIGNAL \My_Adder|OUT[14]~24_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux17~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~17_combout\ : std_logic;
SIGNAL \My_Adder|OUT[14]~25\ : std_logic;
SIGNAL \My_Adder|OUT[15]~26_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux16~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~18_combout\ : std_logic;
SIGNAL \My_Adder|OUT[15]~27\ : std_logic;
SIGNAL \My_Adder|OUT[16]~28_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux15~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~19_combout\ : std_logic;
SIGNAL \My_Adder|OUT[16]~29\ : std_logic;
SIGNAL \My_Adder|OUT[17]~30_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux14~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~20_combout\ : std_logic;
SIGNAL \My_Adder|OUT[17]~31\ : std_logic;
SIGNAL \My_Adder|OUT[18]~32_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux13~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~21_combout\ : std_logic;
SIGNAL \My_Adder|OUT[18]~33\ : std_logic;
SIGNAL \My_Adder|OUT[19]~34_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux12~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~22_combout\ : std_logic;
SIGNAL \My_Adder|OUT[19]~35\ : std_logic;
SIGNAL \My_Adder|OUT[20]~36_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux11~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~23_combout\ : std_logic;
SIGNAL \My_Adder|OUT[20]~37\ : std_logic;
SIGNAL \My_Adder|OUT[21]~38_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux10~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~24_combout\ : std_logic;
SIGNAL \My_Adder|OUT[21]~39\ : std_logic;
SIGNAL \My_Adder|OUT[22]~40_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux9~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~25_combout\ : std_logic;
SIGNAL \My_Adder|OUT[22]~41\ : std_logic;
SIGNAL \My_Adder|OUT[23]~42_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux8~0_combout\ : std_logic;
SIGNAL \My_ALU|Add0~3_combout\ : std_logic;
SIGNAL \MUX1|output_value[24]~43_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~26_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~27_combout\ : std_logic;
SIGNAL \My_Adder|OUT[23]~43\ : std_logic;
SIGNAL \My_Adder|OUT[24]~44_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux7~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~28_combout\ : std_logic;
SIGNAL \My_Adder|OUT[24]~45\ : std_logic;
SIGNAL \My_Adder|OUT[25]~46_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux6~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~29_combout\ : std_logic;
SIGNAL \My_Adder|OUT[25]~47\ : std_logic;
SIGNAL \My_Adder|OUT[26]~48_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux5~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~30_combout\ : std_logic;
SIGNAL \My_Adder|OUT[26]~49\ : std_logic;
SIGNAL \My_Adder|OUT[27]~50_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux4~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~31_combout\ : std_logic;
SIGNAL \My_Adder|OUT[27]~51\ : std_logic;
SIGNAL \My_Adder|OUT[28]~52_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux3~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~32_combout\ : std_logic;
SIGNAL \My_Adder|OUT[28]~53\ : std_logic;
SIGNAL \My_Adder|OUT[29]~54_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux2~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~33_combout\ : std_logic;
SIGNAL \My_Adder|OUT[29]~55\ : std_logic;
SIGNAL \My_Adder|OUT[30]~56_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux1~0_combout\ : std_logic;
SIGNAL \Fetch_Pipeline_Register|OUT~34_combout\ : std_logic;
SIGNAL \My_Adder|OUT[30]~57\ : std_logic;
SIGNAL \My_Adder|OUT[31]~58_combout\ : std_logic;
SIGNAL \My_RegFile|mux_2|Mux0~0_combout\ : std_logic;
SIGNAL \MUX1|output_value[0]~17_combout\ : std_logic;
SIGNAL \MUX1|output_value[2]~19_combout\ : std_logic;
SIGNAL \MUX1|output_value[2]~21_combout\ : std_logic;
SIGNAL \MUX1|output_value[3]~22_combout\ : std_logic;
SIGNAL \MUX1|output_value[4]~23_combout\ : std_logic;
SIGNAL \MUX1|output_value[5]~24_combout\ : std_logic;
SIGNAL \MUX1|output_value[6]~25_combout\ : std_logic;
SIGNAL \MUX1|output_value[7]~26_combout\ : std_logic;
SIGNAL \MUX1|output_value[8]~27_combout\ : std_logic;
SIGNAL \MUX1|output_value[9]~28_combout\ : std_logic;
SIGNAL \MUX1|output_value[10]~29_combout\ : std_logic;
SIGNAL \MUX1|output_value[11]~30_combout\ : std_logic;
SIGNAL \MUX1|output_value[12]~31_combout\ : std_logic;
SIGNAL \MUX1|output_value[13]~32_combout\ : std_logic;
SIGNAL \MUX1|output_value[14]~33_combout\ : std_logic;
SIGNAL \MUX1|output_value[15]~34_combout\ : std_logic;
SIGNAL \MUX1|output_value[16]~35_combout\ : std_logic;
SIGNAL \MUX1|output_value[17]~36_combout\ : std_logic;
SIGNAL \MUX1|output_value[18]~37_combout\ : std_logic;
SIGNAL \MUX1|output_value[19]~38_combout\ : std_logic;
SIGNAL \MUX1|output_value[20]~39_combout\ : std_logic;
SIGNAL \MUX1|output_value[21]~40_combout\ : std_logic;
SIGNAL \MUX1|output_value[22]~41_combout\ : std_logic;
SIGNAL \MUX1|output_value[23]~42_combout\ : std_logic;
SIGNAL \MUX1|output_value[24]~44_combout\ : std_logic;
SIGNAL \MUX1|output_value[24]~52_combout\ : std_logic;
SIGNAL \MUX1|output_value[25]~45_combout\ : std_logic;
SIGNAL \MUX1|output_value[25]~53_combout\ : std_logic;
SIGNAL \MUX1|output_value[26]~46_combout\ : std_logic;
SIGNAL \MUX1|output_value[26]~54_combout\ : std_logic;
SIGNAL \MUX1|output_value[27]~47_combout\ : std_logic;
SIGNAL \MUX1|output_value[27]~55_combout\ : std_logic;
SIGNAL \MUX1|output_value[28]~48_combout\ : std_logic;
SIGNAL \MUX1|output_value[28]~56_combout\ : std_logic;
SIGNAL \MUX1|output_value[29]~49_combout\ : std_logic;
SIGNAL \MUX1|output_value[29]~57_combout\ : std_logic;
SIGNAL \MUX1|output_value[30]~50_combout\ : std_logic;
SIGNAL \MUX1|output_value[30]~58_combout\ : std_logic;
SIGNAL \MUX1|output_value[31]~51_combout\ : std_logic;
SIGNAL \MUX1|output_value[31]~59_combout\ : std_logic;
SIGNAL \PCPlus4_Fetch_to_Decode|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \RD_Memory_to_WriteBack|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \PCPlus4_Decode_to_Execute|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \PCPlus4_Execute_to_Memory|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \PCPlus4_Memory_to_WriteBack|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \RD1_Decode_to_Execute|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \RD2_Decode_to_Execute|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALUOut_Memory_to_WriteBack|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \Fetch_Pipeline_Register|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALUResult_Execute_to_Memory|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \WriteData_Execute_to_Memory|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \My_RegFile|registers[0].Reg|OUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \My_ALU|ALT_INV_WideOr0~1_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_PCSrcW <= PCSrcW;
ww_BranchTakenE <= BranchTakenE;
ww_RegSrcD <= RegSrcD;
ww_ALUSrcE <= ALUSrcE;
ww_BL_ctrl <= BL_ctrl;
ww_shamt <= shamt;
ww_shifter_ctrl <= shifter_ctrl;
ww_MemWriteM <= MemWriteM;
ww_MemtoRegW <= MemtoRegW;
ww_ImmSrcD <= ImmSrcD;
ww_RegWriteW <= RegWriteW;
ww_StallF <= StallF;
ww_StallD <= StallD;
ww_FlushD <= FlushD;
ww_FlushE <= FlushE;
ww_ForwardAE <= ForwardAE;
ww_ForwardBE <= ForwardBE;
ww_ALUControlE <= ALUControlE;
Op <= ww_Op;
Funct <= ww_Funct;
Rd <= ww_Rd;
Cond <= ww_Cond;
Src2 <= ww_Src2;
ALUFlags <= ww_ALUFlags;
RD1E_Out <= ww_RD1E_Out;
RD2E_Out <= ww_RD2E_Out;
WA3M_Out <= ww_WA3M_Out;
WA3W_Out <= ww_WA3W_Out;
WA3E_Out <= ww_WA3E_Out;
RD1D_Out <= ww_RD1D_Out;
RD2D_Out <= ww_RD2D_Out;
ww_Switches <= Switches;
HEX_Debug <= ww_HEX_Debug;
PC_Out <= ww_PC_Out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clk~inputclkctrl_outclk\ <= NOT \clk~inputclkctrl_outclk\;
\My_ALU|ALT_INV_WideOr0~1_combout\ <= NOT \My_ALU|WideOr0~1_combout\;

-- Location: IOOBUF_X44_Y0_N23
\Op[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Op[0]~output_o\);

-- Location: IOOBUF_X86_Y0_N2
\Op[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Op[1]~output_o\);

-- Location: IOOBUF_X32_Y91_N23
\Funct[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Funct[0]~output_o\);

-- Location: IOOBUF_X39_Y91_N9
\Funct[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Funct[1]~output_o\);

-- Location: IOOBUF_X32_Y0_N2
\Funct[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Funct[2]~output_o\);

-- Location: IOOBUF_X117_Y7_N9
\Funct[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Funct[3]~output_o\);

-- Location: IOOBUF_X108_Y91_N16
\Funct[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Funct[4]~output_o\);

-- Location: IOOBUF_X99_Y91_N16
\Rd[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Rd[0]~output_o\);

-- Location: IOOBUF_X30_Y91_N2
\Rd[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Rd[1]~output_o\);

-- Location: IOOBUF_X10_Y0_N2
\Rd[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Rd[2]~output_o\);

-- Location: IOOBUF_X92_Y0_N23
\Rd[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Rd[3]~output_o\);

-- Location: IOOBUF_X99_Y0_N2
\Cond[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Cond[0]~output_o\);

-- Location: IOOBUF_X30_Y91_N23
\Cond[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Cond[1]~output_o\);

-- Location: IOOBUF_X66_Y0_N2
\Cond[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Cond[2]~output_o\);

-- Location: IOOBUF_X48_Y0_N2
\Cond[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Cond[3]~output_o\);

-- Location: IOOBUF_X97_Y0_N9
\Src2[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[0]~output_o\);

-- Location: IOOBUF_X19_Y91_N9
\Src2[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[1]~output_o\);

-- Location: IOOBUF_X24_Y0_N16
\Src2[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N9
\Src2[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[3]~output_o\);

-- Location: IOOBUF_X21_Y91_N16
\Src2[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[4]~output_o\);

-- Location: IOOBUF_X117_Y14_N2
\Src2[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[5]~output_o\);

-- Location: IOOBUF_X75_Y0_N16
\Src2[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[6]~output_o\);

-- Location: IOOBUF_X70_Y0_N9
\Src2[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[7]~output_o\);

-- Location: IOOBUF_X92_Y0_N16
\Src2[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[8]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\Src2[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[9]~output_o\);

-- Location: IOOBUF_X8_Y91_N2
\Src2[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[10]~output_o\);

-- Location: IOOBUF_X88_Y91_N9
\Src2[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Src2[11]~output_o\);

-- Location: IOOBUF_X115_Y91_N2
\ALUFlags[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_ALU|ALT_INV_WideOr0~1_combout\,
	devoe => ww_devoe,
	o => \ALUFlags[0]~output_o\);

-- Location: IOOBUF_X117_Y61_N2
\ALUFlags[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_ALU|Mux0~1_combout\,
	devoe => ww_devoe,
	o => \ALUFlags[1]~output_o\);

-- Location: IOOBUF_X84_Y0_N2
\ALUFlags[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ALUFlags[2]~output_o\);

-- Location: IOOBUF_X117_Y36_N2
\ALUFlags[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_ALU|Mux32~1_combout\,
	devoe => ww_devoe,
	o => \ALUFlags[3]~output_o\);

-- Location: IOOBUF_X117_Y31_N9
\RD1E_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RD1_Decode_to_Execute|OUT\(0),
	devoe => ww_devoe,
	o => \RD1E_Out[0]~output_o\);

-- Location: IOOBUF_X61_Y0_N23
\RD1E_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[1]~output_o\);

-- Location: IOOBUF_X32_Y91_N9
\RD1E_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[2]~output_o\);

-- Location: IOOBUF_X19_Y0_N2
\RD1E_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[3]~output_o\);

-- Location: IOOBUF_X99_Y91_N23
\RD1E_Out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[4]~output_o\);

-- Location: IOOBUF_X41_Y0_N16
\RD1E_Out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[5]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\RD1E_Out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[6]~output_o\);

-- Location: IOOBUF_X32_Y91_N16
\RD1E_Out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[7]~output_o\);

-- Location: IOOBUF_X75_Y0_N2
\RD1E_Out[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[8]~output_o\);

-- Location: IOOBUF_X44_Y91_N9
\RD1E_Out[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[9]~output_o\);

-- Location: IOOBUF_X77_Y0_N9
\RD1E_Out[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[10]~output_o\);

-- Location: IOOBUF_X5_Y91_N2
\RD1E_Out[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[11]~output_o\);

-- Location: IOOBUF_X15_Y0_N2
\RD1E_Out[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[12]~output_o\);

-- Location: IOOBUF_X86_Y91_N9
\RD1E_Out[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[13]~output_o\);

-- Location: IOOBUF_X82_Y0_N16
\RD1E_Out[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[14]~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\RD1E_Out[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[15]~output_o\);

-- Location: IOOBUF_X70_Y91_N2
\RD1E_Out[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[16]~output_o\);

-- Location: IOOBUF_X86_Y91_N16
\RD1E_Out[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[17]~output_o\);

-- Location: IOOBUF_X75_Y0_N9
\RD1E_Out[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[18]~output_o\);

-- Location: IOOBUF_X3_Y91_N2
\RD1E_Out[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[19]~output_o\);

-- Location: IOOBUF_X21_Y91_N2
\RD1E_Out[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[20]~output_o\);

-- Location: IOOBUF_X26_Y91_N2
\RD1E_Out[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[21]~output_o\);

-- Location: IOOBUF_X5_Y91_N23
\RD1E_Out[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[22]~output_o\);

-- Location: IOOBUF_X70_Y91_N9
\RD1E_Out[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[23]~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\RD1E_Out[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[24]~output_o\);

-- Location: IOOBUF_X88_Y0_N9
\RD1E_Out[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[25]~output_o\);

-- Location: IOOBUF_X44_Y0_N16
\RD1E_Out[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[26]~output_o\);

-- Location: IOOBUF_X50_Y0_N16
\RD1E_Out[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[27]~output_o\);

-- Location: IOOBUF_X77_Y91_N9
\RD1E_Out[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[28]~output_o\);

-- Location: IOOBUF_X97_Y91_N2
\RD1E_Out[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[29]~output_o\);

-- Location: IOOBUF_X41_Y91_N2
\RD1E_Out[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[30]~output_o\);

-- Location: IOOBUF_X50_Y91_N23
\RD1E_Out[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1E_Out[31]~output_o\);

-- Location: IOOBUF_X117_Y50_N9
\RD2E_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RD2_Decode_to_Execute|OUT\(0),
	devoe => ww_devoe,
	o => \RD2E_Out[0]~output_o\);

-- Location: IOOBUF_X41_Y0_N23
\RD2E_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[1]~output_o\);

-- Location: IOOBUF_X5_Y0_N2
\RD2E_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[2]~output_o\);

-- Location: IOOBUF_X66_Y0_N9
\RD2E_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[3]~output_o\);

-- Location: IOOBUF_X34_Y0_N16
\RD2E_Out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[4]~output_o\);

-- Location: IOOBUF_X34_Y91_N9
\RD2E_Out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[5]~output_o\);

-- Location: IOOBUF_X30_Y91_N9
\RD2E_Out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[6]~output_o\);

-- Location: IOOBUF_X106_Y91_N2
\RD2E_Out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[7]~output_o\);

-- Location: IOOBUF_X15_Y0_N9
\RD2E_Out[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[8]~output_o\);

-- Location: IOOBUF_X70_Y0_N16
\RD2E_Out[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[9]~output_o\);

-- Location: IOOBUF_X3_Y91_N16
\RD2E_Out[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[10]~output_o\);

-- Location: IOOBUF_X86_Y91_N2
\RD2E_Out[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[11]~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\RD2E_Out[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[12]~output_o\);

-- Location: IOOBUF_X77_Y0_N23
\RD2E_Out[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[13]~output_o\);

-- Location: IOOBUF_X28_Y91_N9
\RD2E_Out[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[14]~output_o\);

-- Location: IOOBUF_X86_Y0_N23
\RD2E_Out[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[15]~output_o\);

-- Location: IOOBUF_X28_Y0_N16
\RD2E_Out[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[16]~output_o\);

-- Location: IOOBUF_X37_Y0_N9
\RD2E_Out[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[17]~output_o\);

-- Location: IOOBUF_X5_Y91_N9
\RD2E_Out[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[18]~output_o\);

-- Location: IOOBUF_X113_Y0_N2
\RD2E_Out[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[19]~output_o\);

-- Location: IOOBUF_X8_Y91_N16
\RD2E_Out[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[20]~output_o\);

-- Location: IOOBUF_X21_Y91_N23
\RD2E_Out[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[21]~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\RD2E_Out[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[22]~output_o\);

-- Location: IOOBUF_X75_Y91_N9
\RD2E_Out[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[23]~output_o\);

-- Location: IOOBUF_X50_Y0_N9
\RD2E_Out[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[24]~output_o\);

-- Location: IOOBUF_X66_Y0_N16
\RD2E_Out[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[25]~output_o\);

-- Location: IOOBUF_X99_Y0_N9
\RD2E_Out[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[26]~output_o\);

-- Location: IOOBUF_X86_Y0_N9
\RD2E_Out[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[27]~output_o\);

-- Location: IOOBUF_X10_Y91_N9
\RD2E_Out[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[28]~output_o\);

-- Location: IOOBUF_X34_Y91_N2
\RD2E_Out[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[29]~output_o\);

-- Location: IOOBUF_X106_Y0_N2
\RD2E_Out[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[30]~output_o\);

-- Location: IOOBUF_X115_Y0_N16
\RD2E_Out[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2E_Out[31]~output_o\);

-- Location: IOOBUF_X39_Y91_N16
\WA3M_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3M_Out[0]~output_o\);

-- Location: IOOBUF_X39_Y91_N23
\WA3M_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3M_Out[1]~output_o\);

-- Location: IOOBUF_X8_Y91_N9
\WA3M_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3M_Out[2]~output_o\);

-- Location: IOOBUF_X50_Y0_N2
\WA3M_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3M_Out[3]~output_o\);

-- Location: IOOBUF_X63_Y91_N23
\WA3W_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3W_Out[0]~output_o\);

-- Location: IOOBUF_X115_Y0_N2
\WA3W_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3W_Out[1]~output_o\);

-- Location: IOOBUF_X44_Y91_N2
\WA3W_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3W_Out[2]~output_o\);

-- Location: IOOBUF_X46_Y91_N16
\WA3W_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3W_Out[3]~output_o\);

-- Location: IOOBUF_X90_Y0_N2
\WA3E_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3E_Out[0]~output_o\);

-- Location: IOOBUF_X46_Y91_N23
\WA3E_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3E_Out[1]~output_o\);

-- Location: IOOBUF_X104_Y0_N16
\WA3E_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3E_Out[2]~output_o\);

-- Location: IOOBUF_X68_Y91_N9
\WA3E_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \WA3E_Out[3]~output_o\);

-- Location: IOOBUF_X117_Y21_N9
\RD1D_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_0|Mux31~0_combout\,
	devoe => ww_devoe,
	o => \RD1D_Out[0]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\RD1D_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[1]~output_o\);

-- Location: IOOBUF_X117_Y13_N9
\RD1D_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[2]~output_o\);

-- Location: IOOBUF_X15_Y0_N16
\RD1D_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[3]~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\RD1D_Out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[4]~output_o\);

-- Location: IOOBUF_X41_Y0_N9
\RD1D_Out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[5]~output_o\);

-- Location: IOOBUF_X101_Y91_N9
\RD1D_Out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[6]~output_o\);

-- Location: IOOBUF_X77_Y91_N2
\RD1D_Out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[7]~output_o\);

-- Location: IOOBUF_X3_Y91_N9
\RD1D_Out[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[8]~output_o\);

-- Location: IOOBUF_X108_Y0_N16
\RD1D_Out[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[9]~output_o\);

-- Location: IOOBUF_X84_Y0_N9
\RD1D_Out[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[10]~output_o\);

-- Location: IOOBUF_X108_Y0_N2
\RD1D_Out[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[11]~output_o\);

-- Location: IOOBUF_X104_Y0_N23
\RD1D_Out[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[12]~output_o\);

-- Location: IOOBUF_X117_Y5_N2
\RD1D_Out[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[13]~output_o\);

-- Location: IOOBUF_X48_Y0_N16
\RD1D_Out[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[14]~output_o\);

-- Location: IOOBUF_X95_Y0_N2
\RD1D_Out[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[15]~output_o\);

-- Location: IOOBUF_X95_Y91_N23
\RD1D_Out[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[16]~output_o\);

-- Location: IOOBUF_X111_Y0_N16
\RD1D_Out[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[17]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\RD1D_Out[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[18]~output_o\);

-- Location: IOOBUF_X95_Y91_N9
\RD1D_Out[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[19]~output_o\);

-- Location: IOOBUF_X37_Y91_N16
\RD1D_Out[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[20]~output_o\);

-- Location: IOOBUF_X82_Y0_N23
\RD1D_Out[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[21]~output_o\);

-- Location: IOOBUF_X95_Y0_N9
\RD1D_Out[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[22]~output_o\);

-- Location: IOOBUF_X41_Y0_N2
\RD1D_Out[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[23]~output_o\);

-- Location: IOOBUF_X97_Y0_N2
\RD1D_Out[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[24]~output_o\);

-- Location: IOOBUF_X46_Y91_N9
\RD1D_Out[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[25]~output_o\);

-- Location: IOOBUF_X48_Y0_N23
\RD1D_Out[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[26]~output_o\);

-- Location: IOOBUF_X28_Y91_N23
\RD1D_Out[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[27]~output_o\);

-- Location: IOOBUF_X34_Y91_N16
\RD1D_Out[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[28]~output_o\);

-- Location: IOOBUF_X108_Y0_N23
\RD1D_Out[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[29]~output_o\);

-- Location: IOOBUF_X39_Y0_N2
\RD1D_Out[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[30]~output_o\);

-- Location: IOOBUF_X88_Y91_N2
\RD1D_Out[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD1D_Out[31]~output_o\);

-- Location: IOOBUF_X117_Y49_N9
\RD2D_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|registers[0].Reg|OUT\(0),
	devoe => ww_devoe,
	o => \RD2D_Out[0]~output_o\);

-- Location: IOOBUF_X99_Y91_N2
\RD2D_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[1]~output_o\);

-- Location: IOOBUF_X46_Y91_N2
\RD2D_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[2]~output_o\);

-- Location: IOOBUF_X5_Y0_N9
\RD2D_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[3]~output_o\);

-- Location: IOOBUF_X84_Y0_N23
\RD2D_Out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[4]~output_o\);

-- Location: IOOBUF_X79_Y91_N23
\RD2D_Out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[5]~output_o\);

-- Location: IOOBUF_X99_Y91_N9
\RD2D_Out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[6]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\RD2D_Out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[7]~output_o\);

-- Location: IOOBUF_X77_Y0_N16
\RD2D_Out[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[8]~output_o\);

-- Location: IOOBUF_X82_Y0_N2
\RD2D_Out[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[9]~output_o\);

-- Location: IOOBUF_X104_Y0_N9
\RD2D_Out[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[10]~output_o\);

-- Location: IOOBUF_X90_Y0_N9
\RD2D_Out[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[11]~output_o\);

-- Location: IOOBUF_X53_Y0_N2
\RD2D_Out[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[12]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\RD2D_Out[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[13]~output_o\);

-- Location: IOOBUF_X75_Y91_N2
\RD2D_Out[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[14]~output_o\);

-- Location: IOOBUF_X39_Y91_N2
\RD2D_Out[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[15]~output_o\);

-- Location: IOOBUF_X117_Y11_N2
\RD2D_Out[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[16]~output_o\);

-- Location: IOOBUF_X37_Y0_N2
\RD2D_Out[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[17]~output_o\);

-- Location: IOOBUF_X115_Y0_N9
\RD2D_Out[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[18]~output_o\);

-- Location: IOOBUF_X17_Y0_N16
\RD2D_Out[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[19]~output_o\);

-- Location: IOOBUF_X15_Y91_N16
\RD2D_Out[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[20]~output_o\);

-- Location: IOOBUF_X48_Y91_N2
\RD2D_Out[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[21]~output_o\);

-- Location: IOOBUF_X66_Y0_N23
\RD2D_Out[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[22]~output_o\);

-- Location: IOOBUF_X48_Y91_N9
\RD2D_Out[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[23]~output_o\);

-- Location: IOOBUF_X5_Y91_N16
\RD2D_Out[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[24]~output_o\);

-- Location: IOOBUF_X34_Y0_N9
\RD2D_Out[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[25]~output_o\);

-- Location: IOOBUF_X37_Y91_N9
\RD2D_Out[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[26]~output_o\);

-- Location: IOOBUF_X17_Y91_N9
\RD2D_Out[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[27]~output_o\);

-- Location: IOOBUF_X79_Y91_N16
\RD2D_Out[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[28]~output_o\);

-- Location: IOOBUF_X99_Y0_N16
\RD2D_Out[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[29]~output_o\);

-- Location: IOOBUF_X92_Y91_N2
\RD2D_Out[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[30]~output_o\);

-- Location: IOOBUF_X86_Y0_N16
\RD2D_Out[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RD2D_Out[31]~output_o\);

-- Location: IOOBUF_X117_Y28_N9
\HEX_Debug[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux31~1_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[0]~output_o\);

-- Location: IOOBUF_X117_Y66_N9
\HEX_Debug[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux30~1_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[1]~output_o\);

-- Location: IOOBUF_X117_Y74_N2
\HEX_Debug[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux29~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[2]~output_o\);

-- Location: IOOBUF_X117_Y81_N2
\HEX_Debug[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux28~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[3]~output_o\);

-- Location: IOOBUF_X117_Y42_N2
\HEX_Debug[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux27~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[4]~output_o\);

-- Location: IOOBUF_X117_Y84_N9
\HEX_Debug[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux26~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[5]~output_o\);

-- Location: IOOBUF_X117_Y62_N2
\HEX_Debug[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux25~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[6]~output_o\);

-- Location: IOOBUF_X117_Y84_N2
\HEX_Debug[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux24~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[7]~output_o\);

-- Location: IOOBUF_X117_Y27_N2
\HEX_Debug[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux23~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[8]~output_o\);

-- Location: IOOBUF_X117_Y26_N9
\HEX_Debug[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux22~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[9]~output_o\);

-- Location: IOOBUF_X117_Y64_N2
\HEX_Debug[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux21~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[10]~output_o\);

-- Location: IOOBUF_X111_Y91_N23
\HEX_Debug[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux20~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[11]~output_o\);

-- Location: IOOBUF_X117_Y83_N9
\HEX_Debug[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux19~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[12]~output_o\);

-- Location: IOOBUF_X111_Y91_N16
\HEX_Debug[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux18~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[13]~output_o\);

-- Location: IOOBUF_X117_Y72_N2
\HEX_Debug[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux17~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[14]~output_o\);

-- Location: IOOBUF_X117_Y70_N2
\HEX_Debug[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux16~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[15]~output_o\);

-- Location: IOOBUF_X117_Y78_N2
\HEX_Debug[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux15~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[16]~output_o\);

-- Location: IOOBUF_X113_Y91_N23
\HEX_Debug[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux14~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[17]~output_o\);

-- Location: IOOBUF_X117_Y61_N9
\HEX_Debug[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux13~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[18]~output_o\);

-- Location: IOOBUF_X117_Y66_N2
\HEX_Debug[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux12~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[19]~output_o\);

-- Location: IOOBUF_X113_Y91_N2
\HEX_Debug[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux11~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[20]~output_o\);

-- Location: IOOBUF_X117_Y60_N16
\HEX_Debug[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux10~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[21]~output_o\);

-- Location: IOOBUF_X117_Y81_N9
\HEX_Debug[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux9~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[22]~output_o\);

-- Location: IOOBUF_X117_Y80_N2
\HEX_Debug[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux8~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[23]~output_o\);

-- Location: IOOBUF_X117_Y55_N2
\HEX_Debug[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux7~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[24]~output_o\);

-- Location: IOOBUF_X117_Y62_N9
\HEX_Debug[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[25]~output_o\);

-- Location: IOOBUF_X115_Y91_N9
\HEX_Debug[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[26]~output_o\);

-- Location: IOOBUF_X117_Y70_N9
\HEX_Debug[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[27]~output_o\);

-- Location: IOOBUF_X117_Y55_N9
\HEX_Debug[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[28]~output_o\);

-- Location: IOOBUF_X117_Y59_N2
\HEX_Debug[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[29]~output_o\);

-- Location: IOOBUF_X117_Y58_N9
\HEX_Debug[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[30]~output_o\);

-- Location: IOOBUF_X117_Y69_N9
\HEX_Debug[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \My_RegFile|mux_2|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \HEX_Debug[31]~output_o\);

-- Location: IOOBUF_X117_Y44_N2
\PC_Out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[0]~17_combout\,
	devoe => ww_devoe,
	o => \PC_Out[0]~output_o\);

-- Location: IOOBUF_X117_Y39_N2
\PC_Out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[1]~18_combout\,
	devoe => ww_devoe,
	o => \PC_Out[1]~output_o\);

-- Location: IOOBUF_X117_Y26_N2
\PC_Out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[2]~21_combout\,
	devoe => ww_devoe,
	o => \PC_Out[2]~output_o\);

-- Location: IOOBUF_X117_Y64_N9
\PC_Out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[3]~22_combout\,
	devoe => ww_devoe,
	o => \PC_Out[3]~output_o\);

-- Location: IOOBUF_X117_Y65_N9
\PC_Out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[4]~23_combout\,
	devoe => ww_devoe,
	o => \PC_Out[4]~output_o\);

-- Location: IOOBUF_X117_Y77_N9
\PC_Out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[5]~24_combout\,
	devoe => ww_devoe,
	o => \PC_Out[5]~output_o\);

-- Location: IOOBUF_X117_Y74_N9
\PC_Out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[6]~25_combout\,
	devoe => ww_devoe,
	o => \PC_Out[6]~output_o\);

-- Location: IOOBUF_X117_Y60_N2
\PC_Out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[7]~26_combout\,
	devoe => ww_devoe,
	o => \PC_Out[7]~output_o\);

-- Location: IOOBUF_X117_Y27_N9
\PC_Out[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[8]~27_combout\,
	devoe => ww_devoe,
	o => \PC_Out[8]~output_o\);

-- Location: IOOBUF_X117_Y69_N2
\PC_Out[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[9]~28_combout\,
	devoe => ww_devoe,
	o => \PC_Out[9]~output_o\);

-- Location: IOOBUF_X117_Y77_N2
\PC_Out[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[10]~29_combout\,
	devoe => ww_devoe,
	o => \PC_Out[10]~output_o\);

-- Location: IOOBUF_X115_Y91_N23
\PC_Out[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[11]~30_combout\,
	devoe => ww_devoe,
	o => \PC_Out[11]~output_o\);

-- Location: IOOBUF_X117_Y80_N9
\PC_Out[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[12]~31_combout\,
	devoe => ww_devoe,
	o => \PC_Out[12]~output_o\);

-- Location: IOOBUF_X117_Y72_N9
\PC_Out[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[13]~32_combout\,
	devoe => ww_devoe,
	o => \PC_Out[13]~output_o\);

-- Location: IOOBUF_X117_Y68_N2
\PC_Out[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[14]~33_combout\,
	devoe => ww_devoe,
	o => \PC_Out[14]~output_o\);

-- Location: IOOBUF_X108_Y91_N9
\PC_Out[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[15]~34_combout\,
	devoe => ww_devoe,
	o => \PC_Out[15]~output_o\);

-- Location: IOOBUF_X108_Y91_N23
\PC_Out[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[16]~35_combout\,
	devoe => ww_devoe,
	o => \PC_Out[16]~output_o\);

-- Location: IOOBUF_X117_Y86_N2
\PC_Out[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[17]~36_combout\,
	devoe => ww_devoe,
	o => \PC_Out[17]~output_o\);

-- Location: IOOBUF_X117_Y65_N2
\PC_Out[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[18]~37_combout\,
	devoe => ww_devoe,
	o => \PC_Out[18]~output_o\);

-- Location: IOOBUF_X115_Y91_N16
\PC_Out[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[19]~38_combout\,
	devoe => ww_devoe,
	o => \PC_Out[19]~output_o\);

-- Location: IOOBUF_X113_Y91_N16
\PC_Out[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[20]~39_combout\,
	devoe => ww_devoe,
	o => \PC_Out[20]~output_o\);

-- Location: IOOBUF_X117_Y60_N9
\PC_Out[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[21]~40_combout\,
	devoe => ww_devoe,
	o => \PC_Out[21]~output_o\);

-- Location: IOOBUF_X117_Y42_N9
\PC_Out[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[22]~41_combout\,
	devoe => ww_devoe,
	o => \PC_Out[22]~output_o\);

-- Location: IOOBUF_X117_Y83_N2
\PC_Out[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[23]~42_combout\,
	devoe => ww_devoe,
	o => \PC_Out[23]~output_o\);

-- Location: IOOBUF_X117_Y57_N9
\PC_Out[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[24]~52_combout\,
	devoe => ww_devoe,
	o => \PC_Out[24]~output_o\);

-- Location: IOOBUF_X117_Y23_N9
\PC_Out[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[25]~53_combout\,
	devoe => ww_devoe,
	o => \PC_Out[25]~output_o\);

-- Location: IOOBUF_X117_Y73_N2
\PC_Out[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[26]~54_combout\,
	devoe => ww_devoe,
	o => \PC_Out[26]~output_o\);

-- Location: IOOBUF_X117_Y73_N9
\PC_Out[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[27]~55_combout\,
	devoe => ww_devoe,
	o => \PC_Out[27]~output_o\);

-- Location: IOOBUF_X117_Y38_N9
\PC_Out[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[28]~56_combout\,
	devoe => ww_devoe,
	o => \PC_Out[28]~output_o\);

-- Location: IOOBUF_X117_Y43_N9
\PC_Out[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[29]~57_combout\,
	devoe => ww_devoe,
	o => \PC_Out[29]~output_o\);

-- Location: IOOBUF_X117_Y43_N2
\PC_Out[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[30]~58_combout\,
	devoe => ww_devoe,
	o => \PC_Out[30]~output_o\);

-- Location: IOOBUF_X117_Y57_N2
\PC_Out[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MUX1|output_value[31]~59_combout\,
	devoe => ww_devoe,
	o => \PC_Out[31]~output_o\);

-- Location: IOIBUF_X117_Y48_N8
\ALUControlE[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUControlE(3),
	o => \ALUControlE[3]~input_o\);

-- Location: IOIBUF_X117_Y56_N8
\ALUControlE[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUControlE(2),
	o => \ALUControlE[2]~input_o\);

-- Location: IOIBUF_X117_Y24_N8
\ALUControlE[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUControlE(0),
	o => \ALUControlE[0]~input_o\);

-- Location: IOIBUF_X117_Y24_N1
\shamt[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shamt(4),
	o => \shamt[4]~input_o\);

-- Location: IOIBUF_X117_Y86_N8
\shamt[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shamt(2),
	o => \shamt[2]~input_o\);

-- Location: IOIBUF_X117_Y36_N8
\shamt[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shamt(3),
	o => \shamt[3]~input_o\);

-- Location: LCCOMB_X116_Y56_N2
\My_Shifter|ShiftLeft0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Shifter|ShiftLeft0~5_combout\ = (\shamt[4]~input_o\) # ((\shamt[2]~input_o\) # (\shamt[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \shamt[4]~input_o\,
	datac => \shamt[2]~input_o\,
	datad => \shamt[3]~input_o\,
	combout => \My_Shifter|ShiftLeft0~5_combout\);

-- Location: IOIBUF_X117_Y34_N8
\ForwardAE[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ForwardAE(1),
	o => \ForwardAE[1]~input_o\);

-- Location: IOIBUF_X117_Y22_N8
\ForwardAE[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ForwardAE(0),
	o => \ForwardAE[0]~input_o\);

-- Location: IOIBUF_X57_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G29
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

-- Location: IOIBUF_X117_Y51_N1
\reset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X117_Y56_N1
\ALUControlE[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUControlE(1),
	o => \ALUControlE[1]~input_o\);

-- Location: LCCOMB_X115_Y56_N24
\My_ALU|Add0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Add0~0_combout\ = (\ALUControlE[1]~input_o\ & (!\ALUControlE[3]~input_o\ & !\ALUControlE[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[1]~input_o\,
	datac => \ALUControlE[3]~input_o\,
	datad => \ALUControlE[2]~input_o\,
	combout => \My_ALU|Add0~0_combout\);

-- Location: IOIBUF_X117_Y31_N1
\ForwardBE[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ForwardBE(0),
	o => \ForwardBE[0]~input_o\);

-- Location: IOIBUF_X117_Y22_N1
\ForwardBE[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ForwardBE(1),
	o => \ForwardBE[1]~input_o\);

-- Location: IOIBUF_X117_Y33_N1
\MemtoRegW~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MemtoRegW,
	o => \MemtoRegW~input_o\);

-- Location: LCCOMB_X116_Y53_N22
\ALUOut_Memory_to_WriteBack|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALUOut_Memory_to_WriteBack|OUT~0_combout\ = (\ALUResult_Execute_to_Memory|OUT\(0) & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ALUResult_Execute_to_Memory|OUT\(0),
	datad => \reset~input_o\,
	combout => \ALUOut_Memory_to_WriteBack|OUT~0_combout\);

-- Location: FF_X116_Y53_N23
\ALUOut_Memory_to_WriteBack|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ALUOut_Memory_to_WriteBack|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALUOut_Memory_to_WriteBack|OUT\(0));

-- Location: IOIBUF_X117_Y44_N8
\MemWriteM~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MemWriteM,
	o => \MemWriteM~input_o\);

-- Location: IOIBUF_X117_Y50_N1
\FlushE~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FlushE,
	o => \FlushE~input_o\);

-- Location: IOIBUF_X117_Y35_N8
\RegWriteW~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RegWriteW,
	o => \RegWriteW~input_o\);

-- Location: IOIBUF_X117_Y53_N8
\BL_ctrl~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BL_ctrl,
	o => \BL_ctrl~input_o\);

-- Location: IOIBUF_X117_Y41_N8
\StallD~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_StallD,
	o => \StallD~input_o\);

-- Location: IOIBUF_X117_Y54_N1
\BranchTakenE~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BranchTakenE,
	o => \BranchTakenE~input_o\);

-- Location: LCCOMB_X116_Y53_N0
\MUX9|output_value[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX9|output_value[0]~0_combout\ = (\MemtoRegW~input_o\ & (\ALUOut_Memory_to_WriteBack|OUT\(0))) # (!\MemtoRegW~input_o\ & ((\RD_Memory_to_WriteBack|OUT\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MemtoRegW~input_o\,
	datac => \ALUOut_Memory_to_WriteBack|OUT\(0),
	datad => \RD_Memory_to_WriteBack|OUT\(0),
	combout => \MUX9|output_value[0]~0_combout\);

-- Location: IOIBUF_X117_Y51_N8
\PCSrcW~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCSrcW,
	o => \PCSrcW~input_o\);

-- Location: LCCOMB_X116_Y52_N6
\MUX1|output_value[0]~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[0]~16_combout\ = (!\BranchTakenE~input_o\ & ((\PCSrcW~input_o\ & (\MUX9|output_value[0]~0_combout\)) # (!\PCSrcW~input_o\ & ((\Fetch_Pipeline_Register|OUT\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX9|output_value[0]~0_combout\,
	datab => \PCSrcW~input_o\,
	datac => \Fetch_Pipeline_Register|OUT\(0),
	datad => \BranchTakenE~input_o\,
	combout => \MUX1|output_value[0]~16_combout\);

-- Location: LCCOMB_X116_Y56_N16
\My_Shifter|ShiftLeft0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Shifter|ShiftLeft0~4_combout\ = (\shamt[2]~input_o\) # ((\shamt[3]~input_o\) # ((\shamt[4]~input_o\) # (\My_Shifter|ShiftLeft0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \shamt[2]~input_o\,
	datab => \shamt[3]~input_o\,
	datac => \shamt[4]~input_o\,
	datad => \My_Shifter|ShiftLeft0~3_combout\,
	combout => \My_Shifter|ShiftLeft0~4_combout\);

-- Location: LCCOMB_X116_Y56_N22
\My_ALU|Mux31~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux31~0_combout\ = \My_Shifter|ShiftLeft0~4_combout\ $ (((\MUX6|Mux31~1_combout\ & ((!\ALUControlE[0]~input_o\) # (!\ALUControlE[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[3]~input_o\,
	datab => \MUX6|Mux31~1_combout\,
	datac => \ALUControlE[0]~input_o\,
	datad => \My_Shifter|ShiftLeft0~4_combout\,
	combout => \My_ALU|Mux31~0_combout\);

-- Location: LCCOMB_X116_Y56_N20
\My_ALU|Mux31~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux31~1_combout\ = (\ALUControlE[3]~input_o\ & (((\MUX6|Mux31~1_combout\ & !\ALUControlE[0]~input_o\)) # (!\My_Shifter|ShiftLeft0~4_combout\))) # (!\ALUControlE[3]~input_o\ & (\MUX6|Mux31~1_combout\ $ (((!\My_Shifter|ShiftLeft0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[3]~input_o\,
	datab => \MUX6|Mux31~1_combout\,
	datac => \ALUControlE[0]~input_o\,
	datad => \My_Shifter|ShiftLeft0~4_combout\,
	combout => \My_ALU|Mux31~1_combout\);

-- Location: LCCOMB_X116_Y56_N14
\My_ALU|Mux31~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux31~2_combout\ = (\ALUControlE[2]~input_o\ & ((\ALUControlE[1]~input_o\ & (\My_ALU|Mux31~0_combout\)) # (!\ALUControlE[1]~input_o\ & ((\My_ALU|Mux31~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[1]~input_o\,
	datab => \ALUControlE[2]~input_o\,
	datac => \My_ALU|Mux31~0_combout\,
	datad => \My_ALU|Mux31~1_combout\,
	combout => \My_ALU|Mux31~2_combout\);

-- Location: LCCOMB_X116_Y56_N0
\My_ALU|Mux31~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux31~5_combout\ = (\My_ALU|Mux31~2_combout\) # ((!\ALUControlE[3]~input_o\ & \My_ALU|Mux31~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[3]~input_o\,
	datac => \My_ALU|Mux31~2_combout\,
	datad => \My_ALU|Mux31~4_combout\,
	combout => \My_ALU|Mux31~5_combout\);

-- Location: LCCOMB_X116_Y56_N8
\Fetch_Pipeline_Register|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~0_combout\ = (!\reset~input_o\ & ((\MUX1|output_value[0]~16_combout\) # ((\BranchTakenE~input_o\ & \My_ALU|Mux31~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \reset~input_o\,
	datac => \MUX1|output_value[0]~16_combout\,
	datad => \My_ALU|Mux31~5_combout\,
	combout => \Fetch_Pipeline_Register|OUT~0_combout\);

-- Location: IOIBUF_X117_Y23_N1
\StallF~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_StallF,
	o => \StallF~input_o\);

-- Location: LCCOMB_X116_Y55_N0
\Fetch_Pipeline_Register|OUT[23]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT[23]~1_combout\ = (\reset~input_o\) # (!\StallF~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \StallF~input_o\,
	combout => \Fetch_Pipeline_Register|OUT[23]~1_combout\);

-- Location: FF_X116_Y56_N9
\Fetch_Pipeline_Register|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~0_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(0));

-- Location: LCCOMB_X116_Y52_N26
\PCPlus4_Fetch_to_Decode|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCPlus4_Fetch_to_Decode|OUT~0_combout\ = (!\reset~input_o\ & ((\StallD~input_o\ & (\Fetch_Pipeline_Register|OUT\(0))) # (!\StallD~input_o\ & ((\PCPlus4_Fetch_to_Decode|OUT\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \StallD~input_o\,
	datab => \Fetch_Pipeline_Register|OUT\(0),
	datac => \reset~input_o\,
	datad => \PCPlus4_Fetch_to_Decode|OUT\(0),
	combout => \PCPlus4_Fetch_to_Decode|OUT~0_combout\);

-- Location: IOIBUF_X117_Y29_N1
\FlushD~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FlushD,
	o => \FlushD~input_o\);

-- Location: LCCOMB_X116_Y52_N12
\PCPlus4_Fetch_to_Decode|OUT~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCPlus4_Fetch_to_Decode|OUT~1_combout\ = (\PCPlus4_Fetch_to_Decode|OUT~0_combout\ & !\FlushD~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PCPlus4_Fetch_to_Decode|OUT~0_combout\,
	datad => \FlushD~input_o\,
	combout => \PCPlus4_Fetch_to_Decode|OUT~1_combout\);

-- Location: FF_X116_Y52_N13
\PCPlus4_Fetch_to_Decode|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \PCPlus4_Fetch_to_Decode|OUT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCPlus4_Fetch_to_Decode|OUT\(0));

-- Location: LCCOMB_X116_Y52_N10
\PCPlus4_Decode_to_Execute|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCPlus4_Decode_to_Execute|OUT~0_combout\ = (\PCPlus4_Fetch_to_Decode|OUT\(0) & (!\reset~input_o\ & !\FlushE~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCPlus4_Fetch_to_Decode|OUT\(0),
	datac => \reset~input_o\,
	datad => \FlushE~input_o\,
	combout => \PCPlus4_Decode_to_Execute|OUT~0_combout\);

-- Location: FF_X116_Y52_N11
\PCPlus4_Decode_to_Execute|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \PCPlus4_Decode_to_Execute|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCPlus4_Decode_to_Execute|OUT\(0));

-- Location: LCCOMB_X116_Y52_N16
\PCPlus4_Execute_to_Memory|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCPlus4_Execute_to_Memory|OUT~0_combout\ = (\PCPlus4_Decode_to_Execute|OUT\(0) & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCPlus4_Decode_to_Execute|OUT\(0),
	datac => \reset~input_o\,
	combout => \PCPlus4_Execute_to_Memory|OUT~0_combout\);

-- Location: FF_X116_Y52_N17
\PCPlus4_Execute_to_Memory|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \PCPlus4_Execute_to_Memory|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCPlus4_Execute_to_Memory|OUT\(0));

-- Location: LCCOMB_X116_Y53_N28
\PCPlus4_Memory_to_WriteBack|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \PCPlus4_Memory_to_WriteBack|OUT~0_combout\ = (\PCPlus4_Execute_to_Memory|OUT\(0) & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PCPlus4_Execute_to_Memory|OUT\(0),
	datad => \reset~input_o\,
	combout => \PCPlus4_Memory_to_WriteBack|OUT~0_combout\);

-- Location: FF_X116_Y53_N29
\PCPlus4_Memory_to_WriteBack|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \PCPlus4_Memory_to_WriteBack|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCPlus4_Memory_to_WriteBack|OUT\(0));

-- Location: LCCOMB_X116_Y53_N6
\My_RegFile|registers[0].Reg|OUT[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|registers[0].Reg|OUT[0]~0_combout\ = (\RegWriteW~input_o\ & ((\BL_ctrl~input_o\ & (\PCPlus4_Memory_to_WriteBack|OUT\(0))) # (!\BL_ctrl~input_o\ & ((\MUX9|output_value[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BL_ctrl~input_o\,
	datab => \RegWriteW~input_o\,
	datac => \PCPlus4_Memory_to_WriteBack|OUT\(0),
	datad => \MUX9|output_value[0]~0_combout\,
	combout => \My_RegFile|registers[0].Reg|OUT[0]~0_combout\);

-- Location: LCCOMB_X116_Y53_N16
\My_RegFile|registers[0].Reg|OUT[0]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|registers[0].Reg|OUT[0]~1_combout\ = (\My_RegFile|registers[0].Reg|OUT[0]~0_combout\) # ((!\RegWriteW~input_o\ & \My_RegFile|registers[0].Reg|OUT\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegWriteW~input_o\,
	datac => \My_RegFile|registers[0].Reg|OUT\(0),
	datad => \My_RegFile|registers[0].Reg|OUT[0]~0_combout\,
	combout => \My_RegFile|registers[0].Reg|OUT[0]~1_combout\);

-- Location: FF_X116_Y53_N17
\My_RegFile|registers[0].Reg|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \My_RegFile|registers[0].Reg|OUT[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \My_RegFile|registers[0].Reg|OUT\(0));

-- Location: LCCOMB_X116_Y53_N18
\RD2_Decode_to_Execute|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RD2_Decode_to_Execute|OUT~0_combout\ = (!\reset~input_o\ & (!\FlushE~input_o\ & \My_RegFile|registers[0].Reg|OUT\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \FlushE~input_o\,
	datad => \My_RegFile|registers[0].Reg|OUT\(0),
	combout => \RD2_Decode_to_Execute|OUT~0_combout\);

-- Location: FF_X116_Y53_N19
\RD2_Decode_to_Execute|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RD2_Decode_to_Execute|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RD2_Decode_to_Execute|OUT\(0));

-- Location: LCCOMB_X116_Y52_N18
\WriteData_Execute_to_Memory|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WriteData_Execute_to_Memory|OUT~0_combout\ = (!\reset~input_o\ & \RD2_Decode_to_Execute|OUT\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \RD2_Decode_to_Execute|OUT\(0),
	combout => \WriteData_Execute_to_Memory|OUT~0_combout\);

-- Location: FF_X116_Y52_N19
\WriteData_Execute_to_Memory|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \WriteData_Execute_to_Memory|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \WriteData_Execute_to_Memory|OUT\(0));

-- Location: LCCOMB_X116_Y52_N22
\Data_Memory|mem[1][0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Data_Memory|mem[1][0]~0_combout\ = (\MemWriteM~input_o\ & (\ALUResult_Execute_to_Memory|OUT\(0) & ((\WriteData_Execute_to_Memory|OUT\(0))))) # (!\MemWriteM~input_o\ & (((\Data_Memory|mem[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult_Execute_to_Memory|OUT\(0),
	datab => \MemWriteM~input_o\,
	datac => \Data_Memory|mem[1][0]~q\,
	datad => \WriteData_Execute_to_Memory|OUT\(0),
	combout => \Data_Memory|mem[1][0]~0_combout\);

-- Location: FF_X116_Y52_N23
\Data_Memory|mem[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Data_Memory|mem[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Data_Memory|mem[1][0]~q\);

-- Location: LCCOMB_X116_Y52_N0
\Data_Memory|mem[0][0]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Data_Memory|mem[0][0]~1_combout\ = (\ALUResult_Execute_to_Memory|OUT\(0) & (((\Data_Memory|mem[0][0]~q\)))) # (!\ALUResult_Execute_to_Memory|OUT\(0) & ((\MemWriteM~input_o\ & ((\WriteData_Execute_to_Memory|OUT\(0)))) # (!\MemWriteM~input_o\ & 
-- (\Data_Memory|mem[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult_Execute_to_Memory|OUT\(0),
	datab => \MemWriteM~input_o\,
	datac => \Data_Memory|mem[0][0]~q\,
	datad => \WriteData_Execute_to_Memory|OUT\(0),
	combout => \Data_Memory|mem[0][0]~1_combout\);

-- Location: FF_X116_Y52_N1
\Data_Memory|mem[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Data_Memory|mem[0][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Data_Memory|mem[0][0]~q\);

-- Location: LCCOMB_X116_Y53_N24
\Data_Memory|Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Data_Memory|Mux7~0_combout\ = (\ALUResult_Execute_to_Memory|OUT\(0) & (\Data_Memory|mem[1][0]~q\)) # (!\ALUResult_Execute_to_Memory|OUT\(0) & ((\Data_Memory|mem[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_Memory|mem[1][0]~q\,
	datac => \ALUResult_Execute_to_Memory|OUT\(0),
	datad => \Data_Memory|mem[0][0]~q\,
	combout => \Data_Memory|Mux7~0_combout\);

-- Location: FF_X116_Y53_N25
\RD_Memory_to_WriteBack|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Data_Memory|Mux7~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RD_Memory_to_WriteBack|OUT\(0));

-- Location: LCCOMB_X116_Y53_N4
\My_Shifter|ShiftLeft0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Shifter|ShiftLeft0~2_combout\ = (\ForwardBE[1]~input_o\) # ((\MemtoRegW~input_o\ & (!\ALUOut_Memory_to_WriteBack|OUT\(0))) # (!\MemtoRegW~input_o\ & ((!\RD_Memory_to_WriteBack|OUT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ForwardBE[1]~input_o\,
	datab => \MemtoRegW~input_o\,
	datac => \ALUOut_Memory_to_WriteBack|OUT\(0),
	datad => \RD_Memory_to_WriteBack|OUT\(0),
	combout => \My_Shifter|ShiftLeft0~2_combout\);

-- Location: IOIBUF_X117_Y19_N8
\shamt[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shamt(1),
	o => \shamt[1]~input_o\);

-- Location: IOIBUF_X117_Y21_N1
\shamt[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shamt(0),
	o => \shamt[0]~input_o\);

-- Location: LCCOMB_X116_Y53_N8
\My_Shifter|ShiftLeft0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Shifter|ShiftLeft0~1_combout\ = (\shamt[1]~input_o\) # ((\shamt[0]~input_o\) # ((\ForwardBE[1]~input_o\ & !\ALUResult_Execute_to_Memory|OUT\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ForwardBE[1]~input_o\,
	datab => \shamt[1]~input_o\,
	datac => \shamt[0]~input_o\,
	datad => \ALUResult_Execute_to_Memory|OUT\(0),
	combout => \My_Shifter|ShiftLeft0~1_combout\);

-- Location: IOIBUF_X117_Y49_N1
\ALUSrcE~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUSrcE,
	o => \ALUSrcE~input_o\);

-- Location: LCCOMB_X116_Y53_N12
\My_Shifter|ShiftLeft0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Shifter|ShiftLeft0~0_combout\ = (\ALUSrcE~input_o\) # ((!\ForwardBE[0]~input_o\ & (!\ForwardBE[1]~input_o\ & !\RD2_Decode_to_Execute|OUT\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUSrcE~input_o\,
	datab => \ForwardBE[0]~input_o\,
	datac => \ForwardBE[1]~input_o\,
	datad => \RD2_Decode_to_Execute|OUT\(0),
	combout => \My_Shifter|ShiftLeft0~0_combout\);

-- Location: LCCOMB_X116_Y53_N14
\My_Shifter|ShiftLeft0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Shifter|ShiftLeft0~3_combout\ = (\My_Shifter|ShiftLeft0~1_combout\) # ((\My_Shifter|ShiftLeft0~0_combout\) # ((\ForwardBE[0]~input_o\ & \My_Shifter|ShiftLeft0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ForwardBE[0]~input_o\,
	datab => \My_Shifter|ShiftLeft0~2_combout\,
	datac => \My_Shifter|ShiftLeft0~1_combout\,
	datad => \My_Shifter|ShiftLeft0~0_combout\,
	combout => \My_Shifter|ShiftLeft0~3_combout\);

-- Location: LCCOMB_X116_Y56_N28
\My_ALU|Add0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Add0~1_combout\ = (\My_ALU|Add0~0_combout\ & (\MUX6|Mux31~1_combout\ $ (((\My_Shifter|ShiftLeft0~5_combout\) # (\My_Shifter|ShiftLeft0~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Add0~0_combout\,
	datab => \My_Shifter|ShiftLeft0~5_combout\,
	datac => \MUX6|Mux31~1_combout\,
	datad => \My_Shifter|ShiftLeft0~3_combout\,
	combout => \My_ALU|Add0~1_combout\);

-- Location: LCCOMB_X116_Y56_N12
\My_ALU|Mux31~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux31~3_combout\ = (\ALUControlE[0]~input_o\ & (\MUX6|Mux31~1_combout\ $ (((!\My_Shifter|ShiftLeft0~4_combout\))))) # (!\ALUControlE[0]~input_o\ & (\MUX6|Mux31~1_combout\ & (!\ALUControlE[2]~input_o\ & !\My_Shifter|ShiftLeft0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[0]~input_o\,
	datab => \MUX6|Mux31~1_combout\,
	datac => \ALUControlE[2]~input_o\,
	datad => \My_Shifter|ShiftLeft0~4_combout\,
	combout => \My_ALU|Mux31~3_combout\);

-- Location: LCCOMB_X116_Y56_N18
\My_ALU|Mux31~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux31~4_combout\ = (\ALUControlE[1]~input_o\ & (!\ALUControlE[2]~input_o\ & (!\My_ALU|Add0~1_combout\))) # (!\ALUControlE[1]~input_o\ & (((\My_ALU|Mux31~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[1]~input_o\,
	datab => \ALUControlE[2]~input_o\,
	datac => \My_ALU|Add0~1_combout\,
	datad => \My_ALU|Mux31~3_combout\,
	combout => \My_ALU|Mux31~4_combout\);

-- Location: LCCOMB_X116_Y53_N2
\ALUResult_Execute_to_Memory|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALUResult_Execute_to_Memory|OUT~0_combout\ = (!\reset~input_o\ & ((\My_ALU|Mux31~2_combout\) # ((!\ALUControlE[3]~input_o\ & \My_ALU|Mux31~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \ALUControlE[3]~input_o\,
	datac => \My_ALU|Mux31~4_combout\,
	datad => \My_ALU|Mux31~2_combout\,
	combout => \ALUResult_Execute_to_Memory|OUT~0_combout\);

-- Location: FF_X116_Y53_N3
\ALUResult_Execute_to_Memory|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ALUResult_Execute_to_Memory|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALUResult_Execute_to_Memory|OUT\(0));

-- Location: IOIBUF_X117_Y35_N1
\RegSrcD[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RegSrcD(0),
	o => \RegSrcD[0]~input_o\);

-- Location: LCCOMB_X116_Y53_N20
\RD1_Decode_to_Execute|OUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RD1_Decode_to_Execute|OUT~0_combout\ = (!\reset~input_o\ & (!\RegSrcD[0]~input_o\ & (!\FlushE~input_o\ & \My_RegFile|registers[0].Reg|OUT\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \RegSrcD[0]~input_o\,
	datac => \FlushE~input_o\,
	datad => \My_RegFile|registers[0].Reg|OUT\(0),
	combout => \RD1_Decode_to_Execute|OUT~0_combout\);

-- Location: FF_X116_Y53_N21
\RD1_Decode_to_Execute|OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RD1_Decode_to_Execute|OUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RD1_Decode_to_Execute|OUT\(0));

-- Location: LCCOMB_X116_Y53_N26
\MUX6|Mux31~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX6|Mux31~0_combout\ = (!\ForwardAE[0]~input_o\ & ((\ForwardAE[1]~input_o\ & (\ALUResult_Execute_to_Memory|OUT\(0))) # (!\ForwardAE[1]~input_o\ & ((\RD1_Decode_to_Execute|OUT\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ForwardAE[1]~input_o\,
	datab => \ForwardAE[0]~input_o\,
	datac => \ALUResult_Execute_to_Memory|OUT\(0),
	datad => \RD1_Decode_to_Execute|OUT\(0),
	combout => \MUX6|Mux31~0_combout\);

-- Location: LCCOMB_X116_Y53_N10
\MUX6|Mux31~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX6|Mux31~1_combout\ = (\MUX6|Mux31~0_combout\) # ((!\ForwardAE[1]~input_o\ & (\ForwardAE[0]~input_o\ & \MUX9|output_value[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ForwardAE[1]~input_o\,
	datab => \ForwardAE[0]~input_o\,
	datac => \MUX6|Mux31~0_combout\,
	datad => \MUX9|output_value[0]~0_combout\,
	combout => \MUX6|Mux31~1_combout\);

-- Location: LCCOMB_X116_Y56_N4
\My_ALU|Add0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Add0~2_combout\ = (\ALUControlE[0]~input_o\ & ((\My_Shifter|ShiftLeft0~5_combout\) # ((\MUX6|Mux31~1_combout\) # (\My_Shifter|ShiftLeft0~3_combout\)))) # (!\ALUControlE[0]~input_o\ & (((!\My_Shifter|ShiftLeft0~5_combout\ & 
-- !\My_Shifter|ShiftLeft0~3_combout\)) # (!\MUX6|Mux31~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[0]~input_o\,
	datab => \My_Shifter|ShiftLeft0~5_combout\,
	datac => \MUX6|Mux31~1_combout\,
	datad => \My_Shifter|ShiftLeft0~3_combout\,
	combout => \My_ALU|Add0~2_combout\);

-- Location: LCCOMB_X116_Y56_N24
\My_ALU|Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux1~0_combout\ = (\ALUControlE[2]~input_o\ & ((\ALUControlE[3]~input_o\) # (\My_ALU|Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[3]~input_o\,
	datab => \ALUControlE[2]~input_o\,
	datac => \My_ALU|Add0~2_combout\,
	combout => \My_ALU|Mux1~0_combout\);

-- Location: LCCOMB_X115_Y56_N2
\My_ALU|Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux0~0_combout\ = (!\My_ALU|Add0~1_combout\ & (\My_ALU|Add0~0_combout\ & \My_ALU|Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Add0~1_combout\,
	datac => \My_ALU|Add0~0_combout\,
	datad => \My_ALU|Add0~2_combout\,
	combout => \My_ALU|Mux0~0_combout\);

-- Location: LCCOMB_X115_Y57_N6
\My_ALU|Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux0~1_combout\ = (\My_ALU|Mux0~0_combout\) # ((\My_ALU|Mux1~0_combout\ & \ALUControlE[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux1~0_combout\,
	datac => \ALUControlE[1]~input_o\,
	datad => \My_ALU|Mux0~0_combout\,
	combout => \My_ALU|Mux0~1_combout\);

-- Location: LCCOMB_X116_Y57_N12
\My_ALU|Mux30~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux30~0_combout\ = (!\My_Shifter|ShiftLeft0~5_combout\ & (!\My_Shifter|ShiftLeft0~3_combout\ & \MUX6|Mux31~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Shifter|ShiftLeft0~5_combout\,
	datac => \My_Shifter|ShiftLeft0~3_combout\,
	datad => \MUX6|Mux31~1_combout\,
	combout => \My_ALU|Mux30~0_combout\);

-- Location: LCCOMB_X116_Y56_N30
\My_ALU|Mux30~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux30~1_combout\ = (!\ALUControlE[3]~input_o\ & (\ALUControlE[2]~input_o\ & !\ALUControlE[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[3]~input_o\,
	datab => \ALUControlE[2]~input_o\,
	datac => \ALUControlE[1]~input_o\,
	combout => \My_ALU|Mux30~1_combout\);

-- Location: LCCOMB_X116_Y56_N10
\My_ALU|Mux30~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux30~2_combout\ = (\ALUControlE[3]~input_o\ & (\ALUControlE[2]~input_o\)) # (!\ALUControlE[3]~input_o\ & (\My_ALU|Add0~2_combout\ $ (((!\ALUControlE[2]~input_o\ & \My_ALU|Add0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[3]~input_o\,
	datab => \ALUControlE[2]~input_o\,
	datac => \My_ALU|Add0~2_combout\,
	datad => \My_ALU|Add0~1_combout\,
	combout => \My_ALU|Mux30~2_combout\);

-- Location: LCCOMB_X116_Y57_N6
\My_ALU|Mux30~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux30~3_combout\ = (\My_ALU|Mux30~0_combout\ & ((\My_ALU|Mux30~1_combout\) # ((\ALUControlE[1]~input_o\ & \My_ALU|Mux30~2_combout\)))) # (!\My_ALU|Mux30~0_combout\ & (((\ALUControlE[1]~input_o\ & \My_ALU|Mux30~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux30~0_combout\,
	datab => \My_ALU|Mux30~1_combout\,
	datac => \ALUControlE[1]~input_o\,
	datad => \My_ALU|Mux30~2_combout\,
	combout => \My_ALU|Mux30~3_combout\);

-- Location: LCCOMB_X115_Y57_N4
\My_ALU|WideOr0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|WideOr0~0_combout\ = (\My_ALU|Mux30~3_combout\) # ((\ALUControlE[1]~input_o\ & \My_ALU|Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux30~3_combout\,
	datab => \ALUControlE[1]~input_o\,
	datad => \My_ALU|Mux1~0_combout\,
	combout => \My_ALU|WideOr0~0_combout\);

-- Location: LCCOMB_X115_Y57_N12
\My_ALU|WideOr0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|WideOr0~1_combout\ = (\My_ALU|Mux0~1_combout\) # ((\My_ALU|Mux31~5_combout\) # ((\My_ALU|WideOr0~0_combout\) # (\My_ALU|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux0~1_combout\,
	datab => \My_ALU|Mux31~5_combout\,
	datac => \My_ALU|WideOr0~0_combout\,
	datad => \My_ALU|Mux0~0_combout\,
	combout => \My_ALU|WideOr0~1_combout\);

-- Location: LCCOMB_X115_Y56_N12
\My_ALU|Mux32~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux32~0_combout\ = (!\ALUControlE[3]~input_o\ & \ALUControlE[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ALUControlE[3]~input_o\,
	datad => \ALUControlE[1]~input_o\,
	combout => \My_ALU|Mux32~0_combout\);

-- Location: LCCOMB_X116_Y56_N6
\My_ALU|Mux32~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Mux32~1_combout\ = (\My_ALU|Mux32~0_combout\ & (((!\ALUControlE[2]~input_o\ & \My_ALU|Add0~1_combout\)) # (!\My_ALU|Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux32~0_combout\,
	datab => \ALUControlE[2]~input_o\,
	datac => \My_ALU|Add0~1_combout\,
	datad => \My_ALU|Add0~2_combout\,
	combout => \My_ALU|Mux32~1_combout\);

-- Location: LCCOMB_X116_Y53_N30
\My_RegFile|mux_0|Mux31~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_0|Mux31~0_combout\ = (\My_RegFile|registers[0].Reg|OUT\(0) & !\RegSrcD[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_RegFile|registers[0].Reg|OUT\(0),
	datad => \RegSrcD[0]~input_o\,
	combout => \My_RegFile|mux_0|Mux31~0_combout\);

-- Location: IOIBUF_X117_Y41_N1
\Switches[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(0),
	o => \Switches[0]~input_o\);

-- Location: IOIBUF_X117_Y32_N8
\Switches[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(1),
	o => \Switches[1]~input_o\);

-- Location: IOIBUF_X117_Y34_N1
\Switches[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(3),
	o => \Switches[3]~input_o\);

-- Location: IOIBUF_X117_Y48_N1
\Switches[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(2),
	o => \Switches[2]~input_o\);

-- Location: LCCOMB_X116_Y52_N2
\My_RegFile|mux_2|Mux31~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux31~0_combout\ = (!\Switches[0]~input_o\ & (!\Switches[1]~input_o\ & (!\Switches[3]~input_o\ & !\Switches[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switches[0]~input_o\,
	datab => \Switches[1]~input_o\,
	datac => \Switches[3]~input_o\,
	datad => \Switches[2]~input_o\,
	combout => \My_RegFile|mux_2|Mux31~0_combout\);

-- Location: LCCOMB_X116_Y52_N4
\My_RegFile|mux_2|Mux30~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux30~0_combout\ = (\Switches[0]~input_o\ & (\Switches[1]~input_o\ & (\Switches[3]~input_o\ & \Switches[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switches[0]~input_o\,
	datab => \Switches[1]~input_o\,
	datac => \Switches[3]~input_o\,
	datad => \Switches[2]~input_o\,
	combout => \My_RegFile|mux_2|Mux30~0_combout\);

-- Location: LCCOMB_X116_Y52_N24
\My_RegFile|mux_2|Mux31~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux31~1_combout\ = (\My_RegFile|mux_2|Mux31~0_combout\ & ((\My_RegFile|registers[0].Reg|OUT\(0)) # ((\My_RegFile|mux_2|Mux30~0_combout\ & \Fetch_Pipeline_Register|OUT\(0))))) # (!\My_RegFile|mux_2|Mux31~0_combout\ & 
-- (\My_RegFile|mux_2|Mux30~0_combout\ & (\Fetch_Pipeline_Register|OUT\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_RegFile|mux_2|Mux31~0_combout\,
	datab => \My_RegFile|mux_2|Mux30~0_combout\,
	datac => \Fetch_Pipeline_Register|OUT\(0),
	datad => \My_RegFile|registers[0].Reg|OUT\(0),
	combout => \My_RegFile|mux_2|Mux31~1_combout\);

-- Location: LCCOMB_X116_Y57_N18
\MUX1|output_value[1]~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[1]~18_combout\ = (\BranchTakenE~input_o\ & (((\My_ALU|Mux30~3_combout\)))) # (!\BranchTakenE~input_o\ & (!\PCSrcW~input_o\ & (\Fetch_Pipeline_Register|OUT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCSrcW~input_o\,
	datab => \Fetch_Pipeline_Register|OUT\(1),
	datac => \BranchTakenE~input_o\,
	datad => \My_ALU|Mux30~3_combout\,
	combout => \MUX1|output_value[1]~18_combout\);

-- Location: LCCOMB_X116_Y57_N0
\Fetch_Pipeline_Register|OUT~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~2_combout\ = (!\reset~input_o\ & \MUX1|output_value[1]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \MUX1|output_value[1]~18_combout\,
	combout => \Fetch_Pipeline_Register|OUT~2_combout\);

-- Location: FF_X116_Y57_N1
\Fetch_Pipeline_Register|OUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~2_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(1));

-- Location: LCCOMB_X116_Y58_N16
\My_RegFile|mux_2|Mux30~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux30~1_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \Fetch_Pipeline_Register|OUT\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_RegFile|mux_2|Mux30~0_combout\,
	datad => \Fetch_Pipeline_Register|OUT\(1),
	combout => \My_RegFile|mux_2|Mux30~1_combout\);

-- Location: LCCOMB_X116_Y57_N14
\Fetch_Pipeline_Register|OUT~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~3_combout\ = (!\reset~input_o\ & ((\BranchTakenE~input_o\ & (\ALUControlE[1]~input_o\)) # (!\BranchTakenE~input_o\ & ((!\PCSrcW~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \PCSrcW~input_o\,
	combout => \Fetch_Pipeline_Register|OUT~3_combout\);

-- Location: LCCOMB_X115_Y56_N6
\MUX1|output_value[2]~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[2]~20_combout\ = (\ALUControlE[3]~input_o\ & (\ALUControlE[2]~input_o\)) # (!\ALUControlE[3]~input_o\ & (\My_ALU|Add0~2_combout\ & ((\ALUControlE[2]~input_o\) # (!\My_ALU|Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUControlE[2]~input_o\,
	datab => \ALUControlE[3]~input_o\,
	datac => \My_ALU|Add0~1_combout\,
	datad => \My_ALU|Add0~2_combout\,
	combout => \MUX1|output_value[2]~20_combout\);

-- Location: LCCOMB_X114_Y60_N0
\Fetch_Pipeline_Register|OUT~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~4_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[2]~0_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \Fetch_Pipeline_Register|OUT~3_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~4_combout\);

-- Location: FF_X114_Y60_N1
\Fetch_Pipeline_Register|OUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~4_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(2));

-- Location: LCCOMB_X115_Y60_N2
\My_Adder|OUT[2]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[2]~0_combout\ = \Fetch_Pipeline_Register|OUT\(2) $ (VCC)
-- \My_Adder|OUT[2]~1\ = CARRY(\Fetch_Pipeline_Register|OUT\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(2),
	datad => VCC,
	combout => \My_Adder|OUT[2]~0_combout\,
	cout => \My_Adder|OUT[2]~1\);

-- Location: LCCOMB_X116_Y58_N10
\My_RegFile|mux_2|Mux29~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux29~0_combout\ = (\My_Adder|OUT[2]~0_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_Adder|OUT[2]~0_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux29~0_combout\);

-- Location: LCCOMB_X116_Y60_N20
\Fetch_Pipeline_Register|OUT~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~5_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \My_Adder|OUT[3]~2_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~5_combout\);

-- Location: FF_X116_Y60_N21
\Fetch_Pipeline_Register|OUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~5_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(3));

-- Location: LCCOMB_X115_Y60_N4
\My_Adder|OUT[3]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[3]~2_combout\ = (\Fetch_Pipeline_Register|OUT\(3) & (!\My_Adder|OUT[2]~1\)) # (!\Fetch_Pipeline_Register|OUT\(3) & ((\My_Adder|OUT[2]~1\) # (GND)))
-- \My_Adder|OUT[3]~3\ = CARRY((!\My_Adder|OUT[2]~1\) # (!\Fetch_Pipeline_Register|OUT\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(3),
	datad => VCC,
	cin => \My_Adder|OUT[2]~1\,
	combout => \My_Adder|OUT[3]~2_combout\,
	cout => \My_Adder|OUT[3]~3\);

-- Location: LCCOMB_X116_Y60_N10
\My_RegFile|mux_2|Mux28~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux28~0_combout\ = (\My_Adder|OUT[3]~2_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_Adder|OUT[3]~2_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux28~0_combout\);

-- Location: LCCOMB_X115_Y60_N0
\Fetch_Pipeline_Register|OUT~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~6_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[4]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \MUX1|output_value[2]~20_combout\,
	datad => \My_Adder|OUT[4]~4_combout\,
	combout => \Fetch_Pipeline_Register|OUT~6_combout\);

-- Location: FF_X115_Y60_N1
\Fetch_Pipeline_Register|OUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~6_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(4));

-- Location: LCCOMB_X115_Y60_N6
\My_Adder|OUT[4]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[4]~4_combout\ = (\Fetch_Pipeline_Register|OUT\(4) & (\My_Adder|OUT[3]~3\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(4) & (!\My_Adder|OUT[3]~3\ & VCC))
-- \My_Adder|OUT[4]~5\ = CARRY((\Fetch_Pipeline_Register|OUT\(4) & !\My_Adder|OUT[3]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(4),
	datad => VCC,
	cin => \My_Adder|OUT[3]~3\,
	combout => \My_Adder|OUT[4]~4_combout\,
	cout => \My_Adder|OUT[4]~5\);

-- Location: LCCOMB_X116_Y58_N28
\My_RegFile|mux_2|Mux27~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux27~0_combout\ = (\My_Adder|OUT[4]~4_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[4]~4_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux27~0_combout\);

-- Location: LCCOMB_X116_Y60_N8
\Fetch_Pipeline_Register|OUT~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~7_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[5]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[5]~6_combout\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~7_combout\);

-- Location: FF_X116_Y60_N9
\Fetch_Pipeline_Register|OUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~7_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(5));

-- Location: LCCOMB_X115_Y60_N8
\My_Adder|OUT[5]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[5]~6_combout\ = (\Fetch_Pipeline_Register|OUT\(5) & (!\My_Adder|OUT[4]~5\)) # (!\Fetch_Pipeline_Register|OUT\(5) & ((\My_Adder|OUT[4]~5\) # (GND)))
-- \My_Adder|OUT[5]~7\ = CARRY((!\My_Adder|OUT[4]~5\) # (!\Fetch_Pipeline_Register|OUT\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(5),
	datad => VCC,
	cin => \My_Adder|OUT[4]~5\,
	combout => \My_Adder|OUT[5]~6_combout\,
	cout => \My_Adder|OUT[5]~7\);

-- Location: LCCOMB_X116_Y60_N14
\My_RegFile|mux_2|Mux26~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux26~0_combout\ = (\My_Adder|OUT[5]~6_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[5]~6_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux26~0_combout\);

-- Location: LCCOMB_X114_Y60_N10
\Fetch_Pipeline_Register|OUT~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~8_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[6]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \My_Adder|OUT[6]~8_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~8_combout\);

-- Location: FF_X114_Y60_N11
\Fetch_Pipeline_Register|OUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~8_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(6));

-- Location: LCCOMB_X115_Y60_N10
\My_Adder|OUT[6]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[6]~8_combout\ = (\Fetch_Pipeline_Register|OUT\(6) & (\My_Adder|OUT[5]~7\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(6) & (!\My_Adder|OUT[5]~7\ & VCC))
-- \My_Adder|OUT[6]~9\ = CARRY((\Fetch_Pipeline_Register|OUT\(6) & !\My_Adder|OUT[5]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(6),
	datad => VCC,
	cin => \My_Adder|OUT[5]~7\,
	combout => \My_Adder|OUT[6]~8_combout\,
	cout => \My_Adder|OUT[6]~9\);

-- Location: LCCOMB_X116_Y58_N18
\My_RegFile|mux_2|Mux25~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux25~0_combout\ = (\My_Adder|OUT[6]~8_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_Adder|OUT[6]~8_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux25~0_combout\);

-- Location: LCCOMB_X116_Y60_N0
\Fetch_Pipeline_Register|OUT~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~9_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[7]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[7]~10_combout\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~9_combout\);

-- Location: FF_X116_Y60_N1
\Fetch_Pipeline_Register|OUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~9_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(7));

-- Location: LCCOMB_X115_Y60_N12
\My_Adder|OUT[7]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[7]~10_combout\ = (\Fetch_Pipeline_Register|OUT\(7) & (!\My_Adder|OUT[6]~9\)) # (!\Fetch_Pipeline_Register|OUT\(7) & ((\My_Adder|OUT[6]~9\) # (GND)))
-- \My_Adder|OUT[7]~11\ = CARRY((!\My_Adder|OUT[6]~9\) # (!\Fetch_Pipeline_Register|OUT\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(7),
	datad => VCC,
	cin => \My_Adder|OUT[6]~9\,
	combout => \My_Adder|OUT[7]~10_combout\,
	cout => \My_Adder|OUT[7]~11\);

-- Location: LCCOMB_X116_Y60_N6
\My_RegFile|mux_2|Mux24~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux24~0_combout\ = (\My_Adder|OUT[7]~10_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[7]~10_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux24~0_combout\);

-- Location: LCCOMB_X114_Y60_N12
\Fetch_Pipeline_Register|OUT~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~10_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \My_Adder|OUT[8]~12_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~10_combout\);

-- Location: FF_X114_Y60_N13
\Fetch_Pipeline_Register|OUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~10_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(8));

-- Location: LCCOMB_X115_Y60_N14
\My_Adder|OUT[8]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[8]~12_combout\ = (\Fetch_Pipeline_Register|OUT\(8) & (\My_Adder|OUT[7]~11\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(8) & (!\My_Adder|OUT[7]~11\ & VCC))
-- \My_Adder|OUT[8]~13\ = CARRY((\Fetch_Pipeline_Register|OUT\(8) & !\My_Adder|OUT[7]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(8),
	datad => VCC,
	cin => \My_Adder|OUT[7]~11\,
	combout => \My_Adder|OUT[8]~12_combout\,
	cout => \My_Adder|OUT[8]~13\);

-- Location: LCCOMB_X116_Y58_N20
\My_RegFile|mux_2|Mux23~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux23~0_combout\ = (\My_Adder|OUT[8]~12_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_Adder|OUT[8]~12_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux23~0_combout\);

-- Location: LCCOMB_X114_Y60_N18
\Fetch_Pipeline_Register|OUT~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~11_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[9]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \My_Adder|OUT[9]~14_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~11_combout\);

-- Location: FF_X114_Y60_N19
\Fetch_Pipeline_Register|OUT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~11_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(9));

-- Location: LCCOMB_X115_Y60_N16
\My_Adder|OUT[9]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[9]~14_combout\ = (\Fetch_Pipeline_Register|OUT\(9) & (!\My_Adder|OUT[8]~13\)) # (!\Fetch_Pipeline_Register|OUT\(9) & ((\My_Adder|OUT[8]~13\) # (GND)))
-- \My_Adder|OUT[9]~15\ = CARRY((!\My_Adder|OUT[8]~13\) # (!\Fetch_Pipeline_Register|OUT\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(9),
	datad => VCC,
	cin => \My_Adder|OUT[8]~13\,
	combout => \My_Adder|OUT[9]~14_combout\,
	cout => \My_Adder|OUT[9]~15\);

-- Location: LCCOMB_X115_Y58_N12
\My_RegFile|mux_2|Mux22~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux22~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[9]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_RegFile|mux_2|Mux30~0_combout\,
	datac => \My_Adder|OUT[9]~14_combout\,
	combout => \My_RegFile|mux_2|Mux22~0_combout\);

-- Location: LCCOMB_X114_Y60_N4
\Fetch_Pipeline_Register|OUT~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~12_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[10]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \My_Adder|OUT[10]~16_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~12_combout\);

-- Location: FF_X114_Y60_N5
\Fetch_Pipeline_Register|OUT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~12_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(10));

-- Location: LCCOMB_X115_Y60_N18
\My_Adder|OUT[10]~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[10]~16_combout\ = (\Fetch_Pipeline_Register|OUT\(10) & (\My_Adder|OUT[9]~15\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(10) & (!\My_Adder|OUT[9]~15\ & VCC))
-- \My_Adder|OUT[10]~17\ = CARRY((\Fetch_Pipeline_Register|OUT\(10) & !\My_Adder|OUT[9]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(10),
	datad => VCC,
	cin => \My_Adder|OUT[9]~15\,
	combout => \My_Adder|OUT[10]~16_combout\,
	cout => \My_Adder|OUT[10]~17\);

-- Location: LCCOMB_X114_Y60_N6
\My_RegFile|mux_2|Mux21~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux21~0_combout\ = (\My_Adder|OUT[10]~16_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[10]~16_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux21~0_combout\);

-- Location: LCCOMB_X114_Y60_N8
\Fetch_Pipeline_Register|OUT~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~13_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[11]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \My_Adder|OUT[11]~18_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~13_combout\);

-- Location: FF_X114_Y60_N9
\Fetch_Pipeline_Register|OUT[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~13_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(11));

-- Location: LCCOMB_X115_Y60_N20
\My_Adder|OUT[11]~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[11]~18_combout\ = (\Fetch_Pipeline_Register|OUT\(11) & (!\My_Adder|OUT[10]~17\)) # (!\Fetch_Pipeline_Register|OUT\(11) & ((\My_Adder|OUT[10]~17\) # (GND)))
-- \My_Adder|OUT[11]~19\ = CARRY((!\My_Adder|OUT[10]~17\) # (!\Fetch_Pipeline_Register|OUT\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(11),
	datad => VCC,
	cin => \My_Adder|OUT[10]~17\,
	combout => \My_Adder|OUT[11]~18_combout\,
	cout => \My_Adder|OUT[11]~19\);

-- Location: LCCOMB_X114_Y59_N28
\My_RegFile|mux_2|Mux20~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux20~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[11]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	datad => \My_Adder|OUT[11]~18_combout\,
	combout => \My_RegFile|mux_2|Mux20~0_combout\);

-- Location: LCCOMB_X114_Y60_N14
\Fetch_Pipeline_Register|OUT~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~14_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[12]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \My_Adder|OUT[12]~20_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~14_combout\);

-- Location: FF_X114_Y60_N15
\Fetch_Pipeline_Register|OUT[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~14_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(12));

-- Location: LCCOMB_X115_Y60_N22
\My_Adder|OUT[12]~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[12]~20_combout\ = (\Fetch_Pipeline_Register|OUT\(12) & (\My_Adder|OUT[11]~19\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(12) & (!\My_Adder|OUT[11]~19\ & VCC))
-- \My_Adder|OUT[12]~21\ = CARRY((\Fetch_Pipeline_Register|OUT\(12) & !\My_Adder|OUT[11]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(12),
	datad => VCC,
	cin => \My_Adder|OUT[11]~19\,
	combout => \My_Adder|OUT[12]~20_combout\,
	cout => \My_Adder|OUT[12]~21\);

-- Location: LCCOMB_X114_Y60_N16
\My_RegFile|mux_2|Mux19~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux19~0_combout\ = (\My_Adder|OUT[12]~20_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[12]~20_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux19~0_combout\);

-- Location: LCCOMB_X114_Y60_N26
\Fetch_Pipeline_Register|OUT~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~15_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[13]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \My_Adder|OUT[13]~22_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~15_combout\);

-- Location: FF_X114_Y60_N27
\Fetch_Pipeline_Register|OUT[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~15_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(13));

-- Location: LCCOMB_X115_Y60_N24
\My_Adder|OUT[13]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[13]~22_combout\ = (\Fetch_Pipeline_Register|OUT\(13) & (!\My_Adder|OUT[12]~21\)) # (!\Fetch_Pipeline_Register|OUT\(13) & ((\My_Adder|OUT[12]~21\) # (GND)))
-- \My_Adder|OUT[13]~23\ = CARRY((!\My_Adder|OUT[12]~21\) # (!\Fetch_Pipeline_Register|OUT\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(13),
	datad => VCC,
	cin => \My_Adder|OUT[12]~21\,
	combout => \My_Adder|OUT[13]~22_combout\,
	cout => \My_Adder|OUT[13]~23\);

-- Location: LCCOMB_X114_Y59_N18
\My_RegFile|mux_2|Mux18~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux18~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[13]~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_RegFile|mux_2|Mux30~0_combout\,
	datad => \My_Adder|OUT[13]~22_combout\,
	combout => \My_RegFile|mux_2|Mux18~0_combout\);

-- Location: LCCOMB_X116_Y60_N4
\Fetch_Pipeline_Register|OUT~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~16_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[14]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[14]~24_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \Fetch_Pipeline_Register|OUT~3_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~16_combout\);

-- Location: FF_X116_Y60_N5
\Fetch_Pipeline_Register|OUT[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~16_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(14));

-- Location: LCCOMB_X115_Y60_N26
\My_Adder|OUT[14]~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[14]~24_combout\ = (\Fetch_Pipeline_Register|OUT\(14) & (\My_Adder|OUT[13]~23\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(14) & (!\My_Adder|OUT[13]~23\ & VCC))
-- \My_Adder|OUT[14]~25\ = CARRY((\Fetch_Pipeline_Register|OUT\(14) & !\My_Adder|OUT[13]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(14),
	datad => VCC,
	cin => \My_Adder|OUT[13]~23\,
	combout => \My_Adder|OUT[14]~24_combout\,
	cout => \My_Adder|OUT[14]~25\);

-- Location: LCCOMB_X116_Y60_N2
\My_RegFile|mux_2|Mux17~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux17~0_combout\ = (\My_Adder|OUT[14]~24_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_Adder|OUT[14]~24_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux17~0_combout\);

-- Location: LCCOMB_X114_Y60_N28
\Fetch_Pipeline_Register|OUT~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~17_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[15]~26_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \Fetch_Pipeline_Register|OUT~3_combout\,
	datad => \My_Adder|OUT[15]~26_combout\,
	combout => \Fetch_Pipeline_Register|OUT~17_combout\);

-- Location: FF_X114_Y60_N29
\Fetch_Pipeline_Register|OUT[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~17_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(15));

-- Location: LCCOMB_X115_Y60_N28
\My_Adder|OUT[15]~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[15]~26_combout\ = (\Fetch_Pipeline_Register|OUT\(15) & (!\My_Adder|OUT[14]~25\)) # (!\Fetch_Pipeline_Register|OUT\(15) & ((\My_Adder|OUT[14]~25\) # (GND)))
-- \My_Adder|OUT[15]~27\ = CARRY((!\My_Adder|OUT[14]~25\) # (!\Fetch_Pipeline_Register|OUT\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(15),
	datad => VCC,
	cin => \My_Adder|OUT[14]~25\,
	combout => \My_Adder|OUT[15]~26_combout\,
	cout => \My_Adder|OUT[15]~27\);

-- Location: LCCOMB_X114_Y59_N0
\My_RegFile|mux_2|Mux16~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux16~0_combout\ = (\My_Adder|OUT[15]~26_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[15]~26_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux16~0_combout\);

-- Location: LCCOMB_X114_Y60_N30
\Fetch_Pipeline_Register|OUT~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~18_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[16]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT~3_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \My_Adder|OUT[16]~28_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~18_combout\);

-- Location: FF_X114_Y60_N31
\Fetch_Pipeline_Register|OUT[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~18_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(16));

-- Location: LCCOMB_X115_Y60_N30
\My_Adder|OUT[16]~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[16]~28_combout\ = (\Fetch_Pipeline_Register|OUT\(16) & (\My_Adder|OUT[15]~27\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(16) & (!\My_Adder|OUT[15]~27\ & VCC))
-- \My_Adder|OUT[16]~29\ = CARRY((\Fetch_Pipeline_Register|OUT\(16) & !\My_Adder|OUT[15]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(16),
	datad => VCC,
	cin => \My_Adder|OUT[15]~27\,
	combout => \My_Adder|OUT[16]~28_combout\,
	cout => \My_Adder|OUT[16]~29\);

-- Location: LCCOMB_X114_Y60_N24
\My_RegFile|mux_2|Mux15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux15~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[16]~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_RegFile|mux_2|Mux30~0_combout\,
	datac => \My_Adder|OUT[16]~28_combout\,
	combout => \My_RegFile|mux_2|Mux15~0_combout\);

-- Location: LCCOMB_X114_Y59_N26
\Fetch_Pipeline_Register|OUT~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~19_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[17]~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \My_Adder|OUT[17]~30_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~19_combout\);

-- Location: FF_X114_Y59_N27
\Fetch_Pipeline_Register|OUT[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~19_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(17));

-- Location: LCCOMB_X115_Y59_N0
\My_Adder|OUT[17]~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[17]~30_combout\ = (\Fetch_Pipeline_Register|OUT\(17) & (!\My_Adder|OUT[16]~29\)) # (!\Fetch_Pipeline_Register|OUT\(17) & ((\My_Adder|OUT[16]~29\) # (GND)))
-- \My_Adder|OUT[17]~31\ = CARRY((!\My_Adder|OUT[16]~29\) # (!\Fetch_Pipeline_Register|OUT\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(17),
	datad => VCC,
	cin => \My_Adder|OUT[16]~29\,
	combout => \My_Adder|OUT[17]~30_combout\,
	cout => \My_Adder|OUT[17]~31\);

-- Location: LCCOMB_X114_Y59_N8
\My_RegFile|mux_2|Mux14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux14~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[17]~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_RegFile|mux_2|Mux30~0_combout\,
	datac => \My_Adder|OUT[17]~30_combout\,
	combout => \My_RegFile|mux_2|Mux14~0_combout\);

-- Location: LCCOMB_X116_Y59_N4
\Fetch_Pipeline_Register|OUT~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~20_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[18]~32_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \MUX1|output_value[2]~20_combout\,
	datad => \My_Adder|OUT[18]~32_combout\,
	combout => \Fetch_Pipeline_Register|OUT~20_combout\);

-- Location: FF_X116_Y59_N5
\Fetch_Pipeline_Register|OUT[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~20_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(18));

-- Location: LCCOMB_X115_Y59_N2
\My_Adder|OUT[18]~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[18]~32_combout\ = (\Fetch_Pipeline_Register|OUT\(18) & (\My_Adder|OUT[17]~31\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(18) & (!\My_Adder|OUT[17]~31\ & VCC))
-- \My_Adder|OUT[18]~33\ = CARRY((\Fetch_Pipeline_Register|OUT\(18) & !\My_Adder|OUT[17]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(18),
	datad => VCC,
	cin => \My_Adder|OUT[17]~31\,
	combout => \My_Adder|OUT[18]~32_combout\,
	cout => \My_Adder|OUT[18]~33\);

-- Location: LCCOMB_X116_Y61_N20
\My_RegFile|mux_2|Mux13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux13~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[18]~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	datad => \My_Adder|OUT[18]~32_combout\,
	combout => \My_RegFile|mux_2|Mux13~0_combout\);

-- Location: LCCOMB_X114_Y59_N6
\Fetch_Pipeline_Register|OUT~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~21_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[19]~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \My_Adder|OUT[19]~34_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~21_combout\);

-- Location: FF_X114_Y59_N7
\Fetch_Pipeline_Register|OUT[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~21_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(19));

-- Location: LCCOMB_X115_Y59_N4
\My_Adder|OUT[19]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[19]~34_combout\ = (\Fetch_Pipeline_Register|OUT\(19) & (!\My_Adder|OUT[18]~33\)) # (!\Fetch_Pipeline_Register|OUT\(19) & ((\My_Adder|OUT[18]~33\) # (GND)))
-- \My_Adder|OUT[19]~35\ = CARRY((!\My_Adder|OUT[18]~33\) # (!\Fetch_Pipeline_Register|OUT\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(19),
	datad => VCC,
	cin => \My_Adder|OUT[18]~33\,
	combout => \My_Adder|OUT[19]~34_combout\,
	cout => \My_Adder|OUT[19]~35\);

-- Location: LCCOMB_X114_Y59_N24
\My_RegFile|mux_2|Mux12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux12~0_combout\ = (\My_Adder|OUT[19]~34_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[19]~34_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux12~0_combout\);

-- Location: LCCOMB_X114_Y59_N22
\Fetch_Pipeline_Register|OUT~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~22_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[20]~36_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_Adder|OUT[20]~36_combout\,
	combout => \Fetch_Pipeline_Register|OUT~22_combout\);

-- Location: FF_X114_Y59_N23
\Fetch_Pipeline_Register|OUT[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~22_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(20));

-- Location: LCCOMB_X115_Y59_N6
\My_Adder|OUT[20]~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[20]~36_combout\ = (\Fetch_Pipeline_Register|OUT\(20) & (\My_Adder|OUT[19]~35\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(20) & (!\My_Adder|OUT[19]~35\ & VCC))
-- \My_Adder|OUT[20]~37\ = CARRY((\Fetch_Pipeline_Register|OUT\(20) & !\My_Adder|OUT[19]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(20),
	datad => VCC,
	cin => \My_Adder|OUT[19]~35\,
	combout => \My_Adder|OUT[20]~36_combout\,
	cout => \My_Adder|OUT[20]~37\);

-- Location: LCCOMB_X114_Y59_N12
\My_RegFile|mux_2|Mux11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux11~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[20]~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	datad => \My_Adder|OUT[20]~36_combout\,
	combout => \My_RegFile|mux_2|Mux11~0_combout\);

-- Location: LCCOMB_X116_Y59_N6
\Fetch_Pipeline_Register|OUT~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~23_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[21]~38_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \MUX1|output_value[2]~20_combout\,
	datad => \My_Adder|OUT[21]~38_combout\,
	combout => \Fetch_Pipeline_Register|OUT~23_combout\);

-- Location: FF_X116_Y59_N7
\Fetch_Pipeline_Register|OUT[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~23_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(21));

-- Location: LCCOMB_X115_Y59_N8
\My_Adder|OUT[21]~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[21]~38_combout\ = (\Fetch_Pipeline_Register|OUT\(21) & (!\My_Adder|OUT[20]~37\)) # (!\Fetch_Pipeline_Register|OUT\(21) & ((\My_Adder|OUT[20]~37\) # (GND)))
-- \My_Adder|OUT[21]~39\ = CARRY((!\My_Adder|OUT[20]~37\) # (!\Fetch_Pipeline_Register|OUT\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(21),
	datad => VCC,
	cin => \My_Adder|OUT[20]~37\,
	combout => \My_Adder|OUT[21]~38_combout\,
	cout => \My_Adder|OUT[21]~39\);

-- Location: LCCOMB_X116_Y60_N12
\My_RegFile|mux_2|Mux10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux10~0_combout\ = (\My_Adder|OUT[21]~38_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[21]~38_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux10~0_combout\);

-- Location: LCCOMB_X114_Y59_N2
\Fetch_Pipeline_Register|OUT~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~24_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[22]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \My_Adder|OUT[22]~40_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \Fetch_Pipeline_Register|OUT~24_combout\);

-- Location: FF_X114_Y59_N3
\Fetch_Pipeline_Register|OUT[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~24_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(22));

-- Location: LCCOMB_X115_Y59_N10
\My_Adder|OUT[22]~40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[22]~40_combout\ = (\Fetch_Pipeline_Register|OUT\(22) & (\My_Adder|OUT[21]~39\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(22) & (!\My_Adder|OUT[21]~39\ & VCC))
-- \My_Adder|OUT[22]~41\ = CARRY((\Fetch_Pipeline_Register|OUT\(22) & !\My_Adder|OUT[21]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(22),
	datad => VCC,
	cin => \My_Adder|OUT[21]~39\,
	combout => \My_Adder|OUT[22]~40_combout\,
	cout => \My_Adder|OUT[22]~41\);

-- Location: LCCOMB_X116_Y61_N10
\My_RegFile|mux_2|Mux9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux9~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[22]~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	datad => \My_Adder|OUT[22]~40_combout\,
	combout => \My_RegFile|mux_2|Mux9~0_combout\);

-- Location: LCCOMB_X116_Y59_N12
\Fetch_Pipeline_Register|OUT~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~25_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[23]~42_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \MUX1|output_value[2]~20_combout\,
	datad => \My_Adder|OUT[23]~42_combout\,
	combout => \Fetch_Pipeline_Register|OUT~25_combout\);

-- Location: FF_X116_Y59_N13
\Fetch_Pipeline_Register|OUT[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~25_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(23));

-- Location: LCCOMB_X115_Y59_N12
\My_Adder|OUT[23]~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[23]~42_combout\ = (\Fetch_Pipeline_Register|OUT\(23) & (!\My_Adder|OUT[22]~41\)) # (!\Fetch_Pipeline_Register|OUT\(23) & ((\My_Adder|OUT[22]~41\) # (GND)))
-- \My_Adder|OUT[23]~43\ = CARRY((!\My_Adder|OUT[22]~41\) # (!\Fetch_Pipeline_Register|OUT\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(23),
	datad => VCC,
	cin => \My_Adder|OUT[22]~41\,
	combout => \My_Adder|OUT[23]~42_combout\,
	cout => \My_Adder|OUT[23]~43\);

-- Location: LCCOMB_X116_Y60_N30
\My_RegFile|mux_2|Mux8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux8~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[23]~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_RegFile|mux_2|Mux30~0_combout\,
	datac => \My_Adder|OUT[23]~42_combout\,
	combout => \My_RegFile|mux_2|Mux8~0_combout\);

-- Location: LCCOMB_X115_Y56_N16
\My_ALU|Add0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_ALU|Add0~3_combout\ = (!\ALUControlE[3]~input_o\ & !\ALUControlE[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ALUControlE[3]~input_o\,
	datad => \ALUControlE[2]~input_o\,
	combout => \My_ALU|Add0~3_combout\);

-- Location: LCCOMB_X116_Y56_N26
\MUX1|output_value[24]~43\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[24]~43_combout\ = (\BranchTakenE~input_o\ & (\My_ALU|Add0~3_combout\ & (\My_ALU|Add0~2_combout\ & !\My_ALU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \My_ALU|Add0~3_combout\,
	datac => \My_ALU|Add0~2_combout\,
	datad => \My_ALU|Add0~1_combout\,
	combout => \MUX1|output_value[24]~43_combout\);

-- Location: LCCOMB_X116_Y59_N30
\Fetch_Pipeline_Register|OUT~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~26_combout\ = (\Fetch_Pipeline_Register|OUT~3_combout\ & (((\MUX1|output_value[24]~43_combout\) # (\My_ALU|Mux1~0_combout\)) # (!\BranchTakenE~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \Fetch_Pipeline_Register|OUT~3_combout\,
	datac => \MUX1|output_value[24]~43_combout\,
	datad => \My_ALU|Mux1~0_combout\,
	combout => \Fetch_Pipeline_Register|OUT~26_combout\);

-- Location: LCCOMB_X116_Y59_N22
\Fetch_Pipeline_Register|OUT~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~27_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\) # (\My_Adder|OUT[24]~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~43_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \Fetch_Pipeline_Register|OUT~26_combout\,
	datad => \My_Adder|OUT[24]~44_combout\,
	combout => \Fetch_Pipeline_Register|OUT~27_combout\);

-- Location: FF_X116_Y59_N23
\Fetch_Pipeline_Register|OUT[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~27_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(24));

-- Location: LCCOMB_X115_Y59_N14
\My_Adder|OUT[24]~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[24]~44_combout\ = (\Fetch_Pipeline_Register|OUT\(24) & (\My_Adder|OUT[23]~43\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(24) & (!\My_Adder|OUT[23]~43\ & VCC))
-- \My_Adder|OUT[24]~45\ = CARRY((\Fetch_Pipeline_Register|OUT\(24) & !\My_Adder|OUT[23]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(24),
	datad => VCC,
	cin => \My_Adder|OUT[23]~43\,
	combout => \My_Adder|OUT[24]~44_combout\,
	cout => \My_Adder|OUT[24]~45\);

-- Location: LCCOMB_X116_Y55_N20
\My_RegFile|mux_2|Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux7~0_combout\ = (\My_Adder|OUT[24]~44_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[24]~44_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux7~0_combout\);

-- Location: LCCOMB_X116_Y59_N28
\Fetch_Pipeline_Register|OUT~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~28_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\) # (\My_Adder|OUT[25]~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~43_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \My_Adder|OUT[25]~46_combout\,
	datad => \Fetch_Pipeline_Register|OUT~26_combout\,
	combout => \Fetch_Pipeline_Register|OUT~28_combout\);

-- Location: FF_X116_Y59_N29
\Fetch_Pipeline_Register|OUT[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~28_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(25));

-- Location: LCCOMB_X115_Y59_N16
\My_Adder|OUT[25]~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[25]~46_combout\ = (\Fetch_Pipeline_Register|OUT\(25) & (!\My_Adder|OUT[24]~45\)) # (!\Fetch_Pipeline_Register|OUT\(25) & ((\My_Adder|OUT[24]~45\) # (GND)))
-- \My_Adder|OUT[25]~47\ = CARRY((!\My_Adder|OUT[24]~45\) # (!\Fetch_Pipeline_Register|OUT\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(25),
	datad => VCC,
	cin => \My_Adder|OUT[24]~45\,
	combout => \My_Adder|OUT[25]~46_combout\,
	cout => \My_Adder|OUT[25]~47\);

-- Location: LCCOMB_X116_Y58_N26
\My_RegFile|mux_2|Mux6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux6~0_combout\ = (\My_Adder|OUT[25]~46_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \My_Adder|OUT[25]~46_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux6~0_combout\);

-- Location: LCCOMB_X116_Y59_N14
\Fetch_Pipeline_Register|OUT~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~29_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\) # (\My_Adder|OUT[26]~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~43_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \Fetch_Pipeline_Register|OUT~26_combout\,
	datad => \My_Adder|OUT[26]~48_combout\,
	combout => \Fetch_Pipeline_Register|OUT~29_combout\);

-- Location: FF_X116_Y59_N15
\Fetch_Pipeline_Register|OUT[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~29_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(26));

-- Location: LCCOMB_X115_Y59_N18
\My_Adder|OUT[26]~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[26]~48_combout\ = (\Fetch_Pipeline_Register|OUT\(26) & (\My_Adder|OUT[25]~47\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(26) & (!\My_Adder|OUT[25]~47\ & VCC))
-- \My_Adder|OUT[26]~49\ = CARRY((\Fetch_Pipeline_Register|OUT\(26) & !\My_Adder|OUT[25]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(26),
	datad => VCC,
	cin => \My_Adder|OUT[25]~47\,
	combout => \My_Adder|OUT[26]~48_combout\,
	cout => \My_Adder|OUT[26]~49\);

-- Location: LCCOMB_X116_Y59_N24
\My_RegFile|mux_2|Mux5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux5~0_combout\ = (\My_Adder|OUT[26]~48_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[26]~48_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux5~0_combout\);

-- Location: LCCOMB_X116_Y59_N18
\Fetch_Pipeline_Register|OUT~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~30_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\BranchTakenE~input_o\) # ((\MUX1|output_value[24]~43_combout\) # (\My_Adder|OUT[27]~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \MUX1|output_value[24]~43_combout\,
	datac => \Fetch_Pipeline_Register|OUT~26_combout\,
	datad => \My_Adder|OUT[27]~50_combout\,
	combout => \Fetch_Pipeline_Register|OUT~30_combout\);

-- Location: FF_X116_Y59_N19
\Fetch_Pipeline_Register|OUT[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~30_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(27));

-- Location: LCCOMB_X115_Y59_N20
\My_Adder|OUT[27]~50\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[27]~50_combout\ = (\Fetch_Pipeline_Register|OUT\(27) & (!\My_Adder|OUT[26]~49\)) # (!\Fetch_Pipeline_Register|OUT\(27) & ((\My_Adder|OUT[26]~49\) # (GND)))
-- \My_Adder|OUT[27]~51\ = CARRY((!\My_Adder|OUT[26]~49\) # (!\Fetch_Pipeline_Register|OUT\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(27),
	datad => VCC,
	cin => \My_Adder|OUT[26]~49\,
	combout => \My_Adder|OUT[27]~50_combout\,
	cout => \My_Adder|OUT[27]~51\);

-- Location: LCCOMB_X116_Y59_N16
\My_RegFile|mux_2|Mux4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux4~0_combout\ = (\My_Adder|OUT[27]~50_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[27]~50_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux4~0_combout\);

-- Location: LCCOMB_X116_Y59_N2
\Fetch_Pipeline_Register|OUT~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~31_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\) # (\My_Adder|OUT[28]~52_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~43_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \Fetch_Pipeline_Register|OUT~26_combout\,
	datad => \My_Adder|OUT[28]~52_combout\,
	combout => \Fetch_Pipeline_Register|OUT~31_combout\);

-- Location: FF_X116_Y59_N3
\Fetch_Pipeline_Register|OUT[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~31_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(28));

-- Location: LCCOMB_X115_Y59_N22
\My_Adder|OUT[28]~52\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[28]~52_combout\ = (\Fetch_Pipeline_Register|OUT\(28) & (\My_Adder|OUT[27]~51\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(28) & (!\My_Adder|OUT[27]~51\ & VCC))
-- \My_Adder|OUT[28]~53\ = CARRY((\Fetch_Pipeline_Register|OUT\(28) & !\My_Adder|OUT[27]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(28),
	datad => VCC,
	cin => \My_Adder|OUT[27]~51\,
	combout => \My_Adder|OUT[28]~52_combout\,
	cout => \My_Adder|OUT[28]~53\);

-- Location: LCCOMB_X116_Y55_N22
\My_RegFile|mux_2|Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux3~0_combout\ = (\My_RegFile|mux_2|Mux30~0_combout\ & \My_Adder|OUT[28]~52_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_RegFile|mux_2|Mux30~0_combout\,
	datad => \My_Adder|OUT[28]~52_combout\,
	combout => \My_RegFile|mux_2|Mux3~0_combout\);

-- Location: LCCOMB_X116_Y59_N0
\Fetch_Pipeline_Register|OUT~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~32_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\) # (\My_Adder|OUT[29]~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~43_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \Fetch_Pipeline_Register|OUT~26_combout\,
	datad => \My_Adder|OUT[29]~54_combout\,
	combout => \Fetch_Pipeline_Register|OUT~32_combout\);

-- Location: FF_X116_Y59_N1
\Fetch_Pipeline_Register|OUT[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~32_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(29));

-- Location: LCCOMB_X115_Y59_N24
\My_Adder|OUT[29]~54\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[29]~54_combout\ = (\Fetch_Pipeline_Register|OUT\(29) & (!\My_Adder|OUT[28]~53\)) # (!\Fetch_Pipeline_Register|OUT\(29) & ((\My_Adder|OUT[28]~53\) # (GND)))
-- \My_Adder|OUT[29]~55\ = CARRY((!\My_Adder|OUT[28]~53\) # (!\Fetch_Pipeline_Register|OUT\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Fetch_Pipeline_Register|OUT\(29),
	datad => VCC,
	cin => \My_Adder|OUT[28]~53\,
	combout => \My_Adder|OUT[29]~54_combout\,
	cout => \My_Adder|OUT[29]~55\);

-- Location: LCCOMB_X116_Y59_N26
\My_RegFile|mux_2|Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux2~0_combout\ = (\My_Adder|OUT[29]~54_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[29]~54_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux2~0_combout\);

-- Location: LCCOMB_X116_Y59_N20
\Fetch_Pipeline_Register|OUT~33\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~33_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\) # (\My_Adder|OUT[30]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~43_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \My_Adder|OUT[30]~56_combout\,
	datad => \Fetch_Pipeline_Register|OUT~26_combout\,
	combout => \Fetch_Pipeline_Register|OUT~33_combout\);

-- Location: FF_X116_Y59_N21
\Fetch_Pipeline_Register|OUT[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~33_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(30));

-- Location: LCCOMB_X115_Y59_N26
\My_Adder|OUT[30]~56\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[30]~56_combout\ = (\Fetch_Pipeline_Register|OUT\(30) & (\My_Adder|OUT[29]~55\ $ (GND))) # (!\Fetch_Pipeline_Register|OUT\(30) & (!\My_Adder|OUT[29]~55\ & VCC))
-- \My_Adder|OUT[30]~57\ = CARRY((\Fetch_Pipeline_Register|OUT\(30) & !\My_Adder|OUT[29]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(30),
	datad => VCC,
	cin => \My_Adder|OUT[29]~55\,
	combout => \My_Adder|OUT[30]~56_combout\,
	cout => \My_Adder|OUT[30]~57\);

-- Location: LCCOMB_X116_Y58_N12
\My_RegFile|mux_2|Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux1~0_combout\ = (\My_Adder|OUT[30]~56_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[30]~56_combout\,
	datad => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux1~0_combout\);

-- Location: LCCOMB_X115_Y59_N30
\Fetch_Pipeline_Register|OUT~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Fetch_Pipeline_Register|OUT~34_combout\ = (\Fetch_Pipeline_Register|OUT~26_combout\ & ((\BranchTakenE~input_o\) # ((\MUX1|output_value[24]~43_combout\) # (\My_Adder|OUT[31]~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \MUX1|output_value[24]~43_combout\,
	datac => \Fetch_Pipeline_Register|OUT~26_combout\,
	datad => \My_Adder|OUT[31]~58_combout\,
	combout => \Fetch_Pipeline_Register|OUT~34_combout\);

-- Location: FF_X115_Y59_N31
\Fetch_Pipeline_Register|OUT[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Fetch_Pipeline_Register|OUT~34_combout\,
	ena => \Fetch_Pipeline_Register|OUT[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Fetch_Pipeline_Register|OUT\(31));

-- Location: LCCOMB_X115_Y59_N28
\My_Adder|OUT[31]~58\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_Adder|OUT[31]~58_combout\ = \Fetch_Pipeline_Register|OUT\(31) $ (\My_Adder|OUT[30]~57\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Fetch_Pipeline_Register|OUT\(31),
	cin => \My_Adder|OUT[30]~57\,
	combout => \My_Adder|OUT[31]~58_combout\);

-- Location: LCCOMB_X116_Y61_N16
\My_RegFile|mux_2|Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \My_RegFile|mux_2|Mux0~0_combout\ = (\My_Adder|OUT[31]~58_combout\ & \My_RegFile|mux_2|Mux30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \My_Adder|OUT[31]~58_combout\,
	datac => \My_RegFile|mux_2|Mux30~0_combout\,
	combout => \My_RegFile|mux_2|Mux0~0_combout\);

-- Location: LCCOMB_X116_Y52_N20
\MUX1|output_value[0]~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[0]~17_combout\ = (\MUX1|output_value[0]~16_combout\) # ((\BranchTakenE~input_o\ & \My_ALU|Mux31~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[0]~16_combout\,
	datab => \BranchTakenE~input_o\,
	datad => \My_ALU|Mux31~5_combout\,
	combout => \MUX1|output_value[0]~17_combout\);

-- Location: LCCOMB_X116_Y57_N4
\MUX1|output_value[2]~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[2]~19_combout\ = (\BranchTakenE~input_o\ & (\ALUControlE[1]~input_o\)) # (!\BranchTakenE~input_o\ & ((!\PCSrcW~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \PCSrcW~input_o\,
	combout => \MUX1|output_value[2]~19_combout\);

-- Location: LCCOMB_X116_Y58_N14
\MUX1|output_value[2]~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[2]~21_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[2]~0_combout\,
	datab => \MUX1|output_value[2]~20_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~19_combout\,
	combout => \MUX1|output_value[2]~21_combout\);

-- Location: LCCOMB_X116_Y60_N16
\MUX1|output_value[3]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[3]~22_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \My_Adder|OUT[3]~2_combout\,
	datac => \MUX1|output_value[2]~19_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \MUX1|output_value[3]~22_combout\);

-- Location: LCCOMB_X116_Y58_N4
\MUX1|output_value[4]~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[4]~23_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[4]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~19_combout\,
	datab => \My_Adder|OUT[4]~4_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \MUX1|output_value[4]~23_combout\);

-- Location: LCCOMB_X116_Y60_N26
\MUX1|output_value[5]~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[5]~24_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[5]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[5]~6_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \MUX1|output_value[5]~24_combout\);

-- Location: LCCOMB_X116_Y58_N22
\MUX1|output_value[6]~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[6]~25_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[6]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[6]~8_combout\,
	datab => \MUX1|output_value[2]~20_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~19_combout\,
	combout => \MUX1|output_value[6]~25_combout\);

-- Location: LCCOMB_X116_Y60_N24
\MUX1|output_value[7]~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[7]~26_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[7]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[7]~10_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \MUX1|output_value[7]~26_combout\);

-- Location: LCCOMB_X116_Y58_N8
\MUX1|output_value[8]~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[8]~27_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[8]~12_combout\,
	datab => \MUX1|output_value[2]~20_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~19_combout\,
	combout => \MUX1|output_value[8]~27_combout\);

-- Location: LCCOMB_X115_Y58_N10
\MUX1|output_value[9]~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[9]~28_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[9]~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \My_Adder|OUT[9]~14_combout\,
	datad => \BranchTakenE~input_o\,
	combout => \MUX1|output_value[9]~28_combout\);

-- Location: LCCOMB_X114_Y60_N2
\MUX1|output_value[10]~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[10]~29_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[10]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_Adder|OUT[10]~16_combout\,
	combout => \MUX1|output_value[10]~29_combout\);

-- Location: LCCOMB_X114_Y59_N4
\MUX1|output_value[11]~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[11]~30_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[11]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[11]~18_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \MUX1|output_value[11]~30_combout\);

-- Location: LCCOMB_X114_Y60_N20
\MUX1|output_value[12]~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[12]~31_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[12]~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_Adder|OUT[12]~20_combout\,
	combout => \MUX1|output_value[12]~31_combout\);

-- Location: LCCOMB_X114_Y60_N22
\MUX1|output_value[13]~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[13]~32_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[13]~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_Adder|OUT[13]~22_combout\,
	combout => \MUX1|output_value[13]~32_combout\);

-- Location: LCCOMB_X116_Y60_N18
\MUX1|output_value[14]~33\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[14]~33_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[14]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[14]~24_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \MUX1|output_value[2]~19_combout\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \MUX1|output_value[14]~33_combout\);

-- Location: LCCOMB_X114_Y59_N14
\MUX1|output_value[15]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[15]~34_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[15]~26_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \My_Adder|OUT[15]~26_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~19_combout\,
	combout => \MUX1|output_value[15]~34_combout\);

-- Location: LCCOMB_X114_Y59_N16
\MUX1|output_value[16]~35\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[16]~35_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[16]~28_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \My_Adder|OUT[16]~28_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~19_combout\,
	combout => \MUX1|output_value[16]~35_combout\);

-- Location: LCCOMB_X114_Y59_N10
\MUX1|output_value[17]~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[17]~36_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[17]~30_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \My_Adder|OUT[17]~30_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~19_combout\,
	combout => \MUX1|output_value[17]~36_combout\);

-- Location: LCCOMB_X115_Y58_N4
\MUX1|output_value[18]~37\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[18]~37_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[18]~32_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \MUX1|output_value[2]~20_combout\,
	datad => \My_Adder|OUT[18]~32_combout\,
	combout => \MUX1|output_value[18]~37_combout\);

-- Location: LCCOMB_X114_Y59_N20
\MUX1|output_value[19]~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[19]~38_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[19]~34_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \My_Adder|OUT[19]~34_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~19_combout\,
	combout => \MUX1|output_value[19]~38_combout\);

-- Location: LCCOMB_X114_Y59_N30
\MUX1|output_value[20]~39\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[20]~39_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[20]~36_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_Adder|OUT[20]~36_combout\,
	combout => \MUX1|output_value[20]~39_combout\);

-- Location: LCCOMB_X116_Y60_N28
\MUX1|output_value[21]~40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[21]~40_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & ((\MUX1|output_value[2]~20_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[21]~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[21]~38_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[2]~20_combout\,
	combout => \MUX1|output_value[21]~40_combout\);

-- Location: LCCOMB_X116_Y58_N6
\MUX1|output_value[22]~41\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[22]~41_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[22]~40_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~19_combout\,
	datab => \MUX1|output_value[2]~20_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_Adder|OUT[22]~40_combout\,
	combout => \MUX1|output_value[22]~41_combout\);

-- Location: LCCOMB_X116_Y60_N22
\MUX1|output_value[23]~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[23]~42_combout\ = (\MUX1|output_value[2]~19_combout\ & ((\BranchTakenE~input_o\ & (\MUX1|output_value[2]~20_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[23]~42_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[2]~20_combout\,
	datab => \MUX1|output_value[2]~19_combout\,
	datac => \My_Adder|OUT[23]~42_combout\,
	datad => \BranchTakenE~input_o\,
	combout => \MUX1|output_value[23]~42_combout\);

-- Location: LCCOMB_X116_Y57_N22
\MUX1|output_value[24]~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[24]~44_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & ((\My_ALU|Mux1~0_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[24]~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[24]~44_combout\,
	datab => \MUX1|output_value[24]~43_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_ALU|Mux1~0_combout\,
	combout => \MUX1|output_value[24]~44_combout\);

-- Location: LCCOMB_X116_Y57_N20
\MUX1|output_value[24]~52\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[24]~52_combout\ = (\MUX1|output_value[24]~44_combout\ & ((\BranchTakenE~input_o\ & (\ALUControlE[1]~input_o\)) # (!\BranchTakenE~input_o\ & ((!\PCSrcW~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~44_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \PCSrcW~input_o\,
	combout => \MUX1|output_value[24]~52_combout\);

-- Location: LCCOMB_X116_Y58_N24
\MUX1|output_value[25]~45\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[25]~45_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & ((\My_ALU|Mux1~0_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[25]~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[24]~43_combout\,
	datab => \My_Adder|OUT[25]~46_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_ALU|Mux1~0_combout\,
	combout => \MUX1|output_value[25]~45_combout\);

-- Location: LCCOMB_X116_Y57_N10
\MUX1|output_value[25]~53\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[25]~53_combout\ = (\MUX1|output_value[25]~45_combout\ & ((\BranchTakenE~input_o\ & ((\ALUControlE[1]~input_o\))) # (!\BranchTakenE~input_o\ & (!\PCSrcW~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCSrcW~input_o\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \MUX1|output_value[25]~45_combout\,
	combout => \MUX1|output_value[25]~53_combout\);

-- Location: LCCOMB_X115_Y57_N14
\MUX1|output_value[26]~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[26]~46_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & (\My_ALU|Mux1~0_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[26]~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux1~0_combout\,
	datab => \My_Adder|OUT[26]~48_combout\,
	datac => \MUX1|output_value[24]~43_combout\,
	datad => \BranchTakenE~input_o\,
	combout => \MUX1|output_value[26]~46_combout\);

-- Location: LCCOMB_X116_Y57_N16
\MUX1|output_value[26]~54\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[26]~54_combout\ = (\MUX1|output_value[26]~46_combout\ & ((\BranchTakenE~input_o\ & (\ALUControlE[1]~input_o\)) # (!\BranchTakenE~input_o\ & ((!\PCSrcW~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[26]~46_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \PCSrcW~input_o\,
	combout => \MUX1|output_value[26]~54_combout\);

-- Location: LCCOMB_X116_Y59_N10
\MUX1|output_value[27]~47\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[27]~47_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & ((\My_ALU|Mux1~0_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[27]~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \My_Adder|OUT[27]~50_combout\,
	datac => \MUX1|output_value[24]~43_combout\,
	datad => \My_ALU|Mux1~0_combout\,
	combout => \MUX1|output_value[27]~47_combout\);

-- Location: LCCOMB_X116_Y57_N30
\MUX1|output_value[27]~55\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[27]~55_combout\ = (\MUX1|output_value[27]~47_combout\ & ((\BranchTakenE~input_o\ & (\ALUControlE[1]~input_o\)) # (!\BranchTakenE~input_o\ & ((!\PCSrcW~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[27]~47_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \PCSrcW~input_o\,
	combout => \MUX1|output_value[27]~55_combout\);

-- Location: LCCOMB_X116_Y57_N28
\MUX1|output_value[28]~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[28]~48_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & ((\My_ALU|Mux1~0_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[28]~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_Adder|OUT[28]~52_combout\,
	datab => \MUX1|output_value[24]~43_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \My_ALU|Mux1~0_combout\,
	combout => \MUX1|output_value[28]~48_combout\);

-- Location: LCCOMB_X116_Y57_N24
\MUX1|output_value[28]~56\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[28]~56_combout\ = (\MUX1|output_value[28]~48_combout\ & ((\BranchTakenE~input_o\ & ((\ALUControlE[1]~input_o\))) # (!\BranchTakenE~input_o\ & (!\PCSrcW~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCSrcW~input_o\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \MUX1|output_value[28]~48_combout\,
	combout => \MUX1|output_value[28]~56_combout\);

-- Location: LCCOMB_X116_Y59_N8
\MUX1|output_value[29]~49\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[29]~49_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & ((\My_ALU|Mux1~0_combout\))) # (!\BranchTakenE~input_o\ & (\My_Adder|OUT[29]~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BranchTakenE~input_o\,
	datab => \My_Adder|OUT[29]~54_combout\,
	datac => \MUX1|output_value[24]~43_combout\,
	datad => \My_ALU|Mux1~0_combout\,
	combout => \MUX1|output_value[29]~49_combout\);

-- Location: LCCOMB_X116_Y57_N2
\MUX1|output_value[29]~57\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[29]~57_combout\ = (\MUX1|output_value[29]~49_combout\ & ((\BranchTakenE~input_o\ & (\ALUControlE[1]~input_o\)) # (!\BranchTakenE~input_o\ & ((!\PCSrcW~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[29]~49_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \PCSrcW~input_o\,
	combout => \MUX1|output_value[29]~57_combout\);

-- Location: LCCOMB_X116_Y58_N30
\MUX1|output_value[30]~50\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[30]~50_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & (\My_ALU|Mux1~0_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[30]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux1~0_combout\,
	datab => \My_Adder|OUT[30]~56_combout\,
	datac => \BranchTakenE~input_o\,
	datad => \MUX1|output_value[24]~43_combout\,
	combout => \MUX1|output_value[30]~50_combout\);

-- Location: LCCOMB_X116_Y57_N8
\MUX1|output_value[30]~58\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[30]~58_combout\ = (\MUX1|output_value[30]~50_combout\ & ((\BranchTakenE~input_o\ & (\ALUControlE[1]~input_o\)) # (!\BranchTakenE~input_o\ & ((!\PCSrcW~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX1|output_value[30]~50_combout\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \PCSrcW~input_o\,
	combout => \MUX1|output_value[30]~58_combout\);

-- Location: LCCOMB_X115_Y57_N28
\MUX1|output_value[31]~51\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[31]~51_combout\ = (\MUX1|output_value[24]~43_combout\) # ((\BranchTakenE~input_o\ & (\My_ALU|Mux1~0_combout\)) # (!\BranchTakenE~input_o\ & ((\My_Adder|OUT[31]~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \My_ALU|Mux1~0_combout\,
	datab => \My_Adder|OUT[31]~58_combout\,
	datac => \MUX1|output_value[24]~43_combout\,
	datad => \BranchTakenE~input_o\,
	combout => \MUX1|output_value[31]~51_combout\);

-- Location: LCCOMB_X116_Y57_N26
\MUX1|output_value[31]~59\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX1|output_value[31]~59_combout\ = (\MUX1|output_value[31]~51_combout\ & ((\BranchTakenE~input_o\ & ((\ALUControlE[1]~input_o\))) # (!\BranchTakenE~input_o\ & (!\PCSrcW~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCSrcW~input_o\,
	datab => \BranchTakenE~input_o\,
	datac => \ALUControlE[1]~input_o\,
	datad => \MUX1|output_value[31]~51_combout\,
	combout => \MUX1|output_value[31]~59_combout\);

-- Location: IOIBUF_X82_Y0_N8
\RegSrcD[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RegSrcD(1),
	o => \RegSrcD[1]~input_o\);

-- Location: IOIBUF_X53_Y91_N8
\ImmSrcD[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ImmSrcD(0),
	o => \ImmSrcD[0]~input_o\);

-- Location: IOIBUF_X115_Y0_N22
\ImmSrcD[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ImmSrcD(1),
	o => \ImmSrcD[1]~input_o\);

-- Location: IOIBUF_X117_Y18_N1
\shifter_ctrl[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shifter_ctrl(1),
	o => \shifter_ctrl[1]~input_o\);

-- Location: IOIBUF_X117_Y7_N1
\shifter_ctrl[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shifter_ctrl(0),
	o => \shifter_ctrl[0]~input_o\);

ww_Op(0) <= \Op[0]~output_o\;

ww_Op(1) <= \Op[1]~output_o\;

ww_Funct(0) <= \Funct[0]~output_o\;

ww_Funct(1) <= \Funct[1]~output_o\;

ww_Funct(2) <= \Funct[2]~output_o\;

ww_Funct(3) <= \Funct[3]~output_o\;

ww_Funct(4) <= \Funct[4]~output_o\;

ww_Rd(0) <= \Rd[0]~output_o\;

ww_Rd(1) <= \Rd[1]~output_o\;

ww_Rd(2) <= \Rd[2]~output_o\;

ww_Rd(3) <= \Rd[3]~output_o\;

ww_Cond(0) <= \Cond[0]~output_o\;

ww_Cond(1) <= \Cond[1]~output_o\;

ww_Cond(2) <= \Cond[2]~output_o\;

ww_Cond(3) <= \Cond[3]~output_o\;

ww_Src2(0) <= \Src2[0]~output_o\;

ww_Src2(1) <= \Src2[1]~output_o\;

ww_Src2(2) <= \Src2[2]~output_o\;

ww_Src2(3) <= \Src2[3]~output_o\;

ww_Src2(4) <= \Src2[4]~output_o\;

ww_Src2(5) <= \Src2[5]~output_o\;

ww_Src2(6) <= \Src2[6]~output_o\;

ww_Src2(7) <= \Src2[7]~output_o\;

ww_Src2(8) <= \Src2[8]~output_o\;

ww_Src2(9) <= \Src2[9]~output_o\;

ww_Src2(10) <= \Src2[10]~output_o\;

ww_Src2(11) <= \Src2[11]~output_o\;

ww_ALUFlags(0) <= \ALUFlags[0]~output_o\;

ww_ALUFlags(1) <= \ALUFlags[1]~output_o\;

ww_ALUFlags(2) <= \ALUFlags[2]~output_o\;

ww_ALUFlags(3) <= \ALUFlags[3]~output_o\;

ww_RD1E_Out(0) <= \RD1E_Out[0]~output_o\;

ww_RD1E_Out(1) <= \RD1E_Out[1]~output_o\;

ww_RD1E_Out(2) <= \RD1E_Out[2]~output_o\;

ww_RD1E_Out(3) <= \RD1E_Out[3]~output_o\;

ww_RD1E_Out(4) <= \RD1E_Out[4]~output_o\;

ww_RD1E_Out(5) <= \RD1E_Out[5]~output_o\;

ww_RD1E_Out(6) <= \RD1E_Out[6]~output_o\;

ww_RD1E_Out(7) <= \RD1E_Out[7]~output_o\;

ww_RD1E_Out(8) <= \RD1E_Out[8]~output_o\;

ww_RD1E_Out(9) <= \RD1E_Out[9]~output_o\;

ww_RD1E_Out(10) <= \RD1E_Out[10]~output_o\;

ww_RD1E_Out(11) <= \RD1E_Out[11]~output_o\;

ww_RD1E_Out(12) <= \RD1E_Out[12]~output_o\;

ww_RD1E_Out(13) <= \RD1E_Out[13]~output_o\;

ww_RD1E_Out(14) <= \RD1E_Out[14]~output_o\;

ww_RD1E_Out(15) <= \RD1E_Out[15]~output_o\;

ww_RD1E_Out(16) <= \RD1E_Out[16]~output_o\;

ww_RD1E_Out(17) <= \RD1E_Out[17]~output_o\;

ww_RD1E_Out(18) <= \RD1E_Out[18]~output_o\;

ww_RD1E_Out(19) <= \RD1E_Out[19]~output_o\;

ww_RD1E_Out(20) <= \RD1E_Out[20]~output_o\;

ww_RD1E_Out(21) <= \RD1E_Out[21]~output_o\;

ww_RD1E_Out(22) <= \RD1E_Out[22]~output_o\;

ww_RD1E_Out(23) <= \RD1E_Out[23]~output_o\;

ww_RD1E_Out(24) <= \RD1E_Out[24]~output_o\;

ww_RD1E_Out(25) <= \RD1E_Out[25]~output_o\;

ww_RD1E_Out(26) <= \RD1E_Out[26]~output_o\;

ww_RD1E_Out(27) <= \RD1E_Out[27]~output_o\;

ww_RD1E_Out(28) <= \RD1E_Out[28]~output_o\;

ww_RD1E_Out(29) <= \RD1E_Out[29]~output_o\;

ww_RD1E_Out(30) <= \RD1E_Out[30]~output_o\;

ww_RD1E_Out(31) <= \RD1E_Out[31]~output_o\;

ww_RD2E_Out(0) <= \RD2E_Out[0]~output_o\;

ww_RD2E_Out(1) <= \RD2E_Out[1]~output_o\;

ww_RD2E_Out(2) <= \RD2E_Out[2]~output_o\;

ww_RD2E_Out(3) <= \RD2E_Out[3]~output_o\;

ww_RD2E_Out(4) <= \RD2E_Out[4]~output_o\;

ww_RD2E_Out(5) <= \RD2E_Out[5]~output_o\;

ww_RD2E_Out(6) <= \RD2E_Out[6]~output_o\;

ww_RD2E_Out(7) <= \RD2E_Out[7]~output_o\;

ww_RD2E_Out(8) <= \RD2E_Out[8]~output_o\;

ww_RD2E_Out(9) <= \RD2E_Out[9]~output_o\;

ww_RD2E_Out(10) <= \RD2E_Out[10]~output_o\;

ww_RD2E_Out(11) <= \RD2E_Out[11]~output_o\;

ww_RD2E_Out(12) <= \RD2E_Out[12]~output_o\;

ww_RD2E_Out(13) <= \RD2E_Out[13]~output_o\;

ww_RD2E_Out(14) <= \RD2E_Out[14]~output_o\;

ww_RD2E_Out(15) <= \RD2E_Out[15]~output_o\;

ww_RD2E_Out(16) <= \RD2E_Out[16]~output_o\;

ww_RD2E_Out(17) <= \RD2E_Out[17]~output_o\;

ww_RD2E_Out(18) <= \RD2E_Out[18]~output_o\;

ww_RD2E_Out(19) <= \RD2E_Out[19]~output_o\;

ww_RD2E_Out(20) <= \RD2E_Out[20]~output_o\;

ww_RD2E_Out(21) <= \RD2E_Out[21]~output_o\;

ww_RD2E_Out(22) <= \RD2E_Out[22]~output_o\;

ww_RD2E_Out(23) <= \RD2E_Out[23]~output_o\;

ww_RD2E_Out(24) <= \RD2E_Out[24]~output_o\;

ww_RD2E_Out(25) <= \RD2E_Out[25]~output_o\;

ww_RD2E_Out(26) <= \RD2E_Out[26]~output_o\;

ww_RD2E_Out(27) <= \RD2E_Out[27]~output_o\;

ww_RD2E_Out(28) <= \RD2E_Out[28]~output_o\;

ww_RD2E_Out(29) <= \RD2E_Out[29]~output_o\;

ww_RD2E_Out(30) <= \RD2E_Out[30]~output_o\;

ww_RD2E_Out(31) <= \RD2E_Out[31]~output_o\;

ww_WA3M_Out(0) <= \WA3M_Out[0]~output_o\;

ww_WA3M_Out(1) <= \WA3M_Out[1]~output_o\;

ww_WA3M_Out(2) <= \WA3M_Out[2]~output_o\;

ww_WA3M_Out(3) <= \WA3M_Out[3]~output_o\;

ww_WA3W_Out(0) <= \WA3W_Out[0]~output_o\;

ww_WA3W_Out(1) <= \WA3W_Out[1]~output_o\;

ww_WA3W_Out(2) <= \WA3W_Out[2]~output_o\;

ww_WA3W_Out(3) <= \WA3W_Out[3]~output_o\;

ww_WA3E_Out(0) <= \WA3E_Out[0]~output_o\;

ww_WA3E_Out(1) <= \WA3E_Out[1]~output_o\;

ww_WA3E_Out(2) <= \WA3E_Out[2]~output_o\;

ww_WA3E_Out(3) <= \WA3E_Out[3]~output_o\;

ww_RD1D_Out(0) <= \RD1D_Out[0]~output_o\;

ww_RD1D_Out(1) <= \RD1D_Out[1]~output_o\;

ww_RD1D_Out(2) <= \RD1D_Out[2]~output_o\;

ww_RD1D_Out(3) <= \RD1D_Out[3]~output_o\;

ww_RD1D_Out(4) <= \RD1D_Out[4]~output_o\;

ww_RD1D_Out(5) <= \RD1D_Out[5]~output_o\;

ww_RD1D_Out(6) <= \RD1D_Out[6]~output_o\;

ww_RD1D_Out(7) <= \RD1D_Out[7]~output_o\;

ww_RD1D_Out(8) <= \RD1D_Out[8]~output_o\;

ww_RD1D_Out(9) <= \RD1D_Out[9]~output_o\;

ww_RD1D_Out(10) <= \RD1D_Out[10]~output_o\;

ww_RD1D_Out(11) <= \RD1D_Out[11]~output_o\;

ww_RD1D_Out(12) <= \RD1D_Out[12]~output_o\;

ww_RD1D_Out(13) <= \RD1D_Out[13]~output_o\;

ww_RD1D_Out(14) <= \RD1D_Out[14]~output_o\;

ww_RD1D_Out(15) <= \RD1D_Out[15]~output_o\;

ww_RD1D_Out(16) <= \RD1D_Out[16]~output_o\;

ww_RD1D_Out(17) <= \RD1D_Out[17]~output_o\;

ww_RD1D_Out(18) <= \RD1D_Out[18]~output_o\;

ww_RD1D_Out(19) <= \RD1D_Out[19]~output_o\;

ww_RD1D_Out(20) <= \RD1D_Out[20]~output_o\;

ww_RD1D_Out(21) <= \RD1D_Out[21]~output_o\;

ww_RD1D_Out(22) <= \RD1D_Out[22]~output_o\;

ww_RD1D_Out(23) <= \RD1D_Out[23]~output_o\;

ww_RD1D_Out(24) <= \RD1D_Out[24]~output_o\;

ww_RD1D_Out(25) <= \RD1D_Out[25]~output_o\;

ww_RD1D_Out(26) <= \RD1D_Out[26]~output_o\;

ww_RD1D_Out(27) <= \RD1D_Out[27]~output_o\;

ww_RD1D_Out(28) <= \RD1D_Out[28]~output_o\;

ww_RD1D_Out(29) <= \RD1D_Out[29]~output_o\;

ww_RD1D_Out(30) <= \RD1D_Out[30]~output_o\;

ww_RD1D_Out(31) <= \RD1D_Out[31]~output_o\;

ww_RD2D_Out(0) <= \RD2D_Out[0]~output_o\;

ww_RD2D_Out(1) <= \RD2D_Out[1]~output_o\;

ww_RD2D_Out(2) <= \RD2D_Out[2]~output_o\;

ww_RD2D_Out(3) <= \RD2D_Out[3]~output_o\;

ww_RD2D_Out(4) <= \RD2D_Out[4]~output_o\;

ww_RD2D_Out(5) <= \RD2D_Out[5]~output_o\;

ww_RD2D_Out(6) <= \RD2D_Out[6]~output_o\;

ww_RD2D_Out(7) <= \RD2D_Out[7]~output_o\;

ww_RD2D_Out(8) <= \RD2D_Out[8]~output_o\;

ww_RD2D_Out(9) <= \RD2D_Out[9]~output_o\;

ww_RD2D_Out(10) <= \RD2D_Out[10]~output_o\;

ww_RD2D_Out(11) <= \RD2D_Out[11]~output_o\;

ww_RD2D_Out(12) <= \RD2D_Out[12]~output_o\;

ww_RD2D_Out(13) <= \RD2D_Out[13]~output_o\;

ww_RD2D_Out(14) <= \RD2D_Out[14]~output_o\;

ww_RD2D_Out(15) <= \RD2D_Out[15]~output_o\;

ww_RD2D_Out(16) <= \RD2D_Out[16]~output_o\;

ww_RD2D_Out(17) <= \RD2D_Out[17]~output_o\;

ww_RD2D_Out(18) <= \RD2D_Out[18]~output_o\;

ww_RD2D_Out(19) <= \RD2D_Out[19]~output_o\;

ww_RD2D_Out(20) <= \RD2D_Out[20]~output_o\;

ww_RD2D_Out(21) <= \RD2D_Out[21]~output_o\;

ww_RD2D_Out(22) <= \RD2D_Out[22]~output_o\;

ww_RD2D_Out(23) <= \RD2D_Out[23]~output_o\;

ww_RD2D_Out(24) <= \RD2D_Out[24]~output_o\;

ww_RD2D_Out(25) <= \RD2D_Out[25]~output_o\;

ww_RD2D_Out(26) <= \RD2D_Out[26]~output_o\;

ww_RD2D_Out(27) <= \RD2D_Out[27]~output_o\;

ww_RD2D_Out(28) <= \RD2D_Out[28]~output_o\;

ww_RD2D_Out(29) <= \RD2D_Out[29]~output_o\;

ww_RD2D_Out(30) <= \RD2D_Out[30]~output_o\;

ww_RD2D_Out(31) <= \RD2D_Out[31]~output_o\;

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

ww_PC_Out(0) <= \PC_Out[0]~output_o\;

ww_PC_Out(1) <= \PC_Out[1]~output_o\;

ww_PC_Out(2) <= \PC_Out[2]~output_o\;

ww_PC_Out(3) <= \PC_Out[3]~output_o\;

ww_PC_Out(4) <= \PC_Out[4]~output_o\;

ww_PC_Out(5) <= \PC_Out[5]~output_o\;

ww_PC_Out(6) <= \PC_Out[6]~output_o\;

ww_PC_Out(7) <= \PC_Out[7]~output_o\;

ww_PC_Out(8) <= \PC_Out[8]~output_o\;

ww_PC_Out(9) <= \PC_Out[9]~output_o\;

ww_PC_Out(10) <= \PC_Out[10]~output_o\;

ww_PC_Out(11) <= \PC_Out[11]~output_o\;

ww_PC_Out(12) <= \PC_Out[12]~output_o\;

ww_PC_Out(13) <= \PC_Out[13]~output_o\;

ww_PC_Out(14) <= \PC_Out[14]~output_o\;

ww_PC_Out(15) <= \PC_Out[15]~output_o\;

ww_PC_Out(16) <= \PC_Out[16]~output_o\;

ww_PC_Out(17) <= \PC_Out[17]~output_o\;

ww_PC_Out(18) <= \PC_Out[18]~output_o\;

ww_PC_Out(19) <= \PC_Out[19]~output_o\;

ww_PC_Out(20) <= \PC_Out[20]~output_o\;

ww_PC_Out(21) <= \PC_Out[21]~output_o\;

ww_PC_Out(22) <= \PC_Out[22]~output_o\;

ww_PC_Out(23) <= \PC_Out[23]~output_o\;

ww_PC_Out(24) <= \PC_Out[24]~output_o\;

ww_PC_Out(25) <= \PC_Out[25]~output_o\;

ww_PC_Out(26) <= \PC_Out[26]~output_o\;

ww_PC_Out(27) <= \PC_Out[27]~output_o\;

ww_PC_Out(28) <= \PC_Out[28]~output_o\;

ww_PC_Out(29) <= \PC_Out[29]~output_o\;

ww_PC_Out(30) <= \PC_Out[30]~output_o\;

ww_PC_Out(31) <= \PC_Out[31]~output_o\;
END structure;


