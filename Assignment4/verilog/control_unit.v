module control_unit(aluOP, branch, jump, regDst, regWrt, aluSrc, memRead, memWrt, memToReg, shiftSrc, msbMux, function_code, opcode);
	input [5:0] function_code, opcode;
	output [2:0] aluOP;
	output branch, jump, regDst, regWrt, aluSrc, memRead, memWrt, memToReg, shiftSrc, msbMux;

	wire notO3;
	not (notO3, opcode[3]);
	and br(branch, notO3, opcode[2]);

	wire notO5;
	not (notO5, opcode[5]);
	and (jump, notO5, opcode[1]);

	wire r1;
	or (r1, opcode[0], opcode[2]);
	not(regDst, r1);

	wire notO1, notO2, r2, r3, r4;
	not (notO1, opcode[1]);
	not (notO2, opcode[2]);
	and (r2, notO1, notO2);
	and (r3, notO3, opcode[0]);
	and (r4, notO5, opcode[3]);
	or (regWrt, r2, r3, r4);

	or (aluSrc, opcode[3], opcode[5]);

	and (memRead, notO3, opcode[0]);

	and (memWrt, opcode[3], opcode[1]);

	buf (memToReg, opcode[1]);

	wire[2:0] funcAluOp;
	ALU_Control aluCtrl(funcAluOp, function_code);
	wire[2:0] opcodeAlu;
	buf (opcodeAlu[2], 1'b0);
	not (opcodeAlu[1], opcode[2]);
	and (opcodeAlu[0], opcode[2], opcode[0]);
	wire[1:0] aluSelect;
	wire a1;
	and (a1, notO3, opcode[2]);
	or (aluSelect[1], opcode[1], a1);
	or (aluSelect[0], opcode[0], opcode[3]);
	mux_4x1_3 aluMux(aluOP, funcAluOp, opcodeAlu, 3'b100, 3'b010, aluSelect);
	
	wire f1, notF5;
	and (f1, notO3, notO2, notO1);
	not (notF5, function_code[5]);
	and (shiftSrc, f1, notF5);
	
	and (msbMux, f1, function_code[3]);

endmodule