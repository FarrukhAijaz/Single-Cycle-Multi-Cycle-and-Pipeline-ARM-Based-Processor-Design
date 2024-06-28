module Single_Cycle_Computer(
    input clk,
    input reset,
    input [3:0] debug_reg_select,
    output [31:0] debug_reg_out,
    output [31:0] fetchPC
);

// Signals for connecting to DataPath and Controller
wire [9:0] SW; // Assuming SW is 10 bits wide, adjust if needed
wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
wire [9:0] LEDR;
wire [31:0] reg_out;
wire [31:0] PC;

// Instantiate DataPath module
DataPath datapath (
    .clk(clk),
    .PCSrc(PCSrc),
    .BX_ctrl(BX_ctrl),
    .RegSrc(RegSrc),
    .BL_ctrl(BL_ctrl),
    .Move_ctrl(Move_ctrl),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUControl(ALUControl),
    .ImmSrc(ImmSrc),
    .RegWrite(RegWrite),
    .RESET(reset),
    .Cond(Cond),
    .Op(Op),
    .Funct(Funct),
    .Rd(Rd),
    .Switches(SW),
    .HEX_Debug(debug_reg_out)
);

// Instantiate Controller module
Controller controller (
    .clk(clk),
    .RESET(reset),
    .Instr(Instr),
    .ALUFlags(ALUFlags),
    .PCSrc(PCSrc),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUControl(ALUControl),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .RegWrite(RegWrite),
    .RegSrc(RegSrc),
    .FlagW(FlagW),
    .BX_ctrl(BX_ctrl)
);

// Connect debug register select and fetch PC
assign fetchPC = PC;

endmodule
