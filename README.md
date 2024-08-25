
# Verilog 4-bit Binary ALU Module

## Overview

This repository contains a Verilog module for a 4-bit Binary Arithmetic Logic Unit (ALU). The module is designed to perform various arithmetic and logic operations based on the input control signals. It can be synthesized onto an Integrated Circuit (IC) for digital logic applications.

## Features

- **Arithmetic Operations**: Supports both addition and subtraction.
- **Logic Operations**: Includes bitwise AND, OR, and NOT operations.
- **Configurable Operation Mode**: Controlled via a 2-bit selector input.
- **Carry-in and Carry-out Handling**: Manages carry-in and carry-out for arithmetic operations.

## Module Description

### Ports

- **Inputs:**
  - `A[3:0]`: 4-bit input operand A.
  - `B[3:0]`: 4-bit input operand B.
  - `sel[1:0]`: 2-bit selector input to choose the operation mode.
  - `M`: Mode control input (1 for subtraction, 0 for addition).
  - `Cin`: Carry-in input for arithmetic operations.

- **Outputs:**
  - `Sum[3:0]`: 4-bit result of the selected operation.
  - `Cout[3:0]`: 4-bit carry-out from the arithmetic operations.

### Operation Modes

1. **Addition/Subtraction (`sel = 2'b00`):**
   - **Addition**: When `M = 0`, performs binary addition of inputs A and B with carry-in `Cin`.
   - **Subtraction**: When `M = 1`, performs binary subtraction using two's complement arithmetic. The result is the 2's complement of the sum.

2. **Bitwise AND (`sel = 2'b01`):**
   - Computes the bitwise AND of inputs A and B.
   - No carry-out is generated for this operation.

3. **Bitwise OR (`sel = 2'b10`):**
   - Computes the bitwise OR of inputs A and B.
   - No carry-out is generated for this operation.

4. **Bitwise NOT (`sel = 2'b11`):**
   - Computes the bitwise NOT of input A.
   - The carry-out is set to the bitwise NOT of input B.

### Working with the ALU Module

When this Verilog code is synthesized onto an IC, the module operates as follows:

1. **Initialization:**
   - Set the input operands A and B, select the operation mode using `sel`, and configure the `M` and `Cin` values as needed.

2. **Operation Execution:**
   - Based on the `sel` input, the module performs the corresponding operation:
     - **Addition/Subtraction**: The module calculates the result of adding or subtracting the operands, taking into account the carry-in and mode control.
     - **Bitwise Operations**: Performs bitwise logical operations and provides results in the `Sum` output while setting `Cout` as zero for these operations.
     - **Bitwise NOT**: Inverts the bits of operand A and provides the result in the `Sum` output. The `Cout` output reflects the bitwise NOT of operand B.

3. **Output:**
   - The resulting `Sum` and `Cout` are available at the output pins, which can be used for further processing or interfacing with other digital components.

## How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/unique-verilog-alu.git
   ```

2. **Synthesize the Module:**
   - Use your preferred Verilog synthesis tools (e.g., Xilinx Vivado, Synopsys Design Compiler) to compile and synthesize the Verilog code.

3. **Implement on IC:**
   - Load the synthesized module onto your IC or FPGA board. Connect the input signals and observe the output based on the selected operations.


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
