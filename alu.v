/* Implementation of 4-bit ALU that can perform the following operations:
    1. Addition
    2. Subtraction
    3. Increment
    4. Pass-through/AND
 */

`include "four_by_one_mux.v"
`include "ripple_carry_adder.v"

// Inputs and Outputs of the main circuit
module alu (
    input wire [3:0] A, input wire [3:0] B,
    input wire CIN, input wire OP1, input wire OP0,
    output wire [3:0] S, output wire OF, output wire CF
);

// Ports...
wire Cin, Cout, first_mux_output, second_mux_output,
        third_mux_output, fourth_mux_output,
        fifth_mux_output, sixth_mux_output,
        seventh_mux_output, eighth_mux_output,
        Cin_msb;

// Instantiate muxes
mux cin_mux (
    .I0(CIN), .I1(1'b0), .I2(1'b1), .I3(1'b0),
    .S0(OP0), .S1(OP1),
    .Y(Cin)
);// Cin mux on the right side

// Muxes for input A
mux first_mux (
    .I0(A[0]), .I1(1'b0), .I2(1'b1), .I3(~A[0]),
    .S0(OP0), .S1(OP1),
    .Y(first_mux_output)
);

mux second_mux (
    .I0(A[1]), .I1(1'b0), .I2(1'b1), .I3(~A[1]),
    .S0(OP0), .S1(OP1),
    .Y(second_mux_output)
);

mux third_mux (
    .I0(A[2]), .I1(1'b0), .I2(1'b1), .I3(~A[2]),
    .S0(OP0), .S1(OP1),
    .Y(third_mux_output)
);

mux fourth_mux (
    .I0(A[3]), .I1(1'b0), .I2(1'b1), .I3(~A[3]),
    .S0(OP0), .S1(OP1),
    .Y(fourth_mux_output)
);

// Muxes for input B
mux fifth_mux (
    .I0(B[0]), .I1(1'b0), .I2(1'b1), .I3(~B[0]),
    .S0(OP0), .S1(OP1),
    .Y(fifth_mux_output)
);

mux sixth_mux (
    .I0(B[1]), .I1(1'b0), .I2(1'b1), .I3(~B[1]),
    .S0(OP0), .S1(OP1),
    .Y(sixth_mux_output)
);

mux seventh_mux (
    .I0(B[2]), .I1(1'b0), .I2(1'b1), .I3(~B[2]),
    .S0(OP0), .S1(OP1),
    .Y(seventh_mux_output)
);

mux eighth_mux (
    .I0(B[3]), .I1(1'b0), .I2(1'b1), .I3(~B[3]),
    .S0(OP0), .S1(OP1),
    .Y(eighth_mux_output)
); // Muxes finished

// Instantiate Ripple Carry Adder
ripple_carry_adder main_adder (
    .A({fourth_mux_output, third_mux_output, second_mux_output, first_mux_output}),
    .B({eighth_mux_output, seventh_mux_output, sixth_mux_output, fifth_mux_output}),
    .Cin(Cin),
    .S(S), .Cout(Cout), .Cin_msb(Cin_msb)
);

// Check for overflow
assign CF = Cout;
assign OF = Cout ^ Cin_msb;

endmodule