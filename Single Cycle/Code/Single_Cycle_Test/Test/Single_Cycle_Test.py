# ==============================================================================
# Authors:              Doğu Erkan Arkadaş
#
# Cocotb Testbench:     For Single Cycle ARM Laboratory
#
# Description:
# ------------------------------------
# Test bench for the single cycle laboratory, used by the students to check their designs
#
# License:
# ==============================================================================
class Constants:
    # Define your constant values as class attributes for operation types
    ADD = 4
    SUB = 2
    AND = 0
    ORR = 12
    CMP = 10
    MOV = 13
    EQ = 0
    NE = 1
    AL = 14

import logging
import cocotb
from Helper_lib import read_file_to_list,Instruction,rotate_right, shift_helper, ByteAddressableMemory,reverse_hex_string_endiannes
from Helper_Student import Log_Datapath,Log_Controller
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, RisingEdge, Edge, Timer
from cocotb.binary import BinaryValue



class TB:
    def __init__(self, Instruction_list,dut,dut_PC,dut_regfile):
        self.dut = dut
        self.dut_PC = dut_PC
        self.dut_regfile = dut_regfile
        self.Instruction_list = Instruction_list
        #Configure the logger
        self.logger = logging.getLogger("Performance Model")
        self.logger.setLevel(logging.DEBUG)
        #Initial values are all 0 as in a FPGA
        self.PC = 0
        self.Z_flag = 0
        self.Register_File =[]
        for i in range(16):
            self.Register_File.append(0)
        #Memory is a special class helper lib to simulate HDL counterpart    
        self.memory = ByteAddressableMemory(1024)

        self.clock_cycle_count = 0        
          
    #Calls user populated log functions    
    def log_dut(self):
        Log_Datapath(self.dut,self.logger)
        Log_Controller(self.dut,self.logger) 

    #Compares and lgos the PC and register file of Python module and HDL design
    def compare_result(self):
        self.logger.debug("************* Performance Model / DUT Data  **************")
        self.logger.debug("PC:%d \t PC:%d",self.PC,self.dut_PC.value.integer)
        for i in range(15):
            self.logger.debug("Register%d: %d \t %d",i,self.Register_File[i], self.dut_regfile.Reg_Out[i].value.integer)
        self.logger.debug("Register%d: %d \t %d",15,self.Register_File[15], self.dut_regfile.Reg_15.value.integer)
        assert self.PC == self.dut_PC.value
        for i in range(15):
           assert self.Register_File[i] == self.dut_regfile.Reg_Out[i].value
        assert self.Register_File[15] == self.dut_regfile.Reg_15.value
        
    #A model of the verilog code to confirm operation, data is In_data
    def performance_model (self):
        self.logger.debug("**************** Clock cycle: %d **********************",self.clock_cycle_count)
        self.clock_cycle_count = self.clock_cycle_count+1
        #Read current instructions, extract and log the fields
        self.logger.debug("**************** Instruction No: %d **********************",int((self.PC)/4))
        current_instruction = self.Instruction_list[int((self.PC)/4)]
        current_instruction = current_instruction.replace(" ", "")
        #We need to reverse the order of bytes since little endian makes the string reversed in Python
        current_instruction = reverse_hex_string_endiannes(current_instruction)
        #Initial R15 value for operations
        self.Register_File[15] = self.PC + 8  
        self.PC = self.PC + 4
        #Flag to check if the current instruction will be executed.
        execute_flag = False
        #Call Instruction calls to get each field from the instruction
        inst_fields = Instruction(current_instruction)
        inst_fields.log(self.logger)
        match inst_fields.Cond:
            case Constants.AL:
                execute_flag=True
            case Constants.EQ:
                if(self.Z_flag == 1):
                    execute_flag = True
            case Constants.NE:
                if(self.Z_flag == 0):
                    execute_flag = True
        if(execute_flag):
            #binary_instr is jsut for BX check             
            binary_instr = format(int(current_instruction, 16), '032b')
            #Weird BX condition
            if(binary_instr[4:28]=="000100101111111111110001"):
                self.PC = self.Register_File[inst_fields.Rm]   
            elif(inst_fields.Op==0):
                #Data Processing Case
                if(inst_fields.I==1):
                    datap_second_operand = rotate_right(inst_fields.imm8,inst_fields.rot*2)
                else:
                    datap_second_operand = shift_helper(self.Register_File[inst_fields.Rm],inst_fields.shamt5,inst_fields.sh) 
                match inst_fields.cmd:
                    case Constants.AND:
                        datap_result = self.Register_File[inst_fields.Rn] & datap_second_operand
                        self.Register_File[inst_fields.Rd] = datap_result
                    case Constants.ORR:
                        datap_result = self.Register_File[inst_fields.Rn]  | datap_second_operand
                        self.Register_File[inst_fields.Rd] = datap_result
                    case Constants.ADD:
                        datap_result = self.Register_File[inst_fields.Rn] + datap_second_operand
                        self.Register_File[inst_fields.Rd] = datap_result
                    case Constants.SUB:
                        datap_result = self.Register_File[inst_fields.Rn]  - datap_second_operand
                        self.Register_File[inst_fields.Rd] = datap_result
                    case Constants.MOV:
                        datap_result = datap_second_operand
                        self.Register_File[inst_fields.Rd] = datap_result
                    case Constants.CMP:
                        datap_result = self.Register_File[inst_fields.Rn]  - datap_second_operand
                    case _:
                        self.logger.error("Not supported data processing instruction!!")
                        assert False 
                #Check S bit to set Z-flag, only CMP should have this
                if(inst_fields.S==1):
                    if(datap_result == 0):
                        self.Z_flag = 1
                    else:
                        self.Z_flag = 0
            #Memory Operations case        
            elif(inst_fields.Op == 1):
                if(inst_fields.L==1):
                    self.Register_File[inst_fields.Rd]= int.from_bytes(self.memory.read(self.Register_File[inst_fields.Rn] +inst_fields.imm12))
                else:
                    self.memory.write(self.Register_File[inst_fields.Rn] + inst_fields.imm12,self.Register_File[inst_fields.Rd])
            #Branch case
            elif(inst_fields.Op == 2):
                if (inst_fields.L_branch):
                    self.Register_File[14]=self.PC
                #Only +4 since we already increment 4 at the start
                self.PC = self.PC + 4 + (inst_fields.imm24*4)
            else:
                self.logger.error("Invalid operation type of 3!!")
                assert False
        else:
            self.logger.debug("Current Instruction is not executed")

        #We change register file 15 (PC + 8) after increment and branches because we compare after the clock cycle
        self.Register_File[15] = self.PC + 8
    async def run_test(self):
        self.performance_model()
        #Wait 1 us the very first time bc. initially all signals are "X"
        await Timer(1, units="us")
        self.log_dut()
        await RisingEdge(self.dut.clk)
        await FallingEdge(self.dut.clk)
        self.compare_result()
        while(int(self.Instruction_list[int((self.PC)/4)].replace(" ", ""),16)!=0):
            self.performance_model()
            #Log datapath and controller before clock edge, this calls user filled functions
            self.log_dut()
            await RisingEdge(self.dut.clk)
            await FallingEdge(self.dut.clk)
            self.compare_result()
                
                   
@cocotb.test()
async def Single_cycle_test(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    #Reset onces before continuing with the tests
    dut.reset.value=1
    await RisingEdge(dut.clk)
    dut.reset.value=0
    await FallingEdge(dut.clk)
    instruction_lines = read_file_to_list('Instructions.hex')
    #Give PC signal handle and Register File MODULE handle
    tb = TB(instruction_lines,dut, dut.PC, dut.my_datapath.reg_file_dp)
    await tb.run_test()