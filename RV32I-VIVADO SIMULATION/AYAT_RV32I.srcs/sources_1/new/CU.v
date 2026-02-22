
module CU(
input [6:0]      opcode,
input [6:0]      funct7,
input [2:0]      funct3,
input 		   zero,
output [2:0] alucontrol,
output [1:0]     immsrc,
output resultsrc,memwrite,alusrc,regwrite,pcsrc
);

wire branch;
wire [1:0] aluop;

main_decoder md(
.opcode(opcode),
.branch(branch),
.immsrc(immsrc),
.resultsrc(resultsrc),
.aluop(aluop),
.memwrite(memwrite),
.alusrc(alusrc),
.regwrite(regwrite)
);
alu_decoder ad(
.aluop(aluop),
.funct3(funct3),
.funct7(funct7),
.alucontrol(alucontrol)
);

assign pcsrc = branch && zero;

endmodule
