module inst_mem(instruction, readAddress, clk);
	input[31:0] readAddress;
	input clk;
	output[31:0] instruction;
	
	reg [31:0] mem [31:0];
	initial begin 
		$readmemh(".//inst.mem", mem);
	end
	
	assign instruction = mem[readAddress];
	
	initial begin
		$monitor("opcode= %6b, rs = %5b, rt = %5b, rd = %5b, shamt = %5b, func = %6b, imm = %16b, target = %26b", instruction[31:26], instruction[25:21], instruction[20:16], instruction[15:11], instruction[10:6], instruction[5:0], instruction[15:0], instruction[25:0]);
	end
	
endmodule