// This file implements a control unit that is to be used in the controller of a pipelined
// cpu. However, it can be used with a single-cycle controller given that the appropriate
// Conditionan Logic Unit is used.

module Control_unit(
	input [1:0] Op,
	input [5:0] Funct,
	input [3:0] Rd,
	input [11:0] Src2,
	
	output reg PCSrc, RegWrite, MemWrite, ALUSrc, MemtoReg,
	output reg [3:0] ALUControl,
	output reg [1:0] FlagWrite, ImmSrc,
	output reg [2:0] RegSrc,
	
	output reg [1:0] ShiftControl,
	output reg [4:0] shamt
);

// Main Decoder
always @(*) case (Op)
	2'b00: begin
		if (Funct == 6'b010010 && Rd == 4'b1111) begin
			// Bx Operation
			PCSrc	   = 1'b1;
			RegWrite   = 1'b0;
			MemWrite   = 1'b0;
			ALUSrc     = 1'b0;
			ALUControl = 4'b1101;
			FlagWrite  = 2'b00;
			RegSrc     = 3'b000;
			ImmSrc     = 2'b00;
			MemtoReg  = 1'b0;
			ShiftControl = 2'b00;
			shamt        = 5'b00000;
		end
		else begin
			// Data-Processing Operations
			RegWrite   = (Funct[4:3] != 2'b10); // Excluding Test operations
			MemWrite   = 1'b0;
			ALUSrc     = Funct[5]; // Immediate
			PCSrc	   = (&Rd) & RegWrite;
			
			if (RegWrite) // Reuse the already checked value
				// Ordinary Operations, ALU is designed specifically for this
				ALUControl = Funct[4:1];
			else if (Funct[2:1] == 2'b11)
				// CMN has different mapping
				ALUControl = 4'b0100;
			else
				// Remaining test operations
				ALUControl = {1'b0, Funct[3:1]};
				
			if (Funct[0] == 1'b1)
				// FlagWrite is 2'b01 for (AND, EOR), (TST, TEQ), (ORR, MOV, BIC, MVN)
				FlagWrite = (Funct[4:2] == 3'b000 || Funct[4:2] == 3'b100 || Funct[4:3] == 2'b11) ? 2'b01 : 2'b11;
			else
				FlagWrite = 2'b00;
				
			RegSrc     = 3'b000;
			ImmSrc     = 2'b00;
			MemtoReg  = 1'b0;
			
			if (Funct[5]) begin
				ShiftControl = 2'b11;
				shamt = {Src2[11:8], 1'b0};
			end else begin
				ShiftControl = Src2[6:5];
				shamt = Src2[11:7];
			end
		end
	end
	2'b01: begin
		// Memory Operations
		PCSrc	   = 1'b0;
		RegWrite   = Funct[0]; // L
		MemWrite   = ~Funct[0]; // ~L
		ALUSrc     = ~Funct[5]; // ~I
		ALUControl = Funct[3] ? 4'b0100 : 4'b0010; // U ? Addition : Subtraction
		FlagWrite  = 2'b00;
		RegSrc     = 3'b010; // For STR
		ImmSrc     = 2'b01; // 12-bit
		MemtoReg  = Funct[0]; // L
		ShiftControl = 2'b00;
		shamt        = 5'b00000;
	end
	2'b10: begin
		// Branch Operations
		PCSrc	   = 1'b1;
		RegWrite   = Funct[4]; // L
		MemWrite   = 1'b0;
		ALUSrc     = 1'b1;
		ALUControl = 4'b0100;
		FlagWrite  = 2'b00;
		RegSrc     = {Funct[4], 2'b01};
		ImmSrc     = 2'b10;
		MemtoReg  =  1'b0;
		ShiftControl = 2'b00;
		shamt        = 5'b00000;
	end
	2'b11: begin
		// Unreachable, default case
		PCSrc	   = 1'b0;
		RegWrite   = 1'b0;
		MemWrite   = 1'b0;
		ALUSrc     = 1'b0;
		ALUControl = 4'b0000;
		FlagWrite  = 2'b00;
		RegSrc     = 3'b000;
		ImmSrc     = 2'b00;
		MemtoReg  = 1'b0;
		ShiftControl = 2'b00;
		shamt        = 5'b00000;
	end
endcase

endmodule
