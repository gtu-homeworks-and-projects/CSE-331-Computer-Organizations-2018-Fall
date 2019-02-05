module mips32_single_cycle(clk, result);
	input clk;
	output [31:0] result;
	wire [31:0] instruction, extendedAddress, alu_data, alu_result, read_address;
	wire branch, jump, regDst, regWrt, aluSrc, memRead, memWrt, memToReg, shiftSrc, msbMux;
	
	next_PC PC_Counter(read_address, read_address, instruction[25:0], extendedAddress, result, branch, jump, clk);
	
	inst_mem instructionMemory(instruction, read_address, clk);
	
	wire [2:0] aluOP;
 	control_unit control(aluOP, branch, jump, regDst, regWrt, aluSrc, memRead, memWrt, memToReg, shiftSrc, msbMux, instruction[5:0], instruction[31:26]);
	
	wire [31:0] read_data1, read_data2;
	wire [4:0] writeReg;
	mux_2x1_5 writeRegDestination(writeReg, instruction[20:16], instruction[15:11], regDst);
	mips_registers regisers(read_data1, read_data2, result, instruction[25:21], instruction[20:16], writeReg, regWrt, clk);

	immSignExtend immExtending(extendedAddress, instruction[15:0]);
	
	wire [31:0] aluSourceVal;
	mux_2x1_32 AluSourceMux(aluSourceVal, read_data2, extendedAddress, aluSrc);
	wire [31:0] extShamt;
	shamtExtend shamtExtending(extShamt, instruction[10:6]);
	wire [31:0] secondInput;
	mux_2x1_32 aluSrcOrShamt(secondInput, aluSourceVal, extShamt, shiftSrc);

	alu32 alu(alu_data, read_data1, secondInput, aluOP);

	wire [31:0] extMSB;
	msbExtend msbExtending(extMSB, alu_data[31]);
	mux_2x1_32 aluOrSLTU(alu_result, alu_data, extMSB, msbMux);
	
	wire [31:0] read_data;
	mips_memory main_memory(read_data, read_data2, alu_result, memRead, memWrt, clk);
	
	mux_2x1_32 memToRegMux(result, alu_result, read_data, memToReg);

endmodule