// Datapath.v
module DataPath(
    input clk, 
	 input PCSrc,
	 input BX_ctrl,
	 input RegSrc,
	 input BL_ctrl,
	 input Move_ctrl,
	 input ALUSrc,
	 input MemtoReg,
	 input MemWrite,
	 input [3:0] ALUControl ,
	 output[3:0] ALUFlags ,
	 input [1:0] ImmSrc ,
	 input RegWrite,
	 input RESET,
	 
	 output [3:0] Cond,
	 output [1:0] Op,
	 output [5:0] Funct,
	 output [3:0] Rd,
	 
	 input [3:0] Switches,
	 output [31:0] HEX_Debug
	 
);


wire [31:0] Instr;
wire [31:0] PCPlus4; 
wire [31:0] Result;
wire [31:0] PC_prime;
wire [31:0] PC_next;
wire [31:0] WriteData;
wire [31:0] mux1_out;
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
wire [31:0] PCPlus8;
wire [31:0] Const_Four;
wire [3:0] Const_Fifteen;
wire [3:0] Const_Forteen;
wire Const_Zero;
wire Const_One;








Mux_2to1 #(32) MUX1 
	(
        .input_0(PCPlus4),
        .input_1(Result),
        .select(PCSrc),
        .output_value(mux1_out)
    );
Mux_2to1 #(32) MUX2 
	(
        .input_0(mux1_out),
        .input_1(WriteData),
        .select(BX_ctrl),
        .output_value(PC_prime)
    );
Mux_2to1 #(4) MUX3 
	(
        .input_0(Instr [19:16]),
        .input_1(Const_Fifteen),
        .select(RegSrc),
        .output_value(RA1)
    );
Mux_2to1 #(4) MUX4
	(
        .input_0(Instr [3:0]),
        .input_1(Instr [15:12]),
        .select(RegSrc),
        .output_value(RA2)
    );
Mux_2to1 #(4) MUX5 
	(
        .input_0(Instr [15:12]),
        .input_1(Const_Forteen),
        .select(BL_ctrl),
        .output_value(A3)
    );
Mux_2to1 #(32) MUX6 
	(
        .input_0(Result),
        .input_1(PCPlus4),
        .select(BL_ctrl),
        .output_value(WD3)
    );
Mux_2to1 #(32) MUX7 
	(
        .input_0(RD2),
        .input_1(Instr [7:0]),
        .select(Move_ctrl),
        .output_value(shift_input)
    );
Mux_2to1 #(32) MUX8 
	(
        .input_0(shift_output),
        .input_1(ExtImm),
        .select(ALUSrc),
        .output_value(SrcB)
    );
Mux_2to1 #(32) MUX9 
	(
        .input_0(ALUResult),
        .input_1(ReadData),
        .select(MemtoReg),
        .output_value(Result)
    );
Memory #(4,32) Data_Memory 
	(
			.clk(clk),
			.WE(MemWrite),
			.ADDR(ALUResult),
			.WD(WriteData),
			.RD(ReadData) 
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
Register_file  #(32) My_RegisterFile 

(
		.clk(clk), 
		.write_enable(RegWrite), 
		.reset(Const_Zero),
		.Source_select_0(RA1), 
		.Source_select_1(RA2), 
		.Debug_Source_select(Switches), 
		.Destination_select(A3),
		.DATA(WD3), 
		.Reg_15(PCPlus8),
		.out_0(RD1), 
		.out_1(RD2), 
		.Debug_out(HEX_Debug)
);

Adder  #(32) My_Adder1 
(
		.DATA_A(PC_next),
		.DATA_B(Const_Four),
		.OUT(PCPlus4)
);
Adder  #(32) My_Adder2 
(
		.DATA_A(Const_Four),
		.DATA_B(PCPlus4),
		.OUT(PCPlus8)
);

Inst_Memory  #(4,8) My_memory 
(
	.ADDR(PC_next),
	.RD(Instr)
);

Register_rsten  #(32) Program_Counter 

(
		.clk(clk), 
		.reset(RESET),
		.we(Const_One),
		.DATA(PC_prime),
		.OUT(PC_next)
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
Constant4 #(1,0)My_Constant_Zero
(
	.const_value(Const_Zero)
);
Constant4 #(1,1)My_Constant_One
(
	.const_value(Const_One)
);
assign Cond = Instr [31:28];
assign Op = Instr [27:26];
assign Funct = Instr [25:20];
assign Rd = Instr [15:12];
assign RD1 = SrcA;
assign RD2 = WriteData;

endmodule
