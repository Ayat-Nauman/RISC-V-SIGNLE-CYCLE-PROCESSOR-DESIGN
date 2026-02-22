
`timescale 1ns/1ns

module rv32_tb;
reg clk;
reg rst;

// control unit outputs
wire resultsrc_out, memwrite_out, alusrc_out, regwrite_out, pcsrc_out;

rv32i dut(
.clk(clk),
.rst(rst),
.resultsrc_out(resultsrc_out), 
.memwrite_out(memwrite_out), 
.alusrc_out(alusrc_out), 
.regwrite_out(regwrite_out), 
.pcsrc_out(pcsrc_out)
);

initial clk = 0;
always #5 clk=~clk;

initial begin

clk=1; rst=1;
#10;
rst = 0;
clk=1;   
// Run for some time
# 75 ; 
rst = 1; #5;
$stop;

end
endmodule
