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

### `Fourth Task - Control Unit` :open_file_folder:
- Description and connection of an Control Unit with command signals to the ULA (ULAControl and ULASrc) and register bank (RegDst and RegWrite);
- 32-bit Instruction Memory to execute the stored program;
- Description and connection of an 8-bit Program Counter;
- 1-bit Adder to increment the Program Counter.

### `Fifth Task - ROM Memory (Instructions) and RAM Memory (Data)` :open_file_folder:
- Description and connection of a RAM Memory for writing and reading data, operating at the fast clock of 50MHz;
- Frequency divider to generate the slow clock, implemented to be 5x slower (10MHz) than the fast one;
- 8-bit Adder to branch program counter execution;
- Addition of high-speed clock dependency in ROM Memory (instructions).

### `Sixth Task - IN and OUT Parallel` :open_file_folder:
- Inclusion of a parallel data input option that allows external data to be taken instead of RAM Memory when the address is 8'hff;
- Inclusion of a parallel data output operating at slow clock, which allows data coming from the registers to be released directly to the output if the address is 8'hff.
