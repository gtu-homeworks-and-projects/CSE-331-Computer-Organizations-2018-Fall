module mux_8x1_32(out, in1, in2, in3, in4, in5, in6, in7, in8, select);
input [31:0] in1, in2, in3, in4, in5, in6, in7, in8;
input [2:0] select;
output [31:0] out;
wire [31:0]a, b;

mux_4x1_32 mux1(a, in1, in2, in3, in4, select[1:0]);
mux_4x1_32 mux2(b, in5, in6, in7, in8, select[1:0]);
mux_2x1_32 mux3(out, a, b, select[2]);

endmodule