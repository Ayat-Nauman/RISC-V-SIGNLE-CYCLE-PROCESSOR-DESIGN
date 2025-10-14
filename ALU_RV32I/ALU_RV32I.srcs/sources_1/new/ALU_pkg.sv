package ALU_pkg;

    typedef enum logic [3:0] {
        ALU_ADD   = 4'b0000,  // Addition (add, addi)
        ALU_SUB   = 4'b0001,  // Subtraction (sub)
        ALU_AND   = 4'b0010,  // Bitwise AND (and, andi)
        ALU_OR    = 4'b0011,  // Bitwise OR (or, ori)
        ALU_XOR   = 4'b0100,  // Bitwise XOR (xor, xori)
        ALU_SLT   = 4'b0101,  // Set Less Than, signed (slt, slti)
        ALU_SLTU  = 4'b0110,  // Set Less Than, unsigned (sltu, sltui)
        ALU_SLL   = 4'b0111,  // Shift Left Logical (sll, slli)
        ALU_SRL   = 4'b1000,  // Shift Right Logical (srl, srli)
        ALU_SRA   = 4'b1001,  // Shift Right Arithmetic (sra, srai)
        ALU_BEQ   = 4'b1010,  // Branch if Equal (beq)
        ALU_BNE   = 4'b1011,  // Branch if Not Equal (bne)
        ALU_BGE   = 4'b1100,  // Branch if Greater than or Equal, signed (bge)
        ALU_BLT   = 4'b1101,  // Branch if Less Than, signed (blt)
        ALU_BGEU  = 4'b1110,  // Branch if Greater than or Equal, unsigned (bgeu)
        ALU_BLTU  = 4'b1111   // Branch if Less Than, unsigned (bltu)
    } ALU_control_signals;

endpackage
