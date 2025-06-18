# 🧠 RAM Verification using SystemVerilog Testbench

This repository contains a verification environment for a custom RAM design using **SystemVerilog**. The goal of this project was to validate the functionality of a synchronous RAM using a modular and reusable testbench architecture.

## 📌 Project Highlights

- 🛠 **Design**: A parameterized RAM module with read/write enable, address decoding, and synchronous reset.
- ✅ **Verification**: Testbench developed in SystemVerilog with constrained-random stimulus and functional coverage.
- 📊 **Outputs**: Waveform analysis and code/functional coverage reports.
- 🧪 **Test Strategy**: Includes directed and random tests for edge cases such as:
  - Read-before-write
  - Write enable glitches
  - Out-of-bound addresses
  - Reset behavior

## 📂 Repository Structure

```bash
ram-verification-sv/
├── docs/           # Documentation and diagrams
├── sim/            # Simulation scripts or Do files
├── src/            # RAM RTL design files
├── tb/             # SystemVerilog testbench files
├── results/        # Waveforms and reports
├── .gitignore
└── README.md
