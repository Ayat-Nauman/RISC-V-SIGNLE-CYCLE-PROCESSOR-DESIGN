`timescale 1ns/1ns

module mux_tb;

parameter INPUT_WIDTH = 4;
parameter SELECT_LINE_WIDTH = $clog2(INPUT_WIDTH);

reg [INPUT_WIDTH-1:0] input_bus;
reg [SELECT_LINE_WIDTH-1:0] select_lines;
wire out;

// DUT Instantiation
mux #(.INPUT_WIDTH(INPUT_WIDTH), .SELECT_LINE_WIDTH(SELECT_LINE_WIDTH)) dut (
.input_bus(input_bus),
.select_lines(select_lines),
.out(out) 
);

integer i;
initial begin
 input_bus = 4'b0101; #5;
 for(i = 0; i < INPUT_WIDTH; i=i+1) begin
    select_lines = i; #5;
 end
$stop;
end

endmodule