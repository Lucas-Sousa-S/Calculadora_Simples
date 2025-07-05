module clk_divider (
    input clk,
    output reg slow_clk
);

reg [23:0] count = 0;

always @(posedge clk) begin
    count <= count + 1;
    slow_clk <= count[23]; // Divide o clock original
end

endmodule
