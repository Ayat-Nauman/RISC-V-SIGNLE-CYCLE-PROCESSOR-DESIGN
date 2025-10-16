module imm_extender(
    input  [31:0] instruction,    // 32-bit instruction
    input  [1:0] ImmSrc,          // Immediate type selector (I, S, B)
    output reg [31:0] ImmOut      // Sign-extended immediate output
);

    // Parameter constants instead of enum
    parameter I_TYPE = 2'b00;
    parameter S_TYPE = 2'b01;
    parameter B_TYPE = 2'b10;

    always @(*) begin
        case(ImmSrc)
            I_TYPE: ImmOut = {{20{instruction[31]}}, instruction[31:20]};
            S_TYPE: ImmOut = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            B_TYPE: ImmOut = {{19{instruction[31]}}, instruction[31], instruction[7],
                              instruction[30:25], instruction[11:8], 1'b0};
            default: ImmOut = 32'b0;
        endcase
    end

endmodule

