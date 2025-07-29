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

---

✅ Features
Modular, reusable Verilog code

Clean and simple testbenches

Fully synthesizable UART core

Open-source and simulator-friendly

Easily extendable for FIFO buffers or parity logic

👤 Author
Developed by George Jan

---

## ▶️ Simulation Instructions

This project can be simulated using tools like **ModelSim**, **Icarus Verilog**, or **Vivado**.

### Example using Icarus Verilog:
```bash
# Compile the testbench with all source files
iverilog -o uart_tb tb/UART_tb.v src/*.v

# Run simulation
vvp uart_tb

---
