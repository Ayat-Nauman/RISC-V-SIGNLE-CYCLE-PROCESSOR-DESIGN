import ALU_pkg::*;

module ALU(
	input  logic [31:0] a,
	input  logic [31:0] b,
	input  logic [5:0] ALUcontrol,	
	output logic [31:0] result,
	output logic zero
);

// Local variable for type-safe enum handling
ALU_control_signals ALUcontrol_enum;

always_comb begin

// Default assignments to prevent latch infer cases and provide a known state
    result = 'x;
    zero = 1'b0;

// Cast the raw input signal to the enum type for the case statement
    ALUcontrol_enum = ALU_control_signals'(ALUcontrol);

case (ALUcontrol_enum)
// RV32i uses 2's complement arithmetic, so ADD and SUB hardware logic
// is the same for both signed and unsigned interpretations.
ALU_ADD : result = a + b; 
ALU_SUB : result = a - b; 
ALU_AND : result = a & b; 
ALU_OR  : result = a | b;
ALU_XOR : result = a ^ b;
// signed numbers comparison - here type casting is essential
ALU_SLT : result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0; 
ALU_SLTU: result = (a < b) ? 32'd1 : 32'd0;
// "L"ess than "L"ess than operators are used for "L"eft "L"ogical
ALU_SLL : result = a << b[4:0]; //second operand = (2^n) power is stored in last 5 bits only
ALU_SRL : result = a >> b[4:0]; 
ALU_SRA: result = $signed(a) >>> b[4:0]; //arithmetic right shift operator `>>>`
// BEQ and BNE comparisons are the same for signed and unsigned numbers.
ALU_BEQ: result = ( a == b )? 32'd1 : 32'd0;
ALU_BNE: result = ( a != b )? 32'd1 : 32'd0;
ALU_BGEU: result = ( a >= b )? 32'd1 : 32'd0;
ALU_BLTU: result = ( a < b )? 32'd1 : 32'd0;
// Using signed is mandatory now
ALU_BGE: result = ( $signed(a) >= $signed(b) )? 32'd1 : 32'd0;
ALU_BLT: result = ( $signed(a) < $signed(b) )? 32'd1 : 32'd0;


// default case is necessary here because unlike always_ff it can't retain its previous value
default : result = 'x; //using x for unhandled cases 
endcase
 
// Zero flag assignment
zero = (result == '0);

end

endmodule







