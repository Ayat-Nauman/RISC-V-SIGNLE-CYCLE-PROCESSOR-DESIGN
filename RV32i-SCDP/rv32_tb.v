
`timescale 1ns/1ns

module rv32_tb;
reg clk;
reg rst;
//instruction memory output
wire [31:0]instruction;
// Mux outputs
wire [31:0]mux1_out, mux2_out, mux3_out;
// adder outputs
wire [31:0] pc4, pctarget;
// register file outputs
wire [31:0] rd1, rd2;
// program counter output
wire [31:0] pcout;
// imm extender output
wire [31:0] imm_ext_out;
// alu output
wire [31:0] aluresult_out;
wire zero_out;
// Data memory output
wire [31:0] rd;
// control unit outputs
wire [1:0] immsrc_out;
wire resultsrc_out, memwrite_out, alusrc_out, regwrite_out, pcsrc_out;
wire [2:0] alucontrol_out;




rv32i dut(
.clk(clk),
.rst(rst),
.instruction(instruction),
.mux1_out(mux1_out),
.mux2_out(mux2_out), 
.mux3_out(mux3_out),
.pc4(pc4), 
.pctarget(pctarget),
.rd1(rd1),
.rd2(rd2),
.pcout(pcout),
.imm_ext_out(imm_ext_out),
.aluresult_out(aluresult_out),
.zero_out(zero_out),
.rd(rd),
.alucontrol_out(alucontrol_out), 
.immsrc_out(immsrc_out), 
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
