module alu32(R, A, B, S);
input [31:0] A, B;
input [2:0] S;
output [31:0] R;
wire [31:0] AND, OR, SUM, XOR, SUB, RSHIFT, LSHIFT, NOR;
wire carrySum;

and_32 andOP(AND, A, B);
or_32 orOP(OR, A, B);
full_adder_32 sumOP(SUM, carrySum, A, B, 1'b0);
xor_32 xorOP(XOR, A, B);
subtracter_32 subOP(SUB, A, B);
shifter_32 rShiftOP(RSHIFT, A, B[4:0], 1'b0, 1'b1);
shifter_32 lShiftOP(LSHIFT, A, B[4:0], 1'b1, 1'b1);
nor_32 norOP(NOR, A, B);

mux_8x1_32 ALU(R, AND, OR, SUM, XOR, SUB, RSHIFT, LSHIFT, NOR, S);

endmodule
