module half_adder(out, carry_out, in1, in2);
input in1, in2;
output out, carry_out;

xor sum(out, in1, in2);
and carry(carry_out, in1, in2);

endmodule