/* Testbench for 4-bit ALU */

`timescale 1ns/1ps

module tb_alu;

reg [3:0] A, B;
reg CIN, OP1, OP0;

wire [3:0] S;
wire OF, CF;

alu uut (
    .A(A), .B(B),
    .CIN(CIN), .OP1(OP1), .OP0(OP0),
    .S(S), .OF(OF), .CF(CF)
);

initial begin
    $dumpfile("tb_alu.vcd");
    $dumpvars(0, tb_alu);

    $display("OP1\tOP0\tA\tB\tCIN\tS");
    $monitor("%b\t%b\t%b\t%b\t%b\t%b", OP1, OP0, A, B, CIN, S);

    /* Addition */
    OP0 = 0; OP1 = 0;
    A = 4'b0011; B = 4'b0101; CIN = 0;
    #10;

    OP0 = 0; OP1 = 0;
    A = 4'b1111; B = 4'b0001; CIN = 1;
    #10

    /* Subtraction */
    A = 4'b1000; B = 4'b0010; CIN = 0; OP1 = 0; OP0 = 1;
    #10;

    /* Increment */
    A = 4'b1111; OP1 = 1; OP0 = 0;
    #10;

    /* Pass-through */ 
    A = 4'b1010; OP1 = 1; OP0 = 1;
    #10;

    $finish;

end
    
endmodule