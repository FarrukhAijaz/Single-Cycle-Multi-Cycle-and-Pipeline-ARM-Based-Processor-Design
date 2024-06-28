module Conditional_unit(
	input clk, reset,
	input [3:0] Cond, ALUFlags,
	input [1:0] FlagWrite,
	
	output CarryIn,
	output CondEx
);

wire C,V,N,Z;

assign CarryIn = C;

// CPSR Registers
Register_rsten #(2) CO_OVF_reg (.clk(clk),.reset(reset),.we(FlagWrite[1]),.DATA(ALUFlags[3:2]),.OUT({C,V}));
Register_rsten #(2) N_Z_reg (.clk(clk),.reset(reset),.we(FlagWrite[0]),.DATA(ALUFlags[1:0]),.OUT({N,Z}));

// CondEx Logic
Mux_16to1 #(1) CondEx_mux(.select(Cond),.output_value(CondEx),
	.input_0(Z),.input_1(~Z),.input_2(C),.input_3(~C),
	.input_4(N),.input_5(~N),.input_6(V),.input_7(~V),
	.input_8(C & ~Z),.input_9(~C | Z),.input_10(N ~^ V),.input_11(N ^ V),
	.input_12(~Z & (N ~^ V)),.input_13(Z | (N ^ V)),.input_14(1'b1),.input_15(1'b0)
);

endmodule
