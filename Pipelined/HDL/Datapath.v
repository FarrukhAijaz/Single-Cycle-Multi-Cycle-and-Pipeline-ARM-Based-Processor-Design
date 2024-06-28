	// Datapath.v
module Datapath(
    input clk,
	 input reset, 
	 input PCSrcW,
	 input BranchTakenE,
	 input [1:0] RegSrcD,
	 input ALUSrcE,
	 input BL_ctrl,
	 input [4:0] shamt,
	 input [1:0] shifter_ctrl,
	 input MemWriteM,
	 input MemtoRegW,
	 input [1:0]ImmSrcD,
	 input RegWriteW,
	 
	 input StallF,
	 input StallD,
	 input FlushD,
	 input FlushE,
	 input [1:0] ForwardAE,
	 input [1:0] ForwardBE,
	 input [3:0] ALUControlE,
	 
	 output [1:0] Op,
	 output [4:0] Funct,
	 output [3:0] Rd,
	 output [3:0] Cond,
	 output [11:0]Src2,
	 output [3:0] ALUFlags,
	 output [3:0] RA1E_Out,
	 output [3:0] RA2E_Out,
	 output [3:0] WA3M_Out,
	 output [3:0] WA3W_Out,
	 output [3:0] WA3E_Out,
	 output [3:0] RA1D_Out,
	 output [3:0] RA2D_Out,
	 
	 //for debugging
	 input [3:0] Switches,
	 output [31:0] HEX_Debug,
	 output [31:0] PC_Out
	 
);

wire [31:0] InstructionD;
wire [31:0] MUX0_Out;
wire [31:0] MUX7_Out;

wire [31:0] ResultW;
wire [31:0] PC_prime;

wire [31:0] ALUResultE;

wire [31:0] Const_Four;
wire [3:0] Const_Fifteen;
wire [3:0] Const_Forteen;
wire Const_Zero;
wire Const_One;

wire [31:0] PCPlus4F;
wire [31:0] PCF;

wire [31:0] RD1D;
wire [31:0] RD2D;

wire [31:0] RD1E;
wire [31:0] RD2E;

wire [3:0] RA1D;
wire [3:0] RA2D;

wire [3:0] RA1E;
wire [3:0] RA2E;

wire [31:0] WA3W;
wire [31:0] WA3M;
wire [3:0] WA3E;

wire [31:0] ExtImmD;
wire [31:0] ExtImmE;

wire [31:0] ReadDataM;




Mux_2to1 #(32) MUX0 
	(
        .input_0(PCPlus4F),
        .input_1(ResultW),
        .select(PCSrcW),
        .output_value(MUX0_Out)
    );
//done
Mux_2to1 #(32) MUX1 
	(
        .input_0(MUX0_Out),
        .input_1(ALUResultE),
        .select(BranchTakenE),
        .output_value(PC_prime)
    );
//done

Register_rsten  #(32) Fetch_Pipeline_Register

(
		.clk(clk), 
		.reset(reset),
		.we(~StallF),
		.DATA(PC_prime),
		.OUT(PCF)
);

Instruction_memory  #(4,32) IM_Fetch 
(
	.ADDR(PCF),
	.RD(InstructionF)
);

Adder #(32) My_Adder
(
	.DATA_A(PCF),
	.DATA_B(Const_Four),
	.OUT(PCPlus4F)
);

Register_rsten  #(32) Decode_Pipeline_Register 

(
		.clk(clk), 
		.reset(FlushD | reset),
		.we(StallD),
		.DATA(InstructionF),
		.OUT(InstructionD)
);

Register_rsten  #(32) PCPlus4_Fetch_to_Decode 

(
		.clk(clk), 
		.reset(FlushD | reset),
		.we(StallD),
		.DATA(PCF),
		.OUT(PCD)
);
Mux_2to1 #(4) MUX2 
	(
        .input_0(InstructionD [19:16]),
        .input_1(Const_Fifteen),
        .select(RegSrcD[0]),
        .output_value(RA1D)
    );
//done
Mux_2to1 #(4) MUX3 
	(
        .input_0(InstructionD [3:0]),
        .input_1(InstructionD [15:12]),
        .select(RegSrcD[1]),
        .output_value(RA2D)
    );
//done
Mux_2to1 #(32) MUX4
	(
        .input_0(WA3W),
        .input_1(Const_Forteen),
        .select(BL_ctrl),
        .output_value(WA3D)
    );
//done
Mux_2to1 #(32) MUX5 
	(
        .input_0(ResultW),
        .input_1(PCWB),
        .select(BL_ctrl),
        .output_value(WD3)
    );
//done

Register_file  #(32) My_RegFile 

(
		.clk(clk), 
		.write_enable(RegWriteW), 
		.reset(Const_Zero),
		.Source_select_0(RA1D), 
		.Source_select_1(RA2D), 
		.Debug_Source_select(Switches), 
		.Destination_select(WA3D),
		.DATA(WD3), 
		.Reg_15(PCPlus4F),
		.out_0(RD1D), 
		.out_1(RD2D), 
		.Debug_out(HEX_Debug)
);
//done
Extender My_Extender 
		(
			.Extended_data(ExtImmD),
			.DATA(InstructionD [23:0]),
			.select(ImmSrcD)
		);
//done

Register_reset  #(4) RA1_Decode_to_Execute

