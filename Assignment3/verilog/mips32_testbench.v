`define DELAY 10

module mips32_testbench ();

reg [31:0] instruction_set;
reg clk;
wire[31:0] result;
mips32 io(instruction_set, clk, result);

initial begin
	clk = 0;
	instruction_set = 32'b00000010000100011001000000100000; // rs=$16 rt=$17 rd=$18 s2=s0+s1 					add 	s2 s0 s1
	#`DELAY;
	instruction_set = 32'b00000010010100011001100001000000; // rs=$16 rt=$17 rd=$19 s2=s0<<1 					sll 	s2 s0 1
	#`DELAY;
	instruction_set = 32'b00000010010100011010000001000010; // rs=$16 rt=$17 rd=$20 s2=s0>>1 					srl	s2 s0 1
	#`DELAY;
	instruction_set = 32'b00000010000100011010100000100001; // rs=$16 rt=$17 rd=$21 s2=s0+s1 					addu  s2 s0 s1
	#`DELAY;
	instruction_set = 32'b00000010000100010000000000100100; // rs=$16 rt=$17 rd=$0 s2=s0&s1 					and	s2 s0 s1
	#`DELAY;
	instruction_set = 32'b00000010000100010000100000100111; // rs=$16 rt=$17 rd=$1 s2= ~(s0|s1) 				nor	s2 s0 s1
	#`DELAY;
	instruction_set = 32'b00000010000100010001000000100101; // rs=$16 rt=$17 rd=$2 s2=s0|s1	 				or		s2 s0 s1
	#`DELAY;
	instruction_set = 32'b00000010000100010001100000101011; // rs=$16 rt=$17 rd=$3 s2=(s0<s1) ? 1 : 0		sltu	s2 s0 s1
	#`DELAY;
	instruction_set = 32'b00000010001100001010000000100010; // rs=$17 rt=$16 rd=$4 s2=s0-s1 					sub  	s2 s0 s1
	#`DELAY;
	instruction_set = 32'b00000010001100001010100000100011; // rs=$17 rt=$16 rd=$5 s2=s0-s1 					subu  s2 s0 s1
	#`DELAY;
	
	$finish();
end

initial begin
	$monitor("rs = %5b, rt = %5b, rd = %5b, func = %6b, shamt = %6b, result = %32b", instruction_set[25:21], instruction_set[20:16], instruction_set[15:11], instruction_set[5:0], instruction_set[10:6], result);
end

always begin
	#5 clk = ~clk;
	
end


endmodule