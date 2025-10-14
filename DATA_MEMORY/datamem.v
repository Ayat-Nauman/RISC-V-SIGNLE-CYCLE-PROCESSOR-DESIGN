
// module name and port listing
module datamem(
input  clk,
input  [31:0]address,
input  memwrite,
input  [31:0]writedata,
output [31:0]readdata
);

parameter DATA_WIDTH = 8, DEPTH = 16;

// creating data memory
reg [DATA_WIDTH-1:0]d_mem[DEPTH-1:0];


// Reading operation is independent of clock therefore using assign statement
assign readdata = {d_mem[address+3], d_mem[address+2], d_mem[address+1], d_mem[address]};

// writing operation is clock dependent

always @(posedge clk) begin
	if (memwrite) {d_mem[address+3], d_mem[address+2], d_mem[address+1], d_mem[address]} <= writedata;
end

endmodule
