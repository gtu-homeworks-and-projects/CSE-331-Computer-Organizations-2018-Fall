module next_PC(readAddress, oldPC, targetAddress, extendedAddress, equal, branch, jump, clk);
	input branch, jump, clk;
	input[25:0] targetAddress;
	input[31:0] extendedAddress, oldPC, equal;
	reg [31:0] old_pc_reg;
	output reg [31:0] readAddress;
	
	always @(negedge clk) begin
		old_pc_reg = -1;
		if (!(oldPC[0] === 1'bx))
			old_pc_reg = oldPC;
	end
	
	always @(negedge clk) begin
		readAddress = old_pc_reg + 1;
		if (branch == 1'b1) begin
			if (equal == 0)
				readAddress = readAddress + extendedAddress;
		end
		else begin
			if (jump == 1'b1)
				readAddress = {readAddress[31:26], targetAddress};
		end
		$display("PC=%32b, oldPC = %32b", readAddress, oldPC);
	end
	
endmodule