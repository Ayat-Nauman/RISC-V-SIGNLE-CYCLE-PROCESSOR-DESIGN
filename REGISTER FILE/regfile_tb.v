module regfile_tb;
  reg clk;
  reg [4:0] rs1, rs2, rd;
  reg regwrite;
  reg [31:0] writedata;
  wire [31:0] readdata1, readdata2;

  // DUT instantiation
  regfile dut(
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

  initial begin
    // Test 1: Write to register 9 and read 9 and 0
    regwrite = 1; rd = 5'd9; writedata = 32'h1; //x9 = 1
    rs1 = 5'd9; rs2 = 5'd0;
    #10;

    // Test 2: Read back register 9 and 3
    regwrite = 0; rs1 = 5'd9; rs2 = 5'd3;
    #10;

    // Test 3: Write to register 3, read back from 3 and 9
    regwrite = 1; rd = 5'd3; writedata = 32'h3;
    #10;
    regwrite = 0; rs1 = 5'd3; rs2 = 5'd9;
    #10;

    $stop;
  end
endmodule

