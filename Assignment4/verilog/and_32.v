module and_32(out, in1, in2);
input [31:0] in1, in2;
output [31:0] out;

and and1(out[31], in1[31], in2[31]),
	and2(out[30], in1[30], in2[30]),
	and3(out[29], in1[29], in2[29]),
	and4(out[28], in1[28], in2[28]),
	and5(out[27], in1[27], in2[27]),
	and6(out[26], in1[26], in2[26]),
	and7(out[25], in1[25], in2[25]),
	and8(out[24], in1[24], in2[24]),
	and9(out[23], in1[23], in2[23]),
	and10(out[22], in1[22], in2[22]),
	and11(out[21], in1[21], in2[21]),
	and12(out[20], in1[20], in2[20]),
	and13(out[19], in1[19], in2[19]),
	and14(out[18], in1[18], in2[18]),
	and15(out[17], in1[17], in2[17]),
	and16(out[16], in1[16], in2[16]),
	and17(out[15], in1[15], in2[15]),
	and18(out[14], in1[14], in2[14]),
	and19(out[13], in1[13], in2[13]),
	and20(out[12], in1[12], in2[12]),
	and21(out[11], in1[11], in2[11]),
	and22(out[10], in1[10], in2[10]),
	and23(out[9], in1[9], in2[9]),
	and24(out[8], in1[8], in2[8]),
	and25(out[7], in1[7], in2[7]),
	and26(out[6], in1[6], in2[6]),
	and27(out[5], in1[5], in2[5]),
	and28(out[4], in1[4], in2[4]),
	and29(out[3], in1[3], in2[3]),
	and30(out[2], in1[2], in2[2]),
	and31(out[1], in1[1], in2[1]),
	and32(out[0], in1[0], in2[0]);
	
endmodule