module Pipeline_Test
(
	input clk,
	input reset,
	input [3:0] Switches,
	
	output Cin,
	output [31:0] HEX_Debug,
	output [31:0] fetchPC
);


wire [3:0] ALUFlags_wire;
wire [1:0] shift_wire;
wire [4:0] shamt_wire;
wire [3:0] RA1D_wire;
wire [3:0] RA1E_wire;
wire [3:0] RA2D_wire;
wire [3:0] RA2E_wire;
wire [3:0] WA3E_wire;
wire [3:0] WA3M_wire;
wire [3:0] WA3W_wire;
Datapath My_DP
(
	 .clk(clk),
	 .reset(reset), 
	 .PCSrcW(PCSrcW),
	 .BranchTakenE(BranchTakenE),
	 .RegSrcD(RegSrcD),
	 .ALUSrcE(ALUSrcE),
	 .BL_ctrl(BL_ctrl),
	 .shamt(shamt_wire),
	 .shifter_ctrl(shift_wire),
	 .MemWriteM(MemWriteM),
	 .MemtoRegW(MemtoRegW),
	 .ImmSrcD(ImmSrcD),
	 .RegWriteW(RegWriteW),
	 
	 .StallF(StallF),
	 .StallD(StallD),
	 .FlushD(FlushD),
	 .FlushE(FlushE),
	 .ForwardAE(ForwardAE),
	 .ForwardBE(ForwardBE),
	 .ALUControlE(ALUControlE),
	 
	 .Op(Op),
	 .Funct(Funct),
	 .Rd(Rd),
	 .Cond(Cond),
	 .Src2(Src2),
	 .ALUFlags(ALUFlags_wire),
	 .RA1E_Out(RA1E_wire),
	 .RA2E_Out(RA2E_wire),
	 .WA3M_Out(WA3M_wire),
	 .WA3W_Out(WA3W_wire),
	 .WA3E_Out(WA3E_wire),
	 .RA1D_Out(RA1D_wire),
	 .RA2D_Out(RA2D_wire),
	 
	 //for debugging
	 .Switches(Switches),
	 .HEX_Debug(HEX_Debug),
	 .PC_Out(fetchPC)
);

controller My_Cntroller
(
	.clk(clk),
	.reset(reset),
	.Op(Op),
	.Funct(Funct),
	.Rd(Rd),
	.Src2(Src2),
	.Cond(Cond),
	.CO(ALUFlags_wire[1]), 
	.OVF(ALUFlags_wire[0]), 
	.N(ALUFlags_wire[3]), 
	.Z(ALUFlags_wire[2]),
	.ImmSrcD(ImmSrcD), 
	.ShiftControlE(shift_wire),
	.RegSrcD(RegSrcD),
	.ALUControlE(ALUControlE),
	.shamtE(shamt_wire),
	.PCSrcW(PCSrcW), 
	.ALUSrcE(ALUSrcE),
	.CarryIN(Cin), 
	.RegWriteW(RegWriteW), 
	.MemWriteM(MemWriteM), 
	.MemtoRegW(MemtoRegW), 
	.BL_ctrl(BL_ctrl), 
	.BranchTakenE(BranchTakenE), 
	.RegWriteM(RegWriteM), 
	.MemtoRegE(MemtoRegE), 
	.PCSrc_raw(PCSrc_raw), 
	.PCSrcE(PCSrcE), 
	.PCSrcM(PCSrcM)

);
Hazard My_HazardUnit
(
//Datapath .s
	 .RA1E(RA1E_wire),
	 .RA2E(RA2E_wire),
	 .WA3M(WA3M_wire),
	 .WA3W(WA3W_wire),
	 .RA1D(RA1D_wire),
	 .RA2D(RA2D_wire),
	 .WA3E(WA3E_wire),
	 
	 //Controller .s
	 .MemtoRegE(MemtoRegE),
	 .RegWriteW(RegWriteW),
	 .RegWriteM(RegWriteM),
	 .PCSrc_raw(PCSrc_raw), 
	 .PCSrcE(PCSrcE), 
	 .PCSrcM(PCSrcM),
	 .PCSrcW(PCSrcW),
	 .BranchTakenE(BranchTakenE),
	 
	 
	 //Hazard Outputs
	 .StallF(StallF), 
	 .StallD(StallD), 
	 .FlushD(FlushD), 
	 .FlushE(FlushE),
	 .ForwardAE(ForwardAE),
	 .ForwardBE(ForwardBE)

);

endmodule