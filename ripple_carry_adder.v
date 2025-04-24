/* Implementation of Ripple Carry Adder in Verilog */
`include "full_adder.v"

module ripple_carry_adder (
    input wire [3:0] A, input wire [3:0] B, input wire Cin,
    output wire [3:0] S, output wire Cout, output wire Cin_msb
);

wire Cout0, Cout1, Cout2;

full_adder bit_zero(
    .A(A[0]),
    .B(B[0]),
    .CIN(Cin),
    .S(S[0]),
    .COUT(Cout0)
);

full_adder bit_one(
    .A(A[1]),
    .B(B[1]),
    .CIN(Cout0),
    .S(S[1]),
    .COUT(Cout1)
);

full_adder bit_two(
    .A(A[2]),
    .B(B[2]),
    .CIN(Cout1),
    .S(S[2]),
    .COUT(Cout2)
);

full_adder bit_three(
    .A(A[3]),
    .B(B[3]),
    .CIN(Cout2),
    .S(S[3]),
    .COUT(Cout)
);

assign Cin_msb = Cout2;
    
endmodule