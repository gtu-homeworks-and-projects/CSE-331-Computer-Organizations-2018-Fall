module mux_4x1_3 (out, in1, in2, in3, in4, select);
	input [2:0] in1, in2, in3, in4;
	input [1:0] select;
	output [2:0] out;

	mux_4x1 mux0(out[0], in1[0], in2[0], in3[0], in4[0], select),
		mux1(out[1], in1[1], in2[1], in3[1], in4[1], select),
		mux2(out[2], in1[2], in2[2], in3[2], in4[2], select);

endmodule