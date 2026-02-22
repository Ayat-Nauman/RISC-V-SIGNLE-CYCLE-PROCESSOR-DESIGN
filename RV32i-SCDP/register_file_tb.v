`timescale 1ns/1ns
module register_file_tb;

  reg clk;
  reg [4:0] rs1, rs2, rd;
  reg regwrite;
  reg [31:0] writedata;
  wire [31:0] readdata1, readdata2;

  // DUT instantiation
  register_file dut(
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .readdata1(readdata1),
    .readdata2(readdata2),
    .writedata(writedata),
    .regwrite(regwrite)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // Test cases
  initial begin
    //  ADDI x9, x0, 9 
    rd = 9; writedata = 32'd9; rs1 = 0; regwrite = 1; #10;  

    // ADDI x5, x0, 5 
    rd = 5; writedata = 32'd5; regwrite = 1; #10;

    // SW x5, -4(x9) 
    rs1 = 9; rs2 = 5; regwrite = 0; #10;  // read x9 (base), x5 (data)

    // LW x6, -4(x9) 
    rs1 = 9; rd = 6; writedata = 32'd5; regwrite = 1; #10;  // write loaded data to x6

    // SW x6, 8(x9) 
    rs1 = 9; rs2 = 6; regwrite = 0; #10;  // read x9, x6

    // OR x4, x5, x6 
    rs1 = 5; rs2 = 6; rd = 4; writedata = readdata1 | readdata2; regwrite = 1; #10;

    // BEQ x4, x4, L1 
    rs1 = 4; rs2 = 4; regwrite = 0; #10;  // read both x4 registers to compare

    $stop;
  end
endmodule

