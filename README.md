
# SPI Master-Slave Communication using Verilog HDL

## Project Overview

This project implements SPI (Serial Peripheral Interface) Master and Slave modules using Verilog HDL. The design demonstrates synchronous serial communication where the Master transmits data to the Slave using SPI protocol signals.

The communication is verified through simulation by transferring an 8-bit data value and confirming successful reception at the Slave.

---

## Objective

The objective of this project is to:

- Design SPI Master module
- Design SPI Slave module
- Implement synchronous serial communication
- Verify data transfer using simulation
- Understand SPI protocol operation

---

## Features

- SPI Master
- SPI Slave
- MOSI communication
- SCLK generation
- Slave Select control
- Shift register based data transfer
- Functional verification using simulation

---

## Design Description

The SPI communication system consists of two modules.

### SPI Master

The Master generates the serial clock, controls the Slave Select signal, and transmits data serially through MOSI.

### SPI Slave

The Slave receives serial data on MOSI and reconstructs the transmitted byte.

### Data Transfer

The Master and Slave communicate using standard SPI signals to achieve synchronous data transfer.

---

## Working Principle

1. The Master receives input data.
2. Slave Select signal becomes active.
3. Serial clock is generated.
4. Data is shifted through MOSI.
5. The Slave captures incoming bits.
6. The received byte is reconstructed.
7. The received data is verified through simulation.

---

## Simulation and Verification

The SPI design was verified using a Verilog testbench.

The following operations were tested:

- Reset operation
- SPI data transmission
- Slave Select operation
- Serial clock generation
- Data reception
- Loopback verification

Simulation confirmed successful data transfer between the Master and Slave.

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator

---

## Project Files

```
spi_master.v
spi_slave.v
tb_spi.v
spi_waveform.png
README.md
```

---

## Applications

- FPGA systems
- Embedded systems
- Sensor interfaces
- Memory devices
- Microcontroller communication

---

## Future Improvements

- Full duplex communication
- MISO implementation
- Multiple slave support
- Configurable SPI modes
- FPGA hardware implementation

---

## Author

Metla Pranathi

Bachelor of Technology
Electronics and Communication Engineering
