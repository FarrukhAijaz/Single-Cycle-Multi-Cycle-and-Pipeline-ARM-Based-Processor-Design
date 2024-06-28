module Controller(
	 output PCWrite,
	 output reg AdrSrc,
	 output MemWrite,
	 output reg IRWrite,
	 output reg [1:0] ResultSrc,
	 output reg [3:0] ALUControl,
	 output reg [1:0] ALUSrcB,
	 output reg ALUSrcA,
	 output reg [1:0] ImmSrc,
	 output RegWrite,
	 output reg [1:0] RegSrc,
	 output reg BL_ctrl,

	 input[3:0] ALUFlags ,
	 input [3:0] Cond,
	 input [1:0] Op,
	 input [5:0] Funct,
	 input [3:0] Rd,
	 input clk,
	 input RESET
);
wire [3:0] Flags; 
wire [1:0] FlagWrite;
reg [1:0] FlagW;
wire CondEx_Out;
reg CondEx;
reg ALUOp;
reg NextPC;
reg Branch;
reg RegW;
reg MemW;
reg PCS;


Register_rsten  #(2) Flag_reg32

(
		.clk(clk), 
		.reset(Const_Zero),
		.we(FlagWrite[1]),
		.DATA(ALUFlags [3:2]),
		.OUT(Flags [3:2])
);

Register_rsten  #(2) Flag_reg10

(
		.clk(clk),
		.reset(Const_Zero),
		.we(FlagWrite[0]),	
		.DATA(ALUFlags [1:0]),
		.OUT(Flags [1:0])
);

Register_simple #(1) CondEx_Reg
(
		.clk(clk),	
		.DATA(CondEx),
		.OUT(CondEx_Out)
);


Constant4 #(1,0)My_Constant_Zero
(
	.const_value(Const_Zero)
);

parameter FETCH = 4'b0000;
parameter DECODE = 4'b0001;
parameter MEMADR = 4'b0010;
parameter MEMREAD = 4'b0011;
parameter MEMWB = 4'b0100;
parameter MEMWRITE = 4'b0101;
parameter EXECUTER = 4'b0110;
parameter EXECUTEI = 4'b0111;
parameter ALUWB = 4'b1000;
parameter BRANCH = 4'b1001;


// State register
reg [3:0] state, next_state;

// FSM initialization
initial begin
    state = FETCH; // Start state
end

// State transition logic
always @(posedge clk) begin
    if (RESET) begin
        state <= FETCH;
    end else begin
        state <= next_state;
    end
end

