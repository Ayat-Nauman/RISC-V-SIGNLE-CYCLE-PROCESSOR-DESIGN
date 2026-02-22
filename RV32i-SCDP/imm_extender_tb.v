
`timescale 1ns/1ps
`include "alu_definitions.vh"
module imm_extender_tb;
    // Inputs
    reg [31:0] instruction;
    reg [1:0] ImmSrc;
    // Outputs
    wire [31:0] ImmOut;
    // Instantiate DUT
    imm_extender dut (
        .instruction(instruction),
        .ImmSrc(ImmSrc),
        .ImmOut(ImmOut)
    );

    initial begin
        // ADDI x9, x0, 9   ? I-type (imm = +9)
    ImmSrc = `I; instruction = 32'h00900493; #10;  // I-type immediate +9

    // ADDI x5, x0, 5   ? I-type (imm = +5)
    ImmSrc = `I; instruction = 32'h00500293; #10;  // I-type immediate +5

    // SW x5, -4(x9)    ? S-type (imm = -4)
    ImmSrc = `S; instruction = 32'hFE54AE23; #10;  // S-type immediate -4

    // LW x6, -4(x9)    ? I-type (imm = -4)
    ImmSrc = `I; instruction = 32'hFFC4A303; #10;  // I-type immediate -4

    // SW x6, 8(x9)     ? S-type (imm = +8)
    ImmSrc = `S; instruction = 32'h0064A423; #10;  // S-type immediate +8

    // OR x4, x5, x6    ? R-type (no immediate, ignore extender)
    ImmSrc = 2'bxx; instruction = 32'h0062E233; #10;  // R-type (imm not used)

    // BEQ x4, x4, L1   ? B-type (imm = backward branch = -12)
    ImmSrc = `B; instruction = 32'hFE420AE3; #10;  // B-type negative offset (branch backward)

        $stop;
    end

endmodule
