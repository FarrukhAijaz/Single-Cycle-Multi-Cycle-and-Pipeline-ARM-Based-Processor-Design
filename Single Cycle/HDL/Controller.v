module Controller(
    input clk,
    input RESET,
    input [31:0] Instr,
    input [3:0] ALUFlags,
    output reg PCSrc,
    output reg MemtoReg,
    output reg MemWrite,
    output reg [3:0] ALUControl,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg RegWrite,
    output reg [1:0] RegSrc,
    output reg [1:0] FlagW,
    output reg BX_ctrl
);

// State definitions
parameter S_IDLE = 2'd0;
parameter S_EXECUTE = 2'd1;
reg [1:0] state;

// Decode fields from the instruction
wire [3:0] Cond = Instr[31:28]; // Condition field
wire [1:0] Op = Instr[27:26]; // Opcode field
wire [1:0] ALUOp = Instr[25:24]; // ALUOp field for determining ALU behavior
wire [3:0] Funct = Instr[23:20]; // Funct field for ALU operation
wire [3:0] Rd = Instr[15:12]; // Destination register field
wire [11:0] imm12 = Instr[11:0]; // Immediate value for memory operations
wire [23:0] imm24 = Instr[23:0]; // Immediate value for branch operations
wire [3:0] Rm = Instr[3:0]; // Register operand for MOV and BX instructions

always @(posedge clk or negedge RESET) begin
    if (!RESET) begin
        state <= S_IDLE;
    end else begin
        case(state)
            S_IDLE: begin
                // Reset control signals for each new instruction
                PCSrc <= 0;
                MemtoReg <= 0;
                MemWrite <= 0;
                ALUControl <= 4'b0000;
                ALUSrc <= 0;
                ImmSrc <= 2'b00;
                RegWrite <= 0;
                RegSrc <= 2'b00;
                FlagW <= 2'b00;
                BX_ctrl <= 0;

                // Decode instruction and set control signals
                case(Op)
                    // Data Processing Instructions (assumed Op encoding)
                    2'b00: begin 
                        RegWrite <= 1; // Data processing instructions write to a register
                        ALUSrc <= 0; // By default, second operand comes from a register (Rm)
                        RegSrc <= 2'b00; // Result comes from the ALU
                        
                        // Define ALU operations based on Funct
                        case(Funct)
                            4'b0100: ALUControl <= 4'b0100; // ADD
                            4'b0010: ALUControl <= 4'b0110; // SUB
                            4'b0000: ALUControl <= 4'b0000; // AND
                            4'b1100: ALUControl <= 4'b1100; // ORR
                            4'b1101: ALUControl <= 4'b1101; // MOV (Rm only)
                            // More operations can be added as needed
                            default: ALUControl <= 4'b1000; // Undefined operation
                        endcase
                        FlagW <= {ALUOp[0], ALUOp[0]}; // Set FlagW if the S bit (ALUOp[0]) is set
                    end
                    // Load/Store Instructions (assumed Op encoding)
                    2'b01: begin 
                        MemtoReg <= ~Funct[0]; // LDR will set this to 1
                        MemWrite <= Funct[0];  // STR will set this to 1
                        ALUSrc <= 1'b1;        // Always use immediate for memory offset
                        ImmSrc <= 2'b10;       // Use 12-bit immediate for memory offset
                        RegWrite <= ~Funct[0]; // LDR will write to a register
                        RegSrc <= ~Funct[0] ? 2'b01 : 2'b00; // LDR will set RegSrc to 01
                    end
                    // Branch Instructions (assumed Op encoding)
                     // You will need to implement logic to handle the branch offset and link register
                    2'b10: begin 
                        PCSrc <= 1'b1; // Always update PC for branch instructions
                        // Encoding and behavior for Branch instructions (B, BL, BX) should be defined
                    end
                    default: begin
                        // BX instruction is identified by a specific pattern (assumed 0x012FFF1)
                        if (Instr[27:4] == 24'h012FFF1) begin 
                            BX_ctrl <= 1'b1;
                            PCSrc <= 1'b1;
                        end
                        // Handle other types of instructions or set default behavior
                    end
                endcase
                state <= S_EXECUTE;
            end
            S_EXECUTE: begin
                // Execute stage - No action needed for simple control
                state <= S_IDLE;
            end
        endcase
    end
end

endmodule
