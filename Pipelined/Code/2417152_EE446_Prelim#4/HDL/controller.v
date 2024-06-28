module controller(
	input clk,
	input reset,
	input [1:0] Op,
	input [5:0] Funct,
	input [3:0] Rd,
	input [11:0] Src2,
	input [3:0] Cond,
	input CO, OVF, N, Z,
	
	output [1:0] ImmSrcD, ShiftControlE,
	output [2:0] RegSrcD,
	output [3:0] ALUControlE,
	output [4:0] shamtE,
	output PCSrcW, ALUSrcE, CarryIN, RegWriteW, MemWriteM, MemtoRegW, BL_ctrl, BranchTakenE, RegWriteM, MemtoRegE, PCSrc_raw, PCSrcE, PCSrcM
);

// Decode Stage ********************
wire Branch_raw, RegWrite_raw, MemWrite_raw, MemtoReg_raw, ALUSrc_raw;
wire [3:0] ALUControl_raw;
wire [1:0] FlagWrite_raw, ShiftControl_raw;
wire [4:0] shamt_raw; 

Control_unit control_unit_sc
(
	.Op(Op),
	.Funct(Funct),
	.Rd(Rd),
	.Src2(Src2),
	.PCSrc(PCSrc_raw),
	.RegWrite(RegWrite_raw),
	.MemWrite(MemWrite_raw),
	.ALUSrc(ALUSrc_raw),
	.MemtoReg(MemtoReg_raw),
	.ALUControl(ALUControl_raw),
	.FlagWrite(FlagWrite_raw),
	.RegSrc(RegSrcD),
	.ImmSrc(ImmSrcD),
	.ShiftControl(ShiftControl_raw),
	.shamt(shamt_raw),
	.Branch(Branch_raw),
	.BL_ctrl(BL_ctrl)
);
// Register for Execute Pipeline Stage

Register_reset #(1) PCSrcDE(.clk(clk), .reset(reset),.DATA(PCSrc_raw),.OUT(PCSrcE));
Register_reset #(1) BranchDE(.clk(clk), .reset(reset),.DATA(Branch_raw),.OUT(BranchE));
Register_reset #(1) RegWriteDE(.clk(clk), .reset(reset),.DATA(RegWrite_raw),.OUT(RegWriteE));
Register_reset #(1) MemWriteDE(.clk(clk), .reset(reset),.DATA(MemWrite_raw),.OUT(MemWriteE));
Register_reset #(1) MemtoRegDE(.clk(clk), .reset(reset),.DATA(MemtoReg_raw),.OUT(MemtoRegE));
Register_reset #(4) ALUControlDE(.clk(clk), .reset(reset),.DATA(ALUControl_raw),.OUT(ALUControlE));
Register_reset #(1) ALUSrcDE(.clk(clk), .reset(reset),.DATA(ALUSrc_raw),.OUT(ALUSrcE));
Register_reset #(2) FlagWriteDE(.clk(clk), .reset(reset),.DATA(FlagWrite_raw),.OUT(FlagWriteE));
Register_reset #(2) ShiftControlDE(.clk(clk), .reset(reset),.DATA(ShiftControl_raw),.OUT(ShiftControlE));
Register_reset #(5) shamtDE(.clk(clk), .reset(reset),.DATA(shamt_raw),.OUT(shamtE));
Register_reset #(4) CondDE(.clk(clk), .reset(reset),.DATA(Cond),.OUT(CondE));


Conditional_unit conditional_unit_sc
(
	.clk(clk),
	.Cond(Cond),
	.ALUFlags({CO,OVF,N,Z}),
	.FlagWrite(FlagWriteE),
	.CarryIn(CarryIN),
	.CondEx(CondEx)
);

assign BranchTakenE = BranchE & CondEx;

//  Register for Memory Pipeline Stage

Register_reset #(1) PCSrcEM(.clk(clk), .reset(reset),.DATA(PCSrcE & CondEx),.OUT(PCSrcM));
Register_reset #(1) RegWriteEM(.clk(clk), .reset(reset),.DATA(RegWriteE & CondEx),.OUT(RegWriteM));
Register_reset #(1) MemWriteEM(.clk(clk), .reset(reset),.DATA(MemWriteE & CondEx),.OUT(MemWriteM));
Register_reset #(1) MemtoRegEM(.clk(clk), .reset(reset),.DATA(MemtoRegE),.OUT(MemtoRegM));

//  Register for Write Back Pipeline Stage

Register_reset #(1) PCSrcMWB(.clk(clk), .reset(reset),.DATA(PCSrcM),.OUT(PCSrcW));
Register_reset #(1) RegWriteMWB(.clk(clk), .reset(reset),.DATA(RegWriteM),.OUT(RegWriteW));
Register_reset #(1) MemtoRegMWB(.clk(clk), .reset(reset),.DATA(MemtoRegM),.OUT(MemtoRegW));

endmodule
