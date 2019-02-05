module mips32(instruction, clk, result);
	input clk;
	input [31:0] instruction;
	output [31:0] result;

	wire [31:0] extShamt;
	and_32 shamtExtending(extShamt, instruction[10:6], 32'b1); 

	wire [31:0] read_data1, read_data2;
	mips_registers regisers(read_data1, read_data2, result, instruction[25:21], instruction[20:16], instruction[15:11], 1, clk);

	wire [31:0] secondInput;
	wire shamtControl;
	not s1(shamtControl, instruction[5]);
	mux_2x1_32 registerOrShifAmount(secondInput, read_data2, extShamt, shamtControl);

	wire [2:0] S;
	wire [31:0] R;
	control_unit AluControl(S, instruction[5:0]);
	alu32 alu(R, read_data1, secondInput, S);

	wire [31:0] extMSB;
	and_32 MSBExtending(extMSB, R[31], 32'b1); 
	mux_2x1_32 aluOrSLTU(result, R, extMSB, instruction[3]);

endmodule