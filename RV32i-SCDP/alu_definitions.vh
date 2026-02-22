// ALU DEFINITIONS
`define ADD  		3'b000  	// Addition (add, addi)
`define OR   		3'b001  	// Subtraction (sub)
`define SUB  		3'b010		// Bitwise OR (or, ori)

// OPCODE ENCODINGS FOR MAIN DECODER
`define R_TYPE 	        7'b0110011  	// R-type
`define LW_TYPE     	7'b0000011  	// LW-type (load word)
`define SW_TYPE     	7'b0100011  	// SW-type (store word)
`define SB_TYPE     	7'b1100011  	// SB-type (branch, e.g., BEQ)
`define ADDI   	    	7'b0010011  	// I-type (ADDI)

// IMMEDIATE SRC ENCODING
`define I 		2'b00 
`define S 		2'b01
`define B 		2'b10

           
