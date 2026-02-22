# RISC-V RV32I Single-Cycle Processor

## Abstract
This repository contains the design and implementation of a **32-bit Single-Cycle RISC-V Processor** supporting the core **RV32I** instruction set. The project was developed using **Verilog HDL** and verified through a multi-tool chain including **ModelSim**, **Quartus Prime**, and **Xilinx Vivado**.

## Supported Instructions
The processor implements the following assembly instructions, verified via the Venus Simulator:
- **I-Type:** `ADDI`, `LW`
- **S-Type:** `SW`
- **R-Type:** `OR`
- **B-Type:** `BEQ`

## Architecture
The design follows a classic single-cycle datapath consisting of:
*   **Program Counter (PC):** 32-bit register for instruction sequencing.
*   **Control Unit:** Decodes Opcode/Funct fields to drive `ALUSrc`, `RegWrite`, and `MemWrite`.
*   **Register File:** 32 general-purpose registers (x0 hardwired to zero).
*   **ALU:** Performs arithmetic, subtraction, and bitwise logic operations.
*   **Immediate Extender:** Extract and sign-extend 12/13-bit fields to 32-bit.
*   **Data/Instruction Memory:** ROM for instructions and RAM for runtime data storage.

## Synthesis & FPGA Utilization
The design was synthesized to analyze hardware efficiency and physical mapping on FPGA fabric.

### 1. Synthesis Report
Detailed gate-level compilation and timing analysis.
![SR](https://github.com/user-attachments/assets/9fd3bbcd-2555-4211-9594-bf8bba533d75)


### 2. Resource Utilization Summary
Breakdown of Look-Up Tables (LUTs), Registers, and I/O usage.
![UR](https://github.com/user-attachments/assets/e4e25e7f-63ab-4d63-b363-8b3256aa80ba)

### 3. FPGA Chip Area Consumption
Vivado Device View showing logic clustering and Placement & Routing (P&R) in clock region X0Y1.
<img width="6660" height="4190" alt="RTL (2)" src="https://github.com/user-attachments/assets/745a227f-e379-4379-8c20-d2128feb1748" />

## Tools Used
- **Verilog HDL**: RTL Modeling
- **ModelSim**: Functional Waveform Verification
- **Quartus Prime**: Synthesis & RTL Analysis
- **Xilinx Vivado**: FPGA Implementation & Device Mapping
- **Venus Simulator**: Assembly to Hex Translation

## 🏁 Conclusion
The implementation successfully validates the RISC-V datapath and control logic. Waveform analysis confirms correct Read-After-Write (RAW) consistency, sign-extension, and conditional branching, achieving high hardware efficiency with a minimal resource footprint.
