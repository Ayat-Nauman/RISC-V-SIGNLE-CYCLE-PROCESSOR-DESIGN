import ALU_pkg::*;
module ALU_tb;

logic [31:0] a;
logic [31:0] b;
logic [5:0]  ALUcontrol;	
logic [31:0] result;
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
    a = 32'd1; b = 32'd1; ALUcontrol = ALU_ADD; #5;

    // Test SUB
    a = 32'd1; b = 32'd1; ALUcontrol = ALU_SUB; #5;

    // Test AND
    a = 32'd0; b = 32'd1; ALUcontrol = ALU_AND; #5;

    // Test OR
    a = 32'd0; b = 32'd1; ALUcontrol = ALU_OR; #5;

    // Test XOR
    a = 32'd1; b = 32'd1; ALUcontrol = ALU_XOR; #5;

    // Test SLT (signed)
    a = -32'd1; b = 32'd2; ALUcontrol = ALU_SLT; #5;

    // Test SLTU (unsigned)
    a = 32'd1; b = 32'd2; ALUcontrol = ALU_SLTU; #5;

    // Test SLL
    a = 32'h1; b = 32'd2; ALUcontrol = ALU_SLL; #5;

    // Test SRL
    a = 32'h2; b = 32'd1; ALUcontrol = ALU_SRL; #5;

    // Test SRA
    a = -32'sd8; b = 32'd2; ALUcontrol = ALU_SRA; #5;

    // Test BEQ
    a = 32'd50; b = 32'd50; ALUcontrol = ALU_BEQ; #5;

    // Test BNE
    a = 32'd20; b = 32'd10; ALUcontrol = ALU_BNE; #5;

    // Test BGE (signed)
    a = -32'd2; b = -32'd1; ALUcontrol = ALU_BGE; #5;

    // Test BLT (signed)
    a = -32'd1; b = -32'd2; ALUcontrol = ALU_BLT; #5;

    // Test BGEU (unsigned)
    a = 32'd15; b = 32'd10; ALUcontrol = ALU_BGEU; #5;

    // Test BLTU (unsigned)
    a = 32'd0; b = 32'd1; ALUcontrol = ALU_BLTU; #5;

    // End simulation
    $stop;
end

endmodule
