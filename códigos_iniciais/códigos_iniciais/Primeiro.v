// Por Lucas, em 2025
module calculator (
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] op_sel,
    output reg [7:0] result,
    output reg error
);

    always @(*) begin
        error = 0; // reseta o erro a cada ciclo
        case (op_sel)
            2'b00: result = a + b; // Soma
            2'b01: result = a - b; // Subtração
            2'b10: result = a * b; // Multiplicação
            2'b11: begin           // Divisão
                if (b == 0) begin
                    result = 8'd0;
                    error = 1;     // Erro: divisão por zero
                end else begin
                    result = a / b;
                end
            end
            default: begin
                result = 8'd0;
                error = 1; // Código de operação inválido
            end
        endcase
    end

endmodule