always @(*) begin
		
				// Logic for Main FSM
			// Default values
					Branch = 0;
					RegW = 0;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b00;
					ALUSrcA = 0;
					ALUSrcB = 2'b00;
					ALUOp = 0;
							 

    // Define the behavior for each state
    case (state)
        FETCH: begin
            // Fetch logic
					Branch = 0;
					RegW = 0;
					MemW = 0;
					IRWrite = 1;
					NextPC = 1;
					AdrSrc = 0;
					ResultSrc = 2'b10;
					ALUSrcA = 1;
					ALUSrcB = 2'b10;
					ALUOp = 0;
					BL_ctrl=0;
							 

            next_state = DECODE;
        end
        DECODE: begin
            // Decode logic
					Branch = 0;
					RegW = 0;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b10;
					ALUSrcA = 1;
					ALUSrcB = 2'b10;
					ALUOp = 0;
					BL_ctrl=0;
							 
            case (Op)
                2'b00: begin 
									case(Funct[5])
											1'b1: begin
														next_state = EXECUTEI;
													end
											1'b0: begin
														next_state = EXECUTER;
													end
											default: next_state = FETCH;
									endcase
							  end
					2'b01: begin 
									next_state = MEMADR;
							 end
					2'b10: begin 
									next_state = BRANCH;
							 end
                default: next_state = FETCH;
            endcase
        end
        MEMADR: begin
            // Memory Address Computation
					Branch = 0;
					RegW = 0;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b00;
					ALUSrcA = 0;
					ALUSrcB = 2'b01;
					ALUOp = 0;
					BL_ctrl=0;
					
									case(Funct[0])
											1'b1: begin
														next_state = MEMREAD;
													end
											1'b0: begin
														next_state = MEMWRITE;
													end
											default: next_state = FETCH;
									endcase
        end
        MEMREAD: begin
            // Memory Read operation
					Branch = 0;
					RegW = 0;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 1;
					ResultSrc = 2'b00;
					ALUSrcA = 0;
					ALUSrcB = 2'b00;
					ALUOp = 0;
					BL_ctrl=0;
					
					next_state = MEMWB;
        end
        MEMWB: begin
            // Memory Write-Back
					Branch = 0;
					RegW = 1;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b01;
					ALUSrcA = 0;
					ALUSrcB = 2'b00;
					ALUOp = 0;
					BL_ctrl=0;
            next_state = FETCH;
        end
        MEMWRITE: begin
            // Memory Write operation
					Branch = 0;
					RegW = 0;
					MemW = 1;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 1;
					ResultSrc = 2'b00;
					ALUSrcA = 0;
					ALUSrcB = 2'b00;
					ALUOp = 0;
					BL_ctrl=0;
            next_state = FETCH;
        end
        EXECUTER: begin
            // Execute Register operation
					Branch = 0;
					RegW = 0;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b00;
					ALUSrcA = 0;
					ALUSrcB = 2'b00;
					ALUOp = 1;
					BL_ctrl=0;
            next_state = ALUWB;
        end
        EXECUTEI: begin
            // Execute Immediate operation
					Branch = 0;
					RegW = 0;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b00;
					ALUSrcA = 0;
					ALUSrcB = 2'b01;
					ALUOp = 1;
					BL_ctrl=0;
            next_state = ALUWB;
        end
        ALUWB: begin
            // ALU Write-Back
					Branch = 0;
					RegW = 1;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b00;
					ALUSrcA = 0;
					ALUSrcB = 2'b00;
					ALUOp = 0;
					BL_ctrl=0;
            next_state = FETCH;
        end
        BRANCH: begin
            // Branch operation
					Branch = 1;
					RegW = 0;
					MemW = 0;
					IRWrite = 0;
					NextPC = 0;
					AdrSrc = 0;
					ResultSrc = 2'b10;
					ALUSrcA = 0;
					ALUSrcB = 2'b01;
					ALUOp = 0;
					BL_ctrl=0;
            next_state = FETCH;
        end
        default: begin
            next_state = FETCH;
        end
    endcase				
				
				
				// Logic for Condition Check
				case (Cond)
								4'b0000: begin // Equal Condition Check
											CondEx = Flags[2];
											end 
											
								4'b0001: begin
											CondEx = !Flags[2]; //Not Equal Condition Check
											end
								4'b1110: begin //Always Condition Check
											CondEx = 1'b1;
											end
								default: begin
											CondEx = 1'b0;
											end 
				endcase
				
		//Logic for Instruction Decoder
		
		ImmSrc = Op;
		if(Op==2'b10)
			RegSrc [0]= 1'b1;
		else if (Op==2'b01)
			RegSrc [1]= 1'b1;
		else 
			RegSrc = 2'b00;

		
		//ALU Decode Logic
			case (Funct[4:0])
			
				5'b01000: begin //Addition
								FlagW = 2'b00;
								ALUControl = 4'b0100;
							 end
							 
				5'b01001: begin //Addition with Flags
								FlagW = 2'b11;
								ALUControl = 4'b0100;
							 end
							 
				5'b00100: begin //Subtraction
								FlagW = 2'b00;
								ALUControl = 4'b0010;
							 end
							
				5'b00101: begin //Subtraction with Flags
								FlagW = 2'b11;
								ALUControl = 4'b0010;
							 end
				
				5'b00000: begin //AND
								FlagW = 2'b00;
								ALUControl = 4'b0000;
							 end
							 
				5'b00001: begin //AND with Flags
								FlagW = 2'b10;
								ALUControl = 4'b0000;
							 end

				5'b11000: begin //ORR
								FlagW = 2'b00;
								ALUControl = 4'b1100;
							 end
							
				5'b11001: begin //ORR with Flags
								FlagW = 2'b10;
								ALUControl = 4'b1100;
							 end
							 
				5'b11010: begin //MOVE 
								FlagW = 2'b00;
								ALUControl = 4'b1101;
							 end
							 
				5'b11011: begin //MOVE with Flags 
								FlagW = 2'b10;
								ALUControl = 4'b1101;
							 end
							 
				5'b10100: begin //CMP
								FlagW = 2'b00;
								ALUControl = 4'b0010;
							 end
							 
				5'b10101: begin //CMP with Flags
								FlagW = 2'b11;
								ALUControl = 4'b0010;
							 end 
							 
				default:	begin
								FlagW = 2'b11;
								ALUControl = 4'b0010;
							 end
				endcase
		// PCS logic
		if (((Rd == 4'b1111) && RegW) || Branch) // 4'b1111 is binary representation of 15
			  PCS = 1'b1;
		else
			  PCS = 1'b0;
	end
	
	assign FlagWrite[1]= FlagW[1] && CondEx;
	assign FlagWrite[0]= FlagW[0] && CondEx;
	assign PCWrite = NextPC || (PCS && CondEx_Out);
	assign RegWrite = (RegW && CondEx_Out);
	assign MemWrite = (MemW && CondEx_Out);
	
endmodule
