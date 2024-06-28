	// Datapath.v
module DataPath(
    input clk,
	 input reset, 
	 input PCWrite,
	 input AdrSrc,
	 input MemWrite,
	 input IRWrite,
	 input [1:0] ResultSrc,
	 input [3:0] ALUControl,
	 input [1:0] ALUSrcB,
	 input ALUSrcA,
	 input [1:0] ImmSrc,
	 input RegWrite,
	 input [1:0] RegSrc,
	 input BL_ctrl,

	 output[3:0] ALUFlags ,
	 output [3:0] Cond,
	 output [1:0] Op,
	 output [5:0] Funct,
	 output [3:0] Rd,
	 
	 //for debugging
	 input [3:0] Switches,
	 output [31:0] HEX_Debug,
	 output [31:0] PC_Out
	 
);


wire [31:0] Instr;
wire [31:0] Result;
wire [31:0] PC_prime;
wire [31:0] PC1;
wire [31:0] WriteData;
wire [31:0] Adr;
wire [3:0] RA1;
wire [3:0] RA2;
wire [3:0] A3;
wire [31:0] WD3;
wire [31:0] RD1;
wire [31:0] RD2;
wire [31:0] shift_input;
wire [31:0] shift_output;
wire [31:0] ExtImm;
wire [31:0] SrcA;
wire [31:0] SrcB;
wire [31:0] ReadData;
wire [31:0] ALUResult;
wire [31:0] Const_Four;
wire [3:0] Const_Fifteen;
wire [3:0] Const_Forteen;
wire Const_Zero;
wire Const_One;
wire [31:0] A;
wire [31:0] ALUOut;




Mux_2to1 #(32) MUX0 
	(
        .input_0(PC1),
        .input_1(Result),
        .select(AdrSrc),
        .output_value(Adr)
    );
//done
Mux_2to1 #(4) MUX1 
	(
        .input_0(Instr [19:16]),
        .input_1(Const_Fifteen),
        .select(RegSrc[0]),
        .output_value(RA1)
    );
//done
Mux_2to1 #(4) MUX2 
	(
        .input_0(Instr [3:0]),
        .input_1(Instr [15:12]),
        .select(RegSrc[1]),
        .output_value(RA2)
    );
//done
Mux_2to1 #(4) MUX3 
	(
        .input_0(Instr [15:12]),
        .input_1(Const_Forteen),
        .select(BL_ctrl),
        .output_value(A3)
    );
//done
Mux_2to1 #(32) MUX4
	(
        .input_0(Result),
        .input_1(PC1),
        .select(BL_ctrl),
        .output_value(WD3)
    );
//done
Mux_2to1 #(32) MUX5 
	(
        .input_0(A),
        .input_1(PC1),
        .select(ALUSrcA),
        .output_value(SrcA)
    );
//done
Mux_4to1 #(32) MUX6 
	(
        .input_0(WriteData),
        .input_1(ExtImm),
		  .input_2(Const_Four),
		  .input_3(Const_Zero),
        .select(ALUSrcB),
        .output_value(shift_input)
    );
//done
Mux_4to1 #(32) MUX7 
	(
        .input_0(ALUOut),
        .input_1(Data),
		  .input_2(ALUResult),
		  .input_3(Const_Zero),
        .select(ResultSrc),
        .output_value(Result)
    );
//done
	 
Register_rsten  #(32) Program_Counter 

(
		.clk(clk), 
		.reset(RESET),
		.we(PCWrite),
		.DATA(PC_prime),
		.OUT(PC1)
);

Register_rsten  #(32) Instr_Reg 

(
		.clk(clk), 
		.reset(RESET),
		.we(IRWrite),
		.DATA(ReadData),
		.OUT(Instr)
);

Register_simple  #(32) Data_Reg 

(
		.clk(clk), 
		.DATA(ReadData),
		.OUT(Data)
);

Register_simple  #(32) ALU_Reg 

(
		.clk(clk), 
		.DATA(ALUResult),
		.OUT(ALUOut)
);
Register_simple  #(32) RD1_Reg 

(
		.clk(clk), 
		.DATA(RD1),
		.OUT(A)
);
Register_simple  #(32) RD2_Reg 

(
		.clk(clk), 
		.DATA(RD2),
		.OUT(WriteData)
);

ALU #(32) My_ALU 
	(
		.control(ALUControl),
		.CI(Const_Zero),
		.DATA_A(SrcA),
		.DATA_B(SrcB),
		.OUT(ALUResult),
		.CO(ALUFlags [3]),
		.OVF(ALUFlags [2]),
		.N(ALUFlags [1]), 
		.Z(ALUFlags [0])
	);

shifter #(32) My_Shifter 
		(
			.control(Instr [6:5]),
			.shamt(Instr [11:7]),
			.DATA(shift_input),
			.OUT(shift_output)
		);
Extender My_Extender 
		(
			.Extended_data(ExtImm),
			.DATA(Instr [23:0]),
			.select(ImmSrc)
		);
//done
Register_file  #(32) reg_file_dp 

(
		.clk(clk), 
		.write_enable(RegWrite), 
		.reset(Const_Zero),
		.Source_select_0(RA1), 
		.Source_select_1(RA2), 
		.Debug_Source_select(Switches), 
		.Destination_select(A3),
		.DATA(WD3), 
		.Reg_15(Result + 4),
		.out_0(RD1), 
		.out_1(RD2), 
		.Debug_out(HEX_Debug)
);

ID_memory  #(4,32) IDM 
(
	.clk(clk),
	.WE(MemWrite),
	.ADDR(Adr),
	.WD(WriteData),
	.RD(ReadData)
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

assign Cond = Instr [31:28];
assign Op = Instr [27:26];
assign Funct = Instr [25:20];
assign Rd = Instr [15:12];
assign PC_prime = Result;
assign SrcB = shift_output;
assign PC_Out = PC1;
endmodule
