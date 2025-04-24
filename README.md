Implementation of 4-bit ALU in Verilog and Icarus Verilog compiler

Supported opertions: addition, subtraction, increment, passthrough
To compile: `iverilog -o tb_test_alu tb_alu.v alu.v`
To run: `vvp tb_alu_test`

The following files were written and used for the project: *four_by_one_mux.v*, *full_adder.v*, *ripple_carry_adder.v*, *alu.v*

*alu.v* is the file with actual Verilog code for 4-bit ALU
*tb_alu.v* is the testbench file for the ALU
*tb_alu_test.v* is the file to run
*tb_alu.vcd* is the waveform file
