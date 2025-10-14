# PARAMETERISED RTL AND TB FOR MUX

This repository contains a parameterised RTL design and corresponding testbench for a multiplexer (MUX) module written in Verilog/SystemVerilog.

## Overview

- **mux.sv**: Parameterised MUX module that selects one bit from an input bus based on the select lines.
- **mux_tb.sv**: Parameterised testbench to verify the functionality of the MUX across different select signals.

## Features

- Parameterised input bus width (`INPUT_WIDTH`)
- Automatic calculation of select line width (`SELECT_LINE_WIDTH = $clog2(INPUT_WIDTH)`)
- Simple, scalable design suitable for varying input sizes
- Testbench iterates through all select lines and verifies correct output

## Usage

1. Compile both `mux.sv` and `mux_tb.sv` with your simulator.
2. Run the simulation and observe output changes based on the select input.
3. Modify the `INPUT_WIDTH` parameter in the testbench to test different bus widths.

## Simulation Waveform

<img width="1568" height="128" alt="image" src="https://github.com/user-attachments/assets/70bc2b52-1477-408c-8e78-b015bc15413f" />

## RTL Diagram
<img width="681" height="287" alt="image" src="https://github.com/user-attachments/assets/d3214c05-21fb-42fd-90e9-e54f8c7f8db5" />

---
