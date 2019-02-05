module mux_2x1_32(out, in1, in2, select);
input [31:0] in1, in2;
input select;
output [31:0] out;

mux_2x1 mux32(out[31], in1[31], in2[31], select),
	mux31(out[30], in1[30], in2[30], select),
	mux30(out[29], in1[29], in2[29], select),
	mux29(out[28], in1[28], in2[28], select),
	mux28(out[27], in1[27], in2[27], select),
	mux27(out[26], in1[26], in2[26], select),
	mux26(out[25], in1[25], in2[25], select),
	mux25(out[24], in1[24], in2[24], select),
	mux24(out[23], in1[23], in2[23], select),
	mux23(out[22], in1[22], in2[22], select),
	mux22(out[21], in1[21], in2[21], select),
	mux21(out[20], in1[20], in2[20], select),
	mux20(out[19], in1[19], in2[19], select),
	mux19(out[18], in1[18], in2[18], select),
	mux18(out[17], in1[17], in2[17], select),
	mux17(out[16], in1[16], in2[16], select),
	mux16(out[15], in1[15], in2[15], select),
	mux15(out[14], in1[14], in2[14], select),
	mux14(out[13], in1[13], in2[13], select),
	mux13(out[12], in1[12], in2[12], select),
	mux12(out[11], in1[11], in2[11], select),
	mux11(out[10], in1[10], in2[10], select),
	mux10(out[9], in1[9], in2[9], select),
	mux9(out[8], in1[8], in2[8], select),
	mux8(out[7], in1[7], in2[7], select),
	mux7(out[6], in1[6], in2[6], select),
	mux6(out[5], in1[5], in2[5], select),
	mux5(out[4], in1[4], in2[4], select),
	mux4(out[3], in1[3], in2[3], select),
	mux3(out[2], in1[2], in2[2], select),
	mux2(out[1], in1[1], in2[1], select),
	mux1(out[0], in1[0], in2[0], select);

endmodule

