# Single-Cycle_MIPS_Processor :computer:
This repository holds files related to the development of a Single-Cycle Processor developed during the Digital Systems Architecture course.
The project had changes so that instead of being executed in FPGA, both the execution and the analysis are done in simulation in the Quartus Prime Lite Edition, ModelSim software and EDA Playground.
The activities were done in an incremental way, with the objective of building each piece of hardware separately in order to understand how each component works.
One idea for another repository would be a verification environment to observe if the functional requirements of the projects are in fact completely achieved. For now, this idea is left to be implemented in the future.

## Stages

### `Initial Task - Instantiation` :open_file_folder:
- Description and connection a hexadecimal encoder to a 7-segment encoder to the key and button inputs;
- Output of the block as the 7-segment display itself and an LCD;
- Definition of clocks of 27 and 50 MHz.

### `Second Task - Register Bank` :open_file_folder:
- Description and connection a 8-bit register bank with two channels to write data and two channels to read data;
- The s0 register always has the value zero (MIPS architecture definition) to facilitate some operations;
- The s1-s7 registers are available for writing.

### `Third Task - Arithmetic Logic Unit` :open_file_folder:
- Description and connection of an 8-bit Arithmetic Logic Unit (ULA) with 5 operations (Add, Subtract, And, Or and Halt);
- Flag Z with the function to indicate when the output of the ULA is at zero;
- Description and connection of a 2:1 multiplexer.
