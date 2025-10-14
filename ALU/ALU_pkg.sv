package ALU_pkg;

    typedef enum logic [5:0] {    
        ALU_ADD  = 6'b011001,  // Addition (add, addi)
        ALU_SUB  = 6'b011011,  // Subtraction (sub)
        ALU_AND  = 6'b011101,  // Bitwise AND (and, andi)
        ALU_OR   = 6'b011111,  // Bitwise OR (or, ori)
        ALU_XOR  = 6'b100001,  // Bitwise XOR (xor, xori)
        ALU_SLT  = 6'b100011,  // Set Less Than, signed (slt, slti)
        ALU_SLTU = 6'b100101,  // Set Less Than, unsigned (sltu, sltui)
        ALU_SLL  = 6'b100111,  // Shift Left Logical (sll, slli)
        ALU_SRL  = 6'b101001,  // Shift Right Logical (srl, srli)
        ALU_SRA  = 6'b101011,  // Shift Right Arithmetic (sra, srai)
        ALU_BEQ  = 6'b101101,  // Branch if Equal (beq)
        ALU_BNE  = 6'b101111,  // Branch if Not Equal (bne)
        ALU_BGE  = 6'b110001,  // Branch if Greater than or Equal, signed (bge)
        ALU_BLT  = 6'b110011,  // Branch if Less Than, signed (blt)
        ALU_BGEU = 6'b110101,  // Branch if Greater than or Equal, unsigned (bgeu)
        ALU_BLTU = 6'b110111   // Branch if Less Than, unsigned (bltu)
    } ALU_control_signals;

endpackage

