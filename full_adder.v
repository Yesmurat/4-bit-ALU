/* Implementation of Full Adder in Verilog */
module full_adder (
    input wire A, input wire B, input wire CIN,
    output wire S, output wire COUT
);

wire X, Y;

assign X = A ^ B;
assign Y = A & B;

assign S = X ^ CIN;
assign COUT = Y | (X & CIN);
    
endmodule