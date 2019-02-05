module mux_2x1(out, in1, in2, select);
input in1, in2;
input select;
output out;
wire a,b, notSelect;

and first_select(a, in2, select);
not reverse_select(notSelect, select);
and second_select(b, notSelect, in1);
or out_select(out, a, b);

endmodule