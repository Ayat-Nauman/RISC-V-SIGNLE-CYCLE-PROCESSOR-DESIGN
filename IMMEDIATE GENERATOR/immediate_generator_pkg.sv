// Package for RV32I Instruction Formats
package immediate_generator_pkg;

    // Immediate Source Enumeration for RV32I
typedef enum logic [2:0] {
    I_TYPE = 3'b000,   // I-type: 12-bit signed immediate (loads, ALU-imm, JALR)
    S_TYPE = 3'b001,   // S-type: 12-bit signed immediate (stores)
    B_TYPE = 3'b010,   // B-type: 13-bit signed immediate (branches)
    U_TYPE = 3'b011,   // U-type: 20-bit immediate shifted left by 12 (LUI, AUIPC)
    J_TYPE = 3'b100,   // J-type: 21-bit signed immediate (JAL)
    Z_TYPE = 3'b101    // Z-type: 5-bit zero-extended immediate (CSR, shift amounts)
} ImmSrc_t;


endpackage
