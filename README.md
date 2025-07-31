# 📡 my-verilog-UART

This project implements a **Universal Asynchronous Receiver/Transmitter (UART)** communication system using Verilog HDL. It includes modular source code, testbenches for simulation, and is suitable for FPGA synthesis and digital system integration.

---

## 🧠 Description

UART (Universal Asynchronous Receiver/Transmitter) is a widely used protocol for asynchronous serial communication. This Verilog project provides a modular and synthesizable UART design, consisting of:

- `BaudRateGenerator.v`: Generates timing ticks based on the desired baud rate.
- `RX.v`: Receives serial data and converts it to parallel form.
- `TX.v`: Transmits parallel data as a serial bitstream.
- `UART.v`: Top-level integration module that combines TX, RX, and the baud generator.

Each module has a dedicated testbench for functional verification.

---

✅ Features
Modular, reusable Verilog code

Clean and simple testbenches

Fully synthesizable UART core

Open-source and simulator-friendly

Easily extendable for FIFO buffers or parity logic

---
👤 Author
Developed by George Jan

---

## ▶️ Simulation Instructions

This project is designed to be simulated using ModelSim.

💻 Steps: Open ModelSim

Create a new project

Add all Verilog source files from the src/ folder

Add the relevant testbench from tb/

Compile all files

Run the simulation

(Optional) Use Add Wave and view signals

## 📁 Project Structure

my-verilog-UART/
├── src/
│ ├── BaudRateGenerator.v # Baud rate tick generator
│ ├── RX.v # UART receiver
│ ├── TX.v # UART transmitter
│ └── UART.v # Integrated UART module
└── tb/
├── BaudRateGenerator_tb.v # Testbench for BaudRateGenerator
├── TX_tb.v # Testbench for TX
└── UART_tb.v # Testbench for UART
