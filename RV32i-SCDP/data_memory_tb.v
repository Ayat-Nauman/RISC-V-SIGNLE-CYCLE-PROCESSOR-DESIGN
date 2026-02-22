`timescale 1ns/1ns
module data_memory_tb;

reg clk;
reg [31:0] address;
reg memwrite;
reg [31:0] writedata;
wire [31:0] readdata;

data_memory dut (
    .clk(clk), 
    .address(address),
    .writedata(writedata),
    .memwrite(memwrite),
    .readdata(readdata)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
// sw x5, -4(x9)
// x9 = 9, x5 = 5
// Effective address = 9 + (-4) = 5
clk = 1; address = 32'd5; writedata = 32'd5;  memwrite = 1; #10; // store value 5
     
// lw x6, -4(x9)
// Effective address = 9 + (-4) = 5
address = 32'd5; memwrite = 0; #10;

// sw x6, 8(x9)
// x6 = 5 (from lw result)
// Effective address = 9 + 8 = 17
address = 32'd17; writedata = 32'd5; memwrite = 1; #10;

// lw x7, 8(x9) (extra test)
// Verify the stored value at address 17
address = 32'd17; memwrite = 0; #10;
$stop;

end

endmodule

