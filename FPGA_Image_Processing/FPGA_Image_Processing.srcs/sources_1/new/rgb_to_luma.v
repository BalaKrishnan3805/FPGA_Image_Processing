module rgb_to_luma(
    input [7:0] r,
    input [7:0] g,
    input [7:0] b,
    output [7:0] y
);
    wire [16:0] sum = (77 * r) + (150 * g) + (29 * b);
    assign y = sum[15:8]; // >>8
endmodule

