# Parameterized 8-Bit Arithmetic Logic Unit (ALU) & Self-Checking Testbench

## Overview
This repository contains the RTL design and functional verification environment for a parameterizable **8-Bit Arithmetic Logic Unit (ALU)** implemented in Verilog HDL. The module executes 16 arithmetic and logical operations alongside comprehensive status flag generation.

## Key Features
- **Configurable Architecture:** Parameterized data bus width (`WIDTH`, default: 8 bits).
- **Status Flags Generation:**
  - `Zero`: Asserted when the computed result equals zero.
  - `Carry`: Tracks arithmetic carry-out and borrow states.
  - `Negative`: Detects signed MSB negative status.
  - `Overflow`: Identifies two's-complement arithmetic overflow conditions.
- **Automated Verification:** Includes a self-checking testbench with automated pass/fail assertion reporting.

## Opcode Table
| Opcode | Operation | Opcode | Operation |
| :---: | :--- | :---: | :--- |
| `0000` | Addition (`A + B`) | `0110` | Bitwise NAND |
| `0001` | Subtraction (`A - B`) | `0111` | Bitwise XNOR |
| `0010` | Bitwise AND | `1000` | Logical Shift Left (`A << 1`) |
| `0011` | Bitwise OR | `1001` | Logical Shift Right (`A >> 1`) |
| `0100` | Bitwise XOR | `1010` | Increment (`A + 1`) |
| `0101` | Bitwise NOR | `1011` | Decrement (`A - 1`) |

## Simulation Waveform
Functional verification was executed using Icarus Verilog on EDA Playground and analyzed via EPWave.

![ALU Simulation Waveform](alu_waveform.png)

## Verification Highlights
- **Directed Assertions:** Automated test vectors verified arithmetic correctness for Addition and Subtraction.
- **Flag Checks:** Verified boundary scenarios including zero result generation and bitwise manipulations.
- **Self-Checking Log:** Simulation terminates cleanly with automated PASS assertions reported directly to the log.

## How to Run Simulation
1. Load `alu_8bit.v` and `alu_tb.v` into [EDA Playground](https://www.edaplayground.com/).
2. Select **Icarus Verilog** as the simulator and check **Open EPWave after run**.
3. Click **Run** to execute self-checking verification and display waveforms.
