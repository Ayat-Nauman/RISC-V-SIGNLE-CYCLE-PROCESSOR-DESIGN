
module mux (
input [31:0]a, b,
input select_lines,
output [31:0]out
);

assign out = select_lines? b:a; 

endmodule