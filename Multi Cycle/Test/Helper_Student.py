class Timing:
    # Define how many cycles each operation takes
    Data_Processing = 4
    Memory_Load = 5
    Memory_Store = 4
    Branch = 3


#Populate the below functions as in the example lines of code to print your values for debugging
def Log_Datapath(dut,logger):
    #Log whatever signal you want from the datapath, called before positive clock edge
    logger.debug("************ DUT DATAPATH Signals ***************")
    dut._log.info("reset:%s", hex(dut.My_DataPath.reset.value.integer))
    dut._log.info("ALUSrcA:%s", bin(dut.My_DataPath.ALUSrcA.value.integer))
    dut._log.info("ALUSrcB:%s", bin(dut.My_DataPath.ALUSrcB.value.integer))
    dut._log.info("MemWrite:%s", hex(dut.My_DataPath.MemWrite.value.integer))
    dut._log.info("ResultSrc:%s", hex(dut.My_DataPath.Result.value.integer))
    #dut._log.info("RegWrite:%s", hex(dut.My_DataPath.RegWrite.value.integer))
    #dut._log.info("Funct:%s", bin(dut.My_DataPath.Funct.value.integer))
    #dut._log.info("Op:%s", hex(dut.My_DataPath.Op.value.integer))
    #dut._log.info("Cond:%s", hex(dut.My_DataPath.Cond.value.integer))
    #dut._log.info("Instr:%s", bin(dut.My_DataPath.Instr.value.integer))
    #dut._log.info("PCSrc:%s", hex(dut.My_DataPath.PCSrc.value.integer))
    #dut._log.info("MemtoReg:%s", hex(dut.My_DataPath.MemtoReg.value.integer))
    #dut._log.info("RegSrc:%s", hex(dut.My_DataPath.RegSrc.value.integer))
    #dut._log.info("ImmSrc:%s", hex(dut.My_DataPath.ImmSrc.value.integer))
    #dut._log.info("ALUControl:%s", hex(dut.My_DataPath.ALUControl.value.integer))
    #dut._log.info("CO:%s", hex(dut.My_DataPath.CO.value.integer))
    #dut._log.info("OVF:%s", hex(dut.My_DataPath.OVF.value.integer))
    #dut._log.info("N:%s", hex(dut.My_DataPath.N.value.integer))
    #dut._log.info("Z:%s", hex(dut.My_DataPath.Z.value.integer))
    #dut._log.info("CarryIN:%s", hex(dut.My_DataPath.CarryIN.value.integer))
    #dut._log.info("ShiftControl:%s", hex(dut.My_DataPath.ShiftControl.value.integer))
    #dut._log.info("shamt:%s", hex(dut.My_DataPath.shamt.value.integer))
    #dut._log.info("PC:%s", hex(dut.My_DataPath.PC.value.integer))
    #dut._log.info("Instruction:%s", hex(dut.My_DataPath.Instruction.value.integer))

def Log_Controller(dut,logger):
    #Log whatever signal you want from the controller, called before positive clock edge
    logger.debug("************ DUT Controller Signals ***************")
    #dut._log.info("Op:%s", hex(dut.My_Controller.Op.value.integer))
    #dut._log.info("Funct:%s", hex(dut.My_Controller.Funct.value.integer))
    #dut._log.info("Rd:%s", hex(dut.My_Controller.Rd.value.integer))
    #dut._log.info("Src2:%s", hex(dut.My_Controller.Src2.value.integer))
    #dut._log.info("PCSrc:%s", hex(dut.My_Controller.PCSrc.value.integer))
    #dut._log.info("RegWrite:%s", hex(dut.My_Controller.RegWrite.value.integer))
    #dut._log.info("MemWrite:%s", hex(dut.My_Controller.MemWrite.value.integer))
    #dut._log.info("ALUSrc:%s", hex(dut.My_Controller.ALUSrc.value.integer))
    #dut._log.info("MemtoReg:%s", hex(dut.My_Controller.MemtoReg.value.integer))
    dut._log.info("ALUControl:%s", hex(dut.My_Controller.ALUControl.value.integer))
    
    #dut._log.info("FlagWrite:%s", hex(dut.My_Controller.FlagWrite.value.integer))
    #dut._log.info("ImmSrc:%s", hex(dut.My_Controller.ImmSrc.value.integer))
    #dut._log.info("RegSrc:%s", hex(dut.My_Controller.RegSrc.value.integer))
    #dut._log.info("ShiftControl:%s", hex(dut.My_Controller.ShiftControl.value.integer))
    #dut._log.info("shamt:%s", hex(dut.My_Controller.shamt.value.integer))
    #dut._log.info("CondEx:%s", hex(dut.My_Controller.CondEx.value.integer))