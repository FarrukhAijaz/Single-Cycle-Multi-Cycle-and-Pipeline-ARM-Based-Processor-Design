def read_file_to_list(filename):
    """
    Reads a text file and returns a list where each element is a line in the file.

    :param filename: The name of the file to read.
    :return: A list of strings, where each string is a line from the file.
    """
    with open(filename, 'r') as file:
        lines = file.readlines()
        # Stripping newline characters from each line
        lines = [line.strip() for line in lines]
    return lines

class Instruction:
    """
    Parses a 32-bit ARM instruction in hexadecimal format.

    :param instruction: A string representing the 32-bit instruction in hex format.
    :return: This class with the fields .
    """
    def __init__(self, instruction):
        # Convert the hex instruction to a 32-bit binary string
        self.binary_instr = format(int(instruction, 16), '032b')
        #Since python indexing is reversed to extract fields (31-index) for msb and (32-index) for lsb
        #For single bits do (31-index)
        self.Cond = int(self.binary_instr[0:4], 2)
        self.Op = int(self.binary_instr[4:6], 2)
        self.I = int(self.binary_instr[6], 2)
        self.cmd = int(self.binary_instr[7:11], 2)
        self.S = int(self.binary_instr[11], 2)
        self.Rn = int(self.binary_instr[12:16], 2)
        self.Rd = int(self.binary_instr[16:20], 2)
        self.rot = int(self.binary_instr[20:24], 2)
        self.imm8 = int(self.binary_instr[24:32], 2)
        self.shamt5 = int(self.binary_instr[20:25], 2)
        self.sh = int(self.binary_instr[25:27], 2)
        self.Rm = int(self.binary_instr[28:32], 2)
        self.Rs = int(self.binary_instr[20:24], 2)
        self.imm12 = int(self.binary_instr[20:32], 2)
        self.L = int(self.binary_instr[11], 2)
        if self.binary_instr[8] == '1':
            # Perform sign extension by flipping all bits and subtracting 1
            inverted_string = ''.join('0' if bit == '1' else '1' for bit in self.binary_instr[8:32])
            self.imm24 = -int(inverted_string, 2) - 1
        else:
            # It's a positive number, convert normally
            self.imm24 = int(self.binary_instr[8:32], 2)
        self.L_branch = int(self.binary_instr[7], 2)
        
    def log(self,logger):
        logger.debug("****** Current Instruction *********")
        logger.debug("Binary string:%s", self.binary_instr)
        if(self.binary_instr[4:28]=="000100101111111111110001"):
            logger.debug("Operation type BX")
            logger.debug("Rm: %d",self.Rm)
        elif(self.Op == 0):
            logger.debug("Operation type Data Processing")
            logger.debug("cond:%s ",'{0:X}'.format(self.Cond))
            logger.debug("Immediate bit:%d ",self.I)
            logger.debug("cmd:%s ",'{0:X}'.format(self.cmd))
            logger.debug("Set bit:%d ",self.S)
            logger.debug("Rn:%d \t Rd:%d ",self.Rn,self.Rd)
            if(self.I==1):
                logger.debug("rot:%d \t imm8:%d ",self.rot,self.imm8)
            else:
                logger.debug("shamt5:%d \t sh:%d \t Rm:%d ",self.shamt5,self.sh,self.Rm)
        elif(self.Op == 1):
            logger.debug("Operation type Memory")
            logger.debug("Load bit:%d ",self.L)
            logger.debug("Rn:%d \t Rn:%d ",self.Rn,self.Rd)
            logger.debug("imm12:%d",self.imm12)
        elif(self.Op==2):
            logger.debug("Operation type Branch (except Bx)")
            logger.debug("Link bit:%d ",self.L_branch)
            logger.debug("imm24:%d",self.imm24)
        


def rotate_right(value, shift, n_bits=32):
    """
    Rotate `value` to the right by `shift` bits.

    :param value: The integer value to rotate.
    :param shift: The number of bits to rotate by.
    :param n_bits: The bit-width of the integer (default 32 for standard integer).
    :return: The value after rotating to the right.
    """
    shift %= n_bits  # Ensure the shift is within the range of 0 to n_bits-1
    return (value >> shift) | (value << (n_bits - shift)) & ((1 << n_bits) - 1)

def shift_helper(value, shift,shift_type, n_bits=32):
    shift %= n_bits  # Ensure the shift is within the range of 0 to n_bits-1
    match shift_type:
        case 0:
            return (value  << shift)% 0x100000000
        case 1:
            return (value  >> shift) % 0x100000000
        case 2:
            if((value & 0x80000000)!=0):
                    filler = (0xFFFFFFFF >> (n_bits-shift))<<((n_bits-shift))
                    return ((value  >> shift)|filler) % 0x100000000
            else:
                return (value  >> shift) % 0x100000000
        case 3:
            return rotate_right(value,shift,n_bits)
        
