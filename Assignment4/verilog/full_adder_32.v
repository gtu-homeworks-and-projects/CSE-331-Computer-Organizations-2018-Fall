module full_adder_32 (out, carry_out, in1, in2, carry_in);
input [31:0] in1, in2;
input carry_in;
output carry_out;
output [31:0] out;
wire [30:0] carry;

full_adder FA1(out[0], carry[0], in1[0], in2[0], carry_in),
	FA2(out[1], carry[1], in1[1], in2[1], carry[0]),
	FA3(out[2], carry[2], in1[2], in2[2], carry[1]),
	FA4(out[3], carry[3], in1[3], in2[3], carry[2]),
	FA5(out[4], carry[4], in1[4], in2[4], carry[3]),
	FA6(out[5], carry[5], in1[5], in2[5], carry[4]),
	FA7(out[6], carry[6], in1[6], in2[6], carry[5]),
	FA8(out[7], carry[7], in1[7], in2[7], carry[6]),
	FA9(out[8], carry[8], in1[8], in2[8], carry[7]),
	FA10(out[9], carry[9], in1[9], in2[9], carry[8]),
	FA11(out[10], carry[10], in1[10], in2[10], carry[9]),
	FA12(out[11], carry[11], in1[11], in2[11], carry[10]),
	FA13(out[12], carry[12], in1[12], in2[12], carry[11]),
	FA14(out[13], carry[13], in1[13], in2[13], carry[12]),
	FA15(out[14], carry[14], in1[14], in2[14], carry[13]),
	FA16(out[15], carry[15], in1[15], in2[15], carry[14]),
	FA17(out[16], carry[16], in1[16], in2[16], carry[15]),
	FA18(out[17], carry[17], in1[17], in2[17], carry[16]),
	FA19(out[18], carry[18], in1[18], in2[18], carry[17]),
	FA20(out[19], carry[19], in1[19], in2[19], carry[18]),
	FA21(out[20], carry[20], in1[20], in2[20], carry[19]),
	FA22(out[21], carry[21], in1[21], in2[21], carry[20]),
	FA23(out[22], carry[22], in1[22], in2[22], carry[21]),
	FA24(out[23], carry[23], in1[23], in2[23], carry[22]),
	FA25(out[24], carry[24], in1[24], in2[24], carry[23]),
	FA26(out[25], carry[25], in1[25], in2[25], carry[24]),
	FA27(out[26], carry[26], in1[26], in2[26], carry[25]),
	FA28(out[27], carry[27], in1[27], in2[27], carry[26]),
	FA29(out[28], carry[28], in1[28], in2[28], carry[27]),
	FA30(out[29], carry[29], in1[29], in2[29], carry[28]),
	FA31(out[30], carry[30], in1[30], in2[30], carry[29]),
	FA32(out[31], carry_out, in1[31], in2[31], carry[30]);
	
endmodule