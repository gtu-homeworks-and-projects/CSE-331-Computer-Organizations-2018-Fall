module full_adder(out, carry_out, in1, in2, carry_in);
input in1, in2, carry_in;
output out, carry_out;
wire sum1, c1, c2;

half_adder first_sum(sum1, c1, in1, in2);
half_adder second_sum(out, c2, sum1, carry_in);
or carry(carry_out, c1, c2);

endmodule