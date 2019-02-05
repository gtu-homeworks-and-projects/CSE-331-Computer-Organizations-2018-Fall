module mux_4x1_32(out, in1, in2, in3, in4, select);
input [31:0] in1, in2, in3, in4;
input [1:0] select;
output [31:0] out;
wire [31:0]a, b;

mux_2x1_32 mux1(a, in1, in2, select[0]);
mux_2x1_32 mux2(b, in3, in4, select[0]);
mux_2x1_32 mux3(out, a, b, select[1]);

endmodule