module Hazard
(
 //Datapath Inputs
 input [3:0] RA1E,
 input [3:0] RA2E,
 input [3:0] WA3M,
 input [3:0] WA3W,
 input [3:0] RA1D,
 input [3:0] RA2D,
 input [3:0] WA3E,
 
 //Controller Inputs
 input MemtoRegE,
 input RegWriteW,
 input RegWriteM,
 input PCSrc_raw, 
 input PCSrcE, 
 input PCSrcM,
 input PCSrcW,
 input BranchTakenE,
 
 
 //Hazard Outputs
 output reg StallF, 
 output reg StallD, 
 output reg FlushD, 
 output reg FlushE,
 output reg [1:0] ForwardAE,
 output reg [1:0] ForwardBE
);

reg LDRstall, PCWrPendingF;

always @(*) begin
  // Default values
  StallF = 0;
  StallD = 0;
  FlushD = 0;
  FlushE = 0;
  ForwardAE = 2'b00;
  ForwardBE = 2'b00;

  if ((RA1E == WA3M) && RegWriteM)
      ForwardAE = 2'b10; // SrcAE = ALUOutM
  else if ((RA1E == WA3W) && RegWriteW)
      ForwardAE = 2'b01; // SrcAE = ResultW
  else
      ForwardAE = 2'b00; // SrcAE from regfile
		  
  if ((RA2E == WA3M) && RegWriteM)
      ForwardBE = 2'b10; // SrcBE = ALUOutM
  else if ((RA2E == WA3W) && RegWriteW)
      ForwardBE = 2'b01; // SrcBE = ResultW
  else
      ForwardBE = 2'b00; // SrcBE from regfile
		  
  LDRstall = (RA1D == WA3E || RA2D == WA3E) && MemtoRegE;
  PCWrPendingF = PCSrc_raw || PCSrcE || PCSrcM;
  StallF = LDRstall || PCWrPendingF;
  StallD = LDRstall;
  FlushD = PCWrPendingF || PCSrcW || BranchTakenE;
  FlushE = LDRstall || BranchTakenE;
end

endmodule
