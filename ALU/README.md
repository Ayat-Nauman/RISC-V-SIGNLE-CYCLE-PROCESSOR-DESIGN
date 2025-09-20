# ALU (Arithmetic Logic Unit) – RV32I

## Overview

This project implements a 32-bit **ALU** for the RV32I instruction set using System Verilog.
The ALU takes two 32-bit inputs (`a` and `b`), a 6-bit control signal, and produces a 32-bit result along with a `zero` flag.
Supported operations include arithmetic, logic, shifts, and branch comparisons.

## Features

* Two 32-bit inputs (`a`, `b`)
* 6-bit ALU control input
* 32-bit result output
* `zero` flag output (set when result = 0)
* Supports ADD, SUB, AND, OR, XOR, SLT, SLTU, SLL, SRL, SRA, and branch comparisons (BEQ, BNE, BGE, BLT, BGEU, BLTU).

# RTL File
The RTL of this DUT comprises of two files:
1. ALU.sv
2. ALU_pkg.sv
* The package file contain enumaration of all the control signals needed in the RTL and test bench files. This improves the readabilty of code.
## Testbench

The testbench applies multiple test vectors to verify each ALU operation.
Waveforms confirm correctness of results and zero flag behavior.
<img width="1358" height="574" alt="ALU Waveform" src="https://github.com/user-attachments/assets/3815ca18-0b16-4fc8-91fe-cd4d9324a7b1" />

## Results Table

| Operation | a  | b  | ALUControl | Result | Zero |
| --------- | -- | -- | ---------- | ------ | ---- |
| ADD       | 1  | 1  | ALU\_ADD   | 2      | 0    |
| SUB       | 1  | 1  | ALU\_SUB   | 0      | 1    |
| AND       | 0  | 1  | ALU\_AND   | 0      | 1    |
| OR        | 0  | 1  | ALU\_OR    | 1      | 0    |
| XOR       | 1  | 1  | ALU\_XOR   | 0      | 1    |
| SLT       | -1 | 2  | ALU\_SLT   | 1      | 0    |
| SLTU      | 1  | 2  | ALU\_SLTU  | 1      | 0    |
| SLL       | 1  | 2  | ALU\_SLL   | 4      | 0    |
| SRL       | 1  | 3  | ALU\_SRL   | 0      | 1    |
| SRA       | -1 | 3  | ALU\_SRA   | -1     | 0    |
| BEQ       | 50 | 50 | ALU\_BEQ   | 1      | 0    |
| BNE       | 20 | 10 | ALU\_BNE   | 1      | 0    |
| BGE       | -2 | -1 | ALU\_BGE   | 0      | 1    |
| BLT       | -1 | -2 | ALU\_BLT   | 0      | 1    |
| BGEU      | 15 | 10 | ALU\_BGEU  | 1      | 0    |
| BLTU      | 0  | 1  | ALU\_BLTU  | 1      | 0    |

---
# Quartus RTL Diagram
![ALU_RTL_DIAGRAM](https://github.com/user-attachments/assets/883b1058-cd93-4a8f-913c-c641369ba823)

---