(
		.clk(clk), 
		.reset(reset|FlushE),
		.DATA(RA1D),
		.OUT(RA1E)
);

Register_reset  #(4) RA2_Decode_to_Execute

(
		.clk(clk), 
		.reset(reset|FlushE),
		.DATA(RA2D),
		.OUT(RA2E)
);

Register_reset  #(32) RD1_Decode_to_Execute

(
		.clk(clk), 
		.reset(reset|FlushE),
		.DATA(RD1D),
		.OUT(RD1E)
);

Register_reset  #(32) RD2_Decode_to_Execute

(
		.clk(clk), 
		.reset(reset|FlushE),
		.DATA(RD2D),
		.OUT(RD2E)
);

Register_reset  #(4) WA3D_Decode_to_Execute

(
		.clk(clk), 
		.reset(reset|FlushE),
		.DATA(WA3D),
		.OUT(WA3E)
);

Register_reset  #(32) ExtImmD_Decode_to_Execute

(
		.clk(clk), 
		.reset(reset|FlushE),
		.DATA(ExtImmD),
		.OUT(ExtImmE)
);

Register_reset  #(32) PCPlus4_Decode_to_Execute

(
		.clk(clk), 
		.reset(reset|FlushE),
		.DATA(PCD),
		.OUT(PCE)
);



Mux_4to1 #(32) MUX6 
	(
        .input_0(RD1E),
        .input_1(ResultW),
		  .input_2(A),
		  .input_3(Const_Zero),
        .select(ForwardAE),
        .output_value(SrcAE)
    );
//done
Mux_4to1 #(32) MUX7 
	(
        .input_0(RD2E),
        .input_1(ResultW),
		  .input_2(A),
		  .input_3(Const_Zero),
        .select(ForwardBE),
        .output_value(MUX7_Out)
    );
//done
Mux_2to1 #(32) MUX8 
	(
        .input_0(MUX7_Out),
        .input_1(ExtImmE),
        .select(ALUSrcE),
        .output_value(shift_input)
    );

shifter #(32) My_Shifter 
		(
			.control(shifter_ctrl),
			.shamt(shamt),
			.DATA(shift_input),
			.OUT(shift_output)
		);
	 
ALU #(32) My_ALU 
	(
		.control(ALUControlE),
		.CI(Const_Zero),
		.DATA_A(SrcAE),
		.DATA_B(shift_output),
		.OUT(ALUResultE),
		.CO(ALUFlags [3]),
		.OVF(ALUFlags [2]),
		.N(ALUFlags [1]), 
		.Z(ALUFlags [0])
	);


Register_reset  #(32) PCPlus4_Execute_to_Memory

(
		.clk(clk), 
		.reset(reset),
		.DATA(PCE),
		.OUT(PCM)
);

Register_reset  #(4) WA3_Execute_to_Memory

(
		.clk(clk), 
		.reset(reset),
		.DATA(WA3E),
		.OUT(WA3M)
);

Register_reset  #(32) WriteData_Execute_to_Memory

(
		.clk(clk), 
		.reset(reset),
		.DATA(RD2E),
		.OUT(WD)
);

Register_reset  #(32) ALUResult_Execute_to_Memory

(
		.clk(clk), 
		.reset(reset),
		.DATA(ALUResultE),
		.OUT(A)
);

Memory #(4,32) Data_Memory
(
	.clk(clk),
	.WE(MemWriteM),
	.ADDR(A),	
	.WD(WD),
	.RD(ReadDataM) 
);


Register_reset  #(32) RD_Memory_to_WriteBack

(
		.clk(clk), 
		.reset(reset),
		.DATA(ReadDataM),
		.OUT(ReadDataW)
);


Register_reset  #(32) ALUOut_Memory_to_WriteBack

(
		.clk(clk), 
		.reset(reset),
		.DATA(A),
		.OUT(ALUOutW)
);


Register_reset  #(4) WA3_Memory_to_WriteBack

(
		.clk(clk), 
		.reset(reset),
		.DATA(WA3M),
		.OUT(WA3W)
);

Register_reset  #(32) PCPlus4_Memory_to_WriteBack

(
		.clk(clk), 
		.reset(reset),
		.DATA(PCM),
		.OUT(PCWB)
);
Mux_2to1 #(32) MUX9 
	(
        .input_0(ReadDataW),
        .input_1(ALUOutW),
        .select(MemtoRegW),
        .output_value(ResultW)
    );

Constant4 #(32,4)My_Constant_Four
(
	.const_value(Const_Four)
);
Constant4 #(4,15)My_Constant_Fifteen
(
	.const_value(Const_Fifteen)
);
Constant4 #(4,14)My_Constant_Forteen
(
	.const_value(Const_Forteen)
);
Constant4 #(32,0)My_Constant_Zero
(
	.const_value(Const_Zero)
);

	 assign Op = InstructionD [27:26];
	 assign Funct = InstructionD [25:20];
	 assign Rd = InstructionD [15:12];
	 assign Cond = InstructionD [31:28];
	 assign Src2 = InstructionD [11:0];
	 assign PC_Out = PCF;
	 
	 assign RA1E_Out = RA1E;
	 assign RA2E_Out = RA2E;
	 assign WA3M_Out = WA3M;
	 assign WA3W_Out = WA3W;
	 assign WA3E_Out = WA3E;
	 assign RA1D_Out = RA1D;
	 assign RA2D_Out = RA2D;

endmodule
