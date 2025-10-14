import ALU_pkg::*;
module ALU_tb;

parameter WORD_SIZE = 6, ALU_OP = 4;
logic [WORD_SIZE-1:0] a;
logic [WORD_SIZE-1:0] b;
logic [ALU_OP-1:0]  ALUcontrol;	
logic [WORD_SIZE-1:0] result;
logic zero;

// DUT Instantiation
ALU ALU_instance(
    .a(a),
    .b(b),
    .ALUcontrol(ALUcontrol),
    .result(result),
    .zero(zero)
);

// Test cases
initial begin
    
    // Test ADD
    a = 6'd1; b = 6'd1; ALUcontrol = ALU_ADD; #5;
    
    // Test SUB
    a = 6'd1; b = 6'd1; ALUcontrol = ALU_SUB; #5;
    
    // Test AND
    a = 6'd0; b = 6'd1; ALUcontrol = ALU_AND; #5;
    
    // Test OR
    a = 6'd0; b = 6'd1; ALUcontrol = ALU_OR; #5;
    
    // Test XOR
    a = 6'd1; b = 6'd1; ALUcontrol = ALU_XOR; #5;
    
    // Test SLT (signed)
    a = -6'sd1; b = 6'd2; ALUcontrol = ALU_SLT; #5;
    
    // Test SLTU (unsigned)
    a = 6'd1; b = 6'd2; ALUcontrol = ALU_SLTU; #5;
    
    // Test SLL
    a = 6'h1; b = 6'd2; ALUcontrol = ALU_SLL; #5;
    
    // Test SRL
    a = 6'h2; b = 6'd1; ALUcontrol = ALU_SRL; #5;
    
    // Test SRA
    a = -6'sd8; b = 6'd2; ALUcontrol = ALU_SRA; #5;
    
    // Test BEQ
    a = 6'd50; b = 6'd50; ALUcontrol = ALU_BEQ; #5;
    
    // Test BNE
    a = 6'd20; b = 6'd10; ALUcontrol = ALU_BNE; #5;
    
    // Test BGE (signed)
    a = -6'sd2; b = -6'sd1; ALUcontrol = ALU_BGE; #5;
    
    // Test BLT (signed)
    a = -6'sd1; b = -6'sd2; ALUcontrol = ALU_BLT; #5;
    
    // Test BGEU (unsigned)
    a = 6'd15; b = 6'd10; ALUcontrol = ALU_BGEU; #5;
    
    // Test BLTU (unsigned)
    a = 6'd0; b = 6'd1; ALUcontrol = ALU_BLTU; #5;

    // End simulation
    $stop;
end

endmodule