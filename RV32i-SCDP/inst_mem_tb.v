module inst_mem_tb;

reg [31:0]address;
wire [31:0]instruction;

inst_mem dut( .address(address), .instruction(instruction));

initial begin
address = 32'd0; #5;
address = 32'd4; #5;
address = 32'd8; #5;
address = 32'd12; #5;
address = 32'd16; #5;
address = 32'd20; #5;
address = 32'd24; #5;

$stop; 
end
endmodule