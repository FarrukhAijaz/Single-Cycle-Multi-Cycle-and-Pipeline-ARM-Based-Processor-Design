module Multi_Cycle_Computer(
    input clk,
    input reset,
    output [31:0] PC
);

wire PCWrite_wire;
wire ADRSrc_to_Mux;
wire MemWrite_wire;
wire IRWrite_wire;
wire [1:0] ResultSrc_wire;
wire [3:0] ALUControl_wire;
wire ALUSrcA_wire;
wire [1:0] ALUSrcB_wire;
wire [1:0] ImmSrc_wire;
wire RegWrite_wire;
wire [1:0] RegSrc_wire;
wire [3:0] ALUFlags_wire;
wire [3:0] Cond_wire;
wire [1:0] Op_wire;
wire [5:0] Funct_wire;
wire [3:0] Rd_wire;
wire BL_ctrl_wire;


 Controller My_Controller(
		.PCWrite(PCWrite_wire),
	   .AdrSrc(ADRSrc_to_Mux),
	   .MemWrite(MemWrite_wire),
	   .IRWrite(IRWrite_wire),
	   .ResultSrc(ResultSrc_wire),
	   .ALUControl(ALUControl_wire),
	   .ALUSrcB(ALUSrcB_wire),
	   .ALUSrcA(ALUSrcA_wire),
	   .ImmSrc(ImmSrc_wire),
	   .RegWrite(RegWrite_wire),
	   .RegSrc(RegSrc_wire),
	   .BL_ctrl(BL_ctrl_wire),
		.ALUFlags(ALUFlags_wire),
		.Cond(Cond_wire),
		.Op(Op_wire),
		.Funct(Funct_wire),
		.Rd(Rd_wire),
		.clk(clk),
		.RESET(reset)
    );

 DataPath My_DataPath (
       .clk(clk),
		 .reset(reset), 
		 .PCWrite(PCWrite_wire),
		 .AdrSrc(ADRSrc_to_Mux),
		 .MemWrite(MemWrite_wire),
		 .IRWrite(IRWrite_wire),
		 .ResultSrc(ResultSrc_wire),
		 .ALUControl(ALUControl_wire),
		 .ALUSrcB(ALUSrcB_wire),
		 .ALUSrcA(ALUSrcA_wire),
		 .ImmSrc(ImmSrc_wire),
		 .RegWrite(RegWrite_wire),
		 .RegSrc(RegSrc_wire),
		 .BL_ctrl(BL_ctrl_wire),

		 .ALUFlags(ALUFlags_wire),
		 .Cond(Cond_wire),
		 .Op(Op_wire),
		 .Funct(Funct_wire),
		 .Rd(Rd_wire),
		 
		 //for debugging
		 .Switches(),
		 .HEX_Debug(),
		 .PC_Out(PC)
);
endmodule