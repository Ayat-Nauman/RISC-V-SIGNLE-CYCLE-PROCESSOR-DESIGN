`include "alu_definitions.vh"

module main_decoder(
input [6:0] opcode,
output [1:0] immsrc,aluop,
output branch,resultsrc,memwrite,alusrc,regwrite
);
reg [8:0] controls;

assign {alusrc, resultsrc, immsrc, regwrite, memwrite, branch, aluop} = controls;

always @(*) begin
    case (opcode) 
    	`LW_TYPE:	controls = 9'b1_1_00_1_0_0_00; //Load word, load byte
	`SW_TYPE:	controls = 9'b1_x_01_0_1_0_00; // Store word, store byte
	`ADDI:   	controls = 9'b1_0_00_1_0_0_00; // ADDI
	`R_TYPE: 	controls = 9'b0_0_xx_1_0_0_01; // add, sub, and, or etc
	`SB_TYPE:	controls = 9'b0_x_10_0_0_1_10; // BEQ, BNE etc
	 default:       controls = 9'bx_x_xx_x_x_x_xx; // Undefined opcode
    endcase
end
endmodule
