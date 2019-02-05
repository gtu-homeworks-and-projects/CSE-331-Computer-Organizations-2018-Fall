module shamtExtend(out, shamt);
	input [4:0] shamt;
	output [31:0] out;
	
	buf (out[31], 1'b0);
	buf (out[30], 1'b0);
	buf (out[29], 1'b0);
	buf (out[28], 1'b0);
	buf (out[27], 1'b0);
	buf (out[26], 1'b0);
	buf (out[25], 1'b0);
	buf (out[24], 1'b0);
	buf (out[23], 1'b0);
	buf (out[22], 1'b0);
	buf (out[21], 1'b0);
	buf (out[20], 1'b0);
	buf (out[19], 1'b0);
	buf (out[18], 1'b0);
	buf (out[17], 1'b0);
	buf (out[16], 1'b0);
	buf (out[15], 1'b0);
	buf (out[14], 1'b0);
	buf (out[13], 1'b0);
	buf (out[12], 1'b0);
	buf (out[11], 1'b0);
	buf (out[10], 1'b0);
	buf (out[9], 1'b0);
	buf (out[8], 1'b0);
	buf (out[7], 1'b0);
	buf (out[6], 1'b0);
	buf (out[5], 1'b0);
	buf (out[4], shamt[4]);
	buf (out[3], shamt[3]);
	buf (out[2], shamt[2]);
	buf (out[1], shamt[1]);
	buf (out[0], shamt[0]);
	
endmodule