def reverse_hex_string_endiannes(hex_string):  
    reversed_string = bytes.fromhex(hex_string)
    reversed_string = reversed_string[::-1]
    reversed_string = reversed_string.hex()        
    return  reversed_string
class ByteAddressableMemory:
    def __init__(self, size):
        self.size = size
        self.memory = bytearray(size)  # Initialize memory as a bytearray of the given size

    def read(self, address):
        if address < 0 or address + 4 > self.size:
            raise ValueError("Invalid memory address or length")
        return_val = bytes(self.memory[address : address + 4])
        return_val = return_val[::-1]
        return return_val

    def write(self, address, data):
        if address < 0 or address + 4> self.size:
            raise ValueError("Invalid memory address or data length")
        data_bytes = data.to_bytes(4, byteorder='little')
        self.memory[address : address + 4] = data_bytes        


def Log_Datapath(dut,logger):
    #Log whatever signal you want from the datapath, called before positive clock edge
    logger.debug("************ DUT DATAPATH Signals ***************")
    dut._log.info("reset:%s", hex(dut.my_datapath.reset.value.integer))
    dut._log.info("ALUSrc:%s", hex(dut.my_datapath.ALUSrc.value.integer))
    dut._log.info("MemWrite:%s", hex(dut.my_datapath.MemWrite.value.integer))
    dut._log.info("RegWrite:%s", hex(dut.my_datapath.RegWrite.value.integer))
    dut._log.info("PCSrc:%s", hex(dut.my_datapath.PCSrc.value.integer))
    dut._log.info("MemtoReg:%s", hex(dut.my_datapath.MemtoReg.value.integer))
    dut._log.info("RegSrc:%s", hex(dut.my_datapath.RegSrc.value.integer))
    dut._log.info("ImmSrc:%s", hex(dut.my_datapath.ImmSrc.value.integer))
    dut._log.info("ALUControl:%s", hex(dut.my_datapath.ALUControl.value.integer))
    dut._log.info("CO:%s", hex(dut.my_datapath.CO.value.integer))
    dut._log.info("OVF:%s", hex(dut.my_datapath.OVF.value.integer))
    dut._log.info("N:%s", hex(dut.my_datapath.N.value.integer))
    dut._log.info("Z:%s", hex(dut.my_datapath.Z.value.integer))
    dut._log.info("CarryIN:%s", hex(dut.my_datapath.CarryIN.value.integer))
    dut._log.info("ShiftControl:%s", hex(dut.my_datapath.ShiftControl.value.integer))
    dut._log.info("shamt:%s", hex(dut.my_datapath.shamt.value.integer))
    dut._log.info("PC:%s", hex(dut.my_datapath.PC.value.integer))
    dut._log.info("Instruction:%s", hex(dut.my_datapath.Instruction.value.integer))

def Log_Controller(dut,logger):
    #Log whatever signal you want from the controller, called before positive clock edge
    logger.debug("************ DUT Controller Signals ***************")
    dut._log.info("Op:%s", hex(dut.my_controller.Op.value.integer))
    dut._log.info("Funct:%s", hex(dut.my_controller.Funct.value.integer))
    dut._log.info("Rd:%s", hex(dut.my_controller.Rd.value.integer))
    dut._log.info("Src2:%s", hex(dut.my_controller.Src2.value.integer))
    dut._log.info("PCSrc:%s", hex(dut.my_controller.PCSrc.value.integer))
    dut._log.info("RegWrite:%s", hex(dut.my_controller.RegWrite.value.integer))
    dut._log.info("MemWrite:%s", hex(dut.my_controller.MemWrite.value.integer))
    dut._log.info("ALUSrc:%s", hex(dut.my_controller.ALUSrc.value.integer))
    dut._log.info("MemtoReg:%s", hex(dut.my_controller.MemtoReg.value.integer))
    dut._log.info("ALUControl:%s", hex(dut.my_controller.ALUControl.value.integer))
    dut._log.info("FlagWrite:%s", hex(dut.my_controller.FlagWrite.value.integer))
    dut._log.info("ImmSrc:%s", hex(dut.my_controller.ImmSrc.value.integer))
    dut._log.info("RegSrc:%s", hex(dut.my_controller.RegSrc.value.integer))
    dut._log.info("ShiftControl:%s", hex(dut.my_controller.ShiftControl.value.integer))
    dut._log.info("shamt:%s", hex(dut.my_controller.shamt.value.integer))
    dut._log.info("CondEx:%s", hex(dut.my_controller.CondEx.value.integer))