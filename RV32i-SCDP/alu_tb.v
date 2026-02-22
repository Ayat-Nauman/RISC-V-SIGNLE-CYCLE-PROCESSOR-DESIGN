`timescale 1ns/1ns

`include "alu_definitions.vh"

module alu_tb;

localparam WORD_SIZE = 32;
localparam ALU_OP = 3;

reg  [WORD_SIZE-1:0] a;
reg  [WORD_SIZE-1:0] b;
reg  [ALU_OP-1:0] alucontrol;	
wire [WORD_SIZE-1:0] result;
wire zero;

// DUT Instantiation
alu dut (
.a(a),
.b(b),
.alucontrol(alucontrol),
.result(result),
.zero(zero)
);

// Test cases
initial begin
    a = 32'd1; b = 32'd1; alucontrol = `ADD; #5; // Test ADD
    a = 32'd0; b = 32'd1; alucontrol = `OR;  #5; // Test OR
    a = 32'd1; b = 32'd1; alucontrol = `SUB; #5; // Test SUB    
    $stop; // Test SUB
end

endmodule
