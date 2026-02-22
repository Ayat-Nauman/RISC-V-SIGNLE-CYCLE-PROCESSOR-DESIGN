module data_memory(
    input clk,
    input [31:0] address,
    input memwrite,
    input [31:0] writedata,
    output [31:0] readdata
);
parameter DATA_WIDTH = 8, DEPTH = 32;

reg [DATA_WIDTH-1:0] d_mem [0:DEPTH-1];

assign readdata = {d_mem[address+3], d_mem[address+2], d_mem[address+1], d_mem[address]};

always @(posedge clk) begin
    if (memwrite)
        {d_mem[address+3], d_mem[address+2], d_mem[address+1], d_mem[address]} <= writedata;
end

endmodule

