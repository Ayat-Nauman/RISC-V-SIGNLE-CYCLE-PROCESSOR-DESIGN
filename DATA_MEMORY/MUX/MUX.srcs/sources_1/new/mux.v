module mux #(parameter INPUT_WIDTH = 4,SELECT_LINE_WIDTH = $clog2(INPUT_WIDTH))(
input [INPUT_WIDTH-1:0] input_bus,
input [SELECT_LINE_WIDTH-1:0] select_lines,
output out
);

assign out = input_bus [select_lines];

endmodule