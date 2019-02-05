module immSignExtend(out, imm);
	input [15:0] imm;
	output [31:0] out;
	
	buf (out[31], imm[15]);
	buf (out[30], imm[15]);
	buf (out[29], imm[15]);
	buf (out[28], imm[15]);
	buf (out[27], imm[15]);
	buf (out[26], imm[15]);
	buf (out[25], imm[15]);
	buf (out[24], imm[15]);
	buf (out[23], imm[15]);
	buf (out[22], imm[15]);
	buf (out[21], imm[15]);
	buf (out[20], imm[15]);
	buf (out[19], imm[15]);
	buf (out[18], imm[15]);
	buf (out[17], imm[15]);
	buf (out[16], imm[15]);
	buf (out[15], imm[15]);
	buf (out[14], imm[14]);
	buf (out[13], imm[13]);
	buf (out[12], imm[12]);
	buf (out[11], imm[11]);
	buf (out[10], imm[10]);
	buf (out[9], imm[9]);
	buf (out[8], imm[8]);
	buf (out[7], imm[7]);
	buf (out[6], imm[6]);
	buf (out[5], imm[5]);
	buf (out[4], imm[4]);
	buf (out[3], imm[3]);
	buf (out[2], imm[2]);
	buf (out[1], imm[1]);
	buf (out[0], imm[0]);
	
endmodule