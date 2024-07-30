# Memory Elements

This repository includes Verilog modules for RAM and ROM.

## RAM Module

The RAM (Random Access Memory) module allows both reading and writing of data. It is parameterized by width and depth to allow for flexible memory configurations.

### RAM Structure
![RAM](https://github.com/user-attachments/assets/40496e3f-f847-4af0-af6f-65f7be413b92)


## ROM Module

The ROM (Read-Only Memory) module is initialized with fixed data and only allows reading of that data. It is also parameterized by width and depth to accommodate various memory sizes.

### ROM Structure
![ROM](https://github.com/user-attachments/assets/161da489-9d6a-4ebe-a547-18ce0f5dee0a)

## FIFO MODULE
The FIFO (First In First Out) module allows both reading and writing of data on the basis of First In First Out principle . It is parameterized by width and depth to allow for flexible memory configurations.
### FIFO Structure
![FIFO](https://github.com/user-attachments/assets/c9513896-133a-4467-ac75-32bd2f8684d9)


## Usage

These modules can be used in digital design projects where memory elements are required. The RAM module is suitable for applications needing data storage with read/write capabilities, while the ROM module is ideal for storing fixed data that does not change during operation.One such example is using the RAM module to make the FIFO module

