
module adder_tb;

reg [31:0] a, b;
wire [31:0] out;

adder adder_instance(.a(a), .b(b), .out(out));

initial begin

a= 32'd1; b= 32'd0; #5;
a= 32'd1; b= 32'd2; #5;

$stop;
end

endmodule
