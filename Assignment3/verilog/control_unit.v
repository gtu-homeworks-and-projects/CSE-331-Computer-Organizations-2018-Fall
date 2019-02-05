module control_unit(select_bits_ALU, function_code);

input [5:0] function_code;
output [2:0] select_bits_ALU;

wire notF5;
not (notF5, function_code[5]);
or (select_bits_ALU[2], notF5, function_code[1]);

xnor (select_bits_ALU[1] ,function_code[2], function_code[1]);

wire temp_1, temp_2;
and (temp_1, notF5, function_code[1]);
and (temp_2, function_code[2], function_code[0]);

or (select_bits_ALU[0], temp_1, temp_2);

endmodule