module nor_32(out, in1, in2);
input [31:0] in1, in2;
output [31:0] out;

nor nor1(out[31], in1[31], in2[31]),
	nor2(out[30], in1[30], in2[30]),
	nor3(out[29], in1[29], in2[29]),
	nor4(out[28], in1[28], in2[28]),
	nor5(out[27], in1[27], in2[27]),
	nor6(out[26], in1[26], in2[26]),
	nor7(out[25], in1[25], in2[25]),
	nor8(out[24], in1[24], in2[24]),
	nor9(out[23], in1[23], in2[23]),
	nor10(out[22], in1[22], in2[22]),
	nor11(out[21], in1[21], in2[21]),
	nor12(out[20], in1[20], in2[20]),
	nor13(out[19], in1[19], in2[19]),
	nor14(out[18], in1[18], in2[18]),
	nor15(out[17], in1[17], in2[17]),
	nor16(out[16], in1[16], in2[16]),
	nor17(out[15], in1[15], in2[15]),
	nor18(out[14], in1[14], in2[14]),
	nor19(out[13], in1[13], in2[13]),
	nor20(out[12], in1[12], in2[12]),
	nor21(out[11], in1[11], in2[11]),
	nor22(out[10], in1[10], in2[10]),
	nor23(out[9], in1[9], in2[9]),
	nor24(out[8], in1[8], in2[8]),
	nor25(out[7], in1[7], in2[7]),
	nor26(out[6], in1[6], in2[6]),
	nor27(out[5], in1[5], in2[5]),
	nor28(out[4], in1[4], in2[4]),
	nor29(out[3], in1[3], in2[3]),
	nor30(out[2], in1[2], in2[2]),
	nor31(out[1], in1[1], in2[1]),
	nor32(out[0], in1[0], in2[0]);
	
endmodule