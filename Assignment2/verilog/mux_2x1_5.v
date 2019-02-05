module mux_2x1_5(out, in1, in2, select);
input [4:0] in1, in2;
input select;
output [4:0] out;

mux_2x1 mux5(out[4], in1[4], in2[4], select),
	mux4(out[3], in1[3], in2[3], select),
	mux3(out[2], in1[2], in2[2], select),
	mux2(out[1], in1[1], in2[1], select),
	mux1(out[0], in1[0], in2[0], select);

endmodule