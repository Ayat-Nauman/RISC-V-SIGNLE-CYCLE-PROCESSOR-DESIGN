`timescale 1ns/1ns

module datamem_tb;

reg clk;
reg [31:0]address;
reg memwrite;
reg [31:0]writedata;
wire [31:0]readdata;

datamem dut(
.clk(clk), 
.address(address),
.writedata(writedata),
.memwrite(memwrite),
.readdata(readdata)
);

always begin
clk = ~clk;
#5;
end

parameter DATA_WIDTH = 8, DEPTH = 16;
reg [DATA_WIDTH-1:0]d_mem[DEPTH-1:0];

integer i;
// initializing the memory with random numbers
initial begin
	
	for(i=0; i<DEPTH; i=i+1) begin
		d_mem[i] <= $urandom;
	end
end

// test cases
initial begin
clk = 1; #5;
address = 5'h00000; memwrite = 0; writedata = 5'h00001; 
#5
address = 5'h00000; memwrite = 1; 
#5
$stop;
end
endmodule
