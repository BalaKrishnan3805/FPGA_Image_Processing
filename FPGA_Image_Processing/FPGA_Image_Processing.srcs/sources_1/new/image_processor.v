`timescale 1ns/1ps
module image_processor(
    input clk,
    input rst,
    input valid_in,
    input [23:0] pixel_in,
    input [1:0] mode,
    input signed [8:0] bright_offset,
    input [7:0] threshold,
    output reg valid_out,
    output reg [23:0] pixel_out
);

    wire [7:0] r_in = pixel_in[23:16];
    wire [7:0] g_in = pixel_in[15:8];
    wire [7:0] b_in = pixel_in[7:0];

    wire signed [16:0] r_b = $signed({1'b0, r_in}) + bright_offset;
    wire signed [16:0] g_b = $signed({1'b0, g_in}) + bright_offset;
    wire signed [16:0] b_b = $signed({1'b0, b_in}) + bright_offset;

    wire [7:0] r_b_clamped, g_b_clamped, b_b_clamped;

    clamp_0_255 clamp_r(.in(r_b), .out(r_b_clamped));
    clamp_0_255 clamp_g(.in(g_b), .out(g_b_clamped));
    clamp_0_255 clamp_b(.in(b_b), .out(b_b_clamped));

    wire [7:0] r_inv = 8'd255 - r_in;
    wire [7:0] g_inv = 8'd255 - g_in;
    wire [7:0] b_inv = 8'd255 - b_in;

    wire [7:0] luma;
    rgb_to_luma luma_calc(.r(r_in), .g(g_in), .b(b_in), .y(luma));

    wire [23:0] white = {8'd255,8'd255,8'd255};
    wire [23:0] black = {8'd0,8'd0,8'd0};

    reg [23:0] proc_pixel;

    always @(*) begin
        case (mode)
            2'b00: proc_pixel = pixel_in;
            2'b01: proc_pixel = {r_b_clamped, g_b_clamped, b_b_clamped};
            2'b10: proc_pixel = {r_inv, g_inv, b_inv};
            2'b11: proc_pixel = (luma >= threshold) ? white : black;
            default: proc_pixel = pixel_in;
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            valid_out <= 1'b0;
            pixel_out <= 24'd0;
        end else begin
            valid_out <= valid_in;
            pixel_out <= proc_pixel;
        end
    end
endmodule

