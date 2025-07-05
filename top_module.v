module top_module (
    input clk,
    input rst,
    input btn_load_a, btn_load_b, btn_calc,
    input [1:0] sw_op,
    input [7:0] sw_data,
    output [6:0] seg_a, seg_b, seg_res1, seg_res0,
    output [7:0] leds
);

wire [7:0] A, B, result;
wire [1:0] alu_op;
wire zero, overflow;

register_file reg_a (.clk(clk), .rst(rst), .load(btn_load_a), .data_in(sw_data), .data_out(A));
register_file reg_b (.clk(clk), .rst(rst), .load(btn_load_b), .data_in(sw_data), .data_out(B));

control_unit cu (.sw_op(sw_op), .btn_calc(btn_calc), .alu_op(alu_op));
alu alu_unit (.A(A), .B(B), .op(alu_op), .result(result), .zero(zero), .overflow(overflow));

// Displays (resposta em dois dígitos)
display_decoder disp_a (.bin(A[3:0]), .seg(seg_a));
display_decoder disp_b (.bin(B[3:0]), .seg(seg_b));
display_decoder disp_res0 (.bin(result[3:0]), .seg(seg_res0));
display_decoder disp_res1 (.bin(result[7:4]), .seg(seg_res1));

// LEDs para feedback
assign leds[7:0] = result;

endmodule
