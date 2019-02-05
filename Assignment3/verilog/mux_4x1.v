module mux_4x1 (out, in1, in2, in3, in4, select);
input in1, in2, in3, in4;
input [1:0] select;
output out;
wire a, b;

mux_2x1 mux1(a, in1, in2, select[0]);
mux_2x1 mux2(b, in3, in4, select[0]);
mux_2x1 mux3(out, a, b, select[1]);

endmodule