module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [1:0] op,         // 00: ADD, 01: SUB, 10: AND, 11: XOR
    output reg [7:0] result,
    output reg zero,
    output reg overflow
);

always @(*) begin
    case(op)
        2'b00: {overflow, result} = A + B;
        2'b01: {overflow, result} = A - B;
        2'b10: result = A & B;
        2'b11: result = A ^ B;
    endcase
    zero = (result == 0);
end

endmodule
