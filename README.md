# 🧠 32-RAM Verification using SV Testbench

This repo contains a verification environment for a custom 32RAM design using **SystemVerilog** in **QuestaSim**. The goal of this project was to validate the functionality of a synchronous RAM using a modular and reusable testbench architecture.

## 📌 Highlights

- 🛠 **Design**: A parameterized RAM module with read/write enable, address decoding, and synchronous reset.
- ✅ **Verification**: Testbench developed in SystemVerilog with constrained-random stimulus and functional coverage.
- 📊 **Outputs**: Waveform analysis and code/functional coverage reports.
- 🧪 **Test Strategy**: Includes directed and random tests for edge cases such as:
  - Read-before-write
  - Write enable glitches
  - Out-of-bound addresses
  - Reset behavior
<br>

## 📌 RAM Architecture 
<br>

<img src="https://github.com/user-attachments/assets/1e65a865-a533-4c28-900f-ba894d421670" width="400" height="300">

<br>

## 📌 SV Architecture 

<img src="https://github.com/user-attachments/assets/0517f218-3bdf-4bf1-92ab-4f8feccb98b2" width="400" height="300">

<br>

## 📌 Outputs and Coverage Reports

### Output Terminal Observations:

![Output](https://github.com/user-attachments/assets/02023731-c9a2-4940-ac59-f1329795dfa8)

<br>

### Questa Coverage Report:

![Coverage Report](https://github.com/user-attachments/assets/4e144eff-3be7-4bbd-b1c0-818901b35b33)

<br>

![Coverage Report 2](https://github.com/user-attachments/assets/5e03d06f-08c7-4023-93d4-a6242c6e5372)

<br>

##









