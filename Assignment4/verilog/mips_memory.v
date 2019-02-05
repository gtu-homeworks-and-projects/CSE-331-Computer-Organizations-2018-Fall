module mips_memory(read_data, write_data, address, memRead, memWrt, clk);
	input memRead, memWrt, clk;
	input[31:0] address, write_data;
	output [31:0] read_data;
	
	reg [31:0] memory [31:0];	
	initial begin
		$readmemh(".//main.mem", memory);
	end
	
	assign read_data = memRead ? memory[address] : 32'bx;
	
	always @(posedge clk) begin
		if (memWrt)
			memory[address] = write_data;
	end
	
	always @(posedge clk) begin
		if (memWrt)
			$writememh(".//main.mem", memory);
	end
	
	
endmodule