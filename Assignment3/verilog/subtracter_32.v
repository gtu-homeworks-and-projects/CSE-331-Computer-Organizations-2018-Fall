module subtracter_32 (out, in1, in2);
input [31:0] in1, in2;
output [31:0] out;
wire [31:0] a;
wire carry;

not_32 NOT(a, in2);
full_adder_32 FA(out, carry, in1, a, 32'b1);

endmodule
