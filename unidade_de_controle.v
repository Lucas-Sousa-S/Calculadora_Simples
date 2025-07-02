module control_unit (
    input [1:0] sw_op,     // Switches definem a operação
    input btn_calc,        // Botão para executar operação
    output reg [1:0] alu_op
);

always @(*) begin
    if (btn_calc)
        alu_op = sw_op;    // Encaminha operação para ALU
    else
        alu_op = 2'b00;    // Default: ADD
end

endmodule
