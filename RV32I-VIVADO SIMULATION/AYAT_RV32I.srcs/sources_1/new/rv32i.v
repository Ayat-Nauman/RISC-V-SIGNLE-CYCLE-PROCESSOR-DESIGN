module rv32i(
input clk, rst,
output  resultsrc_out, memwrite_out, alusrc_out, regwrite_out, pcsrc_out
);

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
wire [2:0] alucontrol_out;


// CU instance
CU dut1(
.opcode(instruction[6:0]),
.zero(zero_out),
.funct7(instruction[31:25]),
.funct3(instruction[14:12]),
.alucontrol(alucontrol_out),
.immsrc(immsrc_out),
.resultsrc(resultsrc_out),
.memwrite(memwrite_out),
.alusrc(alusrc_out),
.regwrite(regwrite_out),
.pcsrc(pcsrc_out)
);

// First Mux (Selects PC+4 or PC target)
mux dut2(
.a(pc4),
.b(pctarget),
.select_lines(pcsrc_out),
.out(mux1_out)
);

// PC
pc dut3(
.clk(clk),
.rst(rst),
.pc_next(mux1_out),
.pc_out(pcout)
);

// Istruction Memory
inst_mem dut4(
.address(pcout),
.instruction(instruction)
);

// Register File
register_file dut5(
.clk(clk),
.regwrite(regwrite_out),
.rd(instruction[11:7]),
.rs2(instruction[24:20]),
.rs1(instruction[19:15]),
.writedata(mux3_out),
.readdata1(rd1),
.readdata2(rd2)
);

// Immediate Extender
imm_extender dut6(
.instruction(instruction),
.ImmSrc(immsrc_out),         
.ImmOut(imm_ext_out)
);

// Second Mux (selects ALU Src)
mux dut7(
.a(rd2),
.b(imm_ext_out),
.select_lines(alusrc_out),
.out(mux2_out)
);


// ALU
alu dut8(
.a(rd1),
.b(mux2_out),
.alucontrol(alucontrol_out),
.result(aluresult_out),
.zero(zero_out)
);

// Data Memory
data_memory dut9(
.clk(clk),
.address(aluresult_out),
.memwrite(memwrite_out),
.writedata(rd2),
.readdata(rd)
);

// Mux 3 (Selects Result Source)
mux dut10(
.a(aluresult_out),
.b(rd),
.select_lines(resultsrc_out),
.out(mux3_out)
);

// PC+4 Adder
adder dut11(
.a(pcout),
.b(32'd4),
.out(pc4)
);

// PC target adder
adder dut12(
.a(pcout),
.b(imm_ext_out),
.out(pctarget)
);

endmodule
