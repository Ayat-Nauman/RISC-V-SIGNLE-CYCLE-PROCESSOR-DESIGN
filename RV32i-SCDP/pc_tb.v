`timescale 1ns/1ns
module pc_tb;

reg clk;
reg rst;
reg [31:0] pc_next;
wire [31:0] pc_out;

// DUT Instance
pc dut(
    .clk(clk),
    .rst(rst),
    .pc_next(pc_next),
    .pc_out(pc_out)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;

// Test sequence
initial begin
    // Reset test
    rst = 1; pc_next = 32'h00000000; #10;  // Reset active
    rst = 0; #5;                            // Release reset

    // Instruction 1: addi x9, x0, 9
    pc_next = 32'h00000004; #10;

    // Instruction 2: addi x5, x0, 5
    pc_next = 32'h00000008; #10;

    // Instruction 3: sw x5, -4(x9)
    pc_next = 32'h0000000C; #10;

    // Instruction 4: lw x6, -4(x9)
    pc_next = 32'h00000010; #10;

    // Instruction 5: sw x6, 8(x9)
    pc_next = 32'h00000014; #10;

    // Instruction 6: or x4, x5, x6
    pc_next = 32'h00000018; #10;

    // Instruction 7: beq x4, x4, L1  (branch taken to PC=0x0C)
    pc_next = 32'h0000000C; #10;

    $stop;
end

endmodule

