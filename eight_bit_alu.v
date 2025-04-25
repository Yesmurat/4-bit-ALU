/* Implementation of 8-bit ALU using two 4-bit ALUs */

/*
OP0 OP1 OP2 Operation
 0   0   0  Addition
 0   0   1  Subtraction
 0   1   0  AND
 0   1   1  OR
 1   0   0  XOR
 1   0   1  NOT
 1   1   0  Shift Left
 1   1   1  Shift Right
*/

module eight_bit_alu (
    input wire [7:0] A, input wire [7:0] B, input wire CIN, // Inputs
    input wire [2:0] OP, // Operation Selector
    output wire [7:0] S, output wire COUT
);

reg [8:0] temp; // 9-bit temporary for sum/diff

// Simulate muxes using "case ... endcase" operator
always @(*) begin
    case (OP)
        3'b000:// Addition
        begin
            temp = {1'b0, A} + {1'b0, B} + CIN;
            S = temp[7:0];
            COUT = temp[8];
        end

        3'b001:// Subtraction
        begin
            temp = {1'b0, A} - {1'b0, B} - CIN;
            S = temp[7:0];
            COUT = temp[8];
        end

        3'b010:// AND
        begin
            S = A & B;
            COUT = 0;
        end

        3'b011:// OR
        begin
            S = A | B;
            COUT = 0;
        end

        3'b100:// XOR
        begin
            S = A ^ B;
            COUT = 0
        end

        3'b101:// NOT
        begin
            S = ~A;
            COUT = 0;
        end

        3'b110:// Shift Left
        begin
            S = A << 1;
            COUT = 0;
        end

        3'b111:// Shift Right
        begin
            S = A >> 1;
            COUT = 0
        end

        default: begin
            S = 8'b0;
            COUT = 0;
        end
    endcase
end
    
endmodule