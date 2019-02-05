`define DELAY 10

module mips32_testbench ();

	reg clk;
	wire[31:0] result;
	mips32_single_cycle io(clk, result);

	initial begin
		clk = 1;
		#185;
		$finish();
	end

	always begin
		clk = ~clk;
		#`DELAY;
	end
endmodule