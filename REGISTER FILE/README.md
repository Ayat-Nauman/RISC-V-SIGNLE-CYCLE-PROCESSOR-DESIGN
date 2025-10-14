# RISC-V Register File 

<img width="772" height="519" alt="Register File drawio" src="https://github.com/user-attachments/assets/37962ba5-37be-441e-9678-c4f7d2ff1fec" />

## Overview

This project implements a 32 × 32-bit **register file** for the RISC-V ISA.
It provides:

* **32 registers**, each 32 bits wide
* **Two read ports** (`rs1`, `rs2`)
* **One write port** (`rd`)
* Register **x0 is hardwired to zero** (writes are ignored, reads always return 0)

The implementation supports **synchronous writes** (on `posedge clk`) and **synchronous reads**.
For debugging in ModelSim, two registers (`x9`, `x3`) are exposed as wires.

---

## File Structure

* `regfile.v` – RTL implementation of the register file
* `regfile_tb.v` – Testbench to verify functionality
* `RegisterFile_output.png` – Simulation output from ModelSim (to be added)
* `RegisterFile.drawio.png` – Block diagram showing decoder + mux based design (to be added)
---

## Testbench Description

The testbench (`regfile_tb`) performs the following tests:

1. **Write to register x9, read x9 and x0**

   * Expected: `x9 = 1`, `x0 = 0`

2. **Read back register x9 and x3**

   * Expected: `x9 = 1`, `x3 = random initial value`

3. **Write to register x3, then read x3 and x9**

   * Expected: `x3 = 3`, `x9 = 1`

The clock has a period of 10 time units.

---

## Simulation Results

Below is the observed waveform (from ModelSim) matching the test sequence:

| Time | Action                   | rd   | rs1 | rs2 | writedata  | readdata1  | readdata2  |
| ---- | ------------------------ | ---- | --- | --- | ---------- | ---------- | ---------- |
| 10   | Write x9 = 1, Read x9/x0 | x9=9 | 9   | 0   | 0x00000001 | 0x00000001 | 0x00000000 |
| 20   | Read x9/x3               | –    | 9   | 3   | –          | 0x00000001 | random     |
| 30   | Write x3 = 3             | x3=3 | –   | –   | 0x00000003 | –          | –          |
| 40   | Read x3/x9               | –    | 3   | 9   | –          | 0x00000003 | 0x00000001 |

---
<img width="1358" height="574" alt="RegisterFile_output" src="https://github.com/user-attachments/assets/cefbc3ff-8050-4603-af6a-390fff114070" />

---
