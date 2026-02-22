
module register_file (
	input clk,
	input regwrite,
	input [4:0] rd,
	input [4:0] rs2,
	input [4:0] rs1,
	input [31:0] writedata,
	output reg [31:0] readdata1,
	output reg [31:0] readdata2
);


// 32 registers of width = 32
reg [32-1:0] registers [32-1:0];

//Initialize Register file with zero
integer i;
initial begin
for (i = 0; i <= 32 ; i=i+1) registers[i] <= 0;
end

// Decoder for Write Data
always @(posedge clk) begin
	if (regwrite &&(rd != 5'b00000))registers[rd] <= writedata ;
end

//Mux for Read Data 1
always @(*) begin
	if (rd == 5'b00000) readdata1 <= 32'b0;
	else readdata1 <= registers[rs1];
end

//Mux for Read Data 2
always @(*) begin
	if (rd == 5'b00000)
		readdata2 <= 32'b0;
	else readdata2 <= registers[rs2];
end

// expose two registers for debugging
//wire [31:0] reg_debug9 = registers[9];
//wire [31:0] reg_debug3 = registers[3];

endmodule