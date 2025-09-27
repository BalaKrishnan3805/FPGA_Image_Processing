module clamp_0_255(
    input  signed [16:0] in,
    output [7:0] out
);
    assign out = (in < 0) ? 8'd0 : ((in > 255) ? 8'd255 : in[7:0]);
endmodule

