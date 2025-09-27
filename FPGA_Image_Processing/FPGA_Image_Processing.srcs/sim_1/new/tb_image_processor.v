`timescale 1ns/1ps


module tb_image_processor;


// Clock and reset
reg clk = 0;
reg rst = 1;


// Image parameters
localparam W = 4;
localparam H = 4;
reg [23:0] test_image [0:W*H-1];


// DUT inputs
reg valid_in;
reg [23:0] pixel_in;
reg [1:0] mode;
reg signed [8:0] bright_offset;
reg [7:0] threshold;


// DUT outputs
wire valid_out;
wire [23:0] pixel_out;
wire [7:0] r_out = pixel_out[23:16];
wire [7:0] g_out = pixel_out[15:8];
wire [7:0] b_out = pixel_out[7:0];


// Instantiate DUT
image_processor dut(
.clk(clk),
.rst(rst),
.valid_in(valid_in),
.pixel_in(pixel_in),
.mode(mode),
.bright_offset(bright_offset),
.threshold(threshold),
.valid_out(valid_out),
.pixel_out(pixel_out)
);


// Clock generation
always #5 clk = ~clk; // 100 MHz clock


// Test sequence
initial begin
// Enable waveform dump (optional)
$dumpfile("wave.vcd");
$dumpvars(0, tb_image_processor);


// Initialize DUT inputs
valid_in = 0;
pixel_in = 0;
mode = 2'b00;
bright_offset = 0;
threshold = 128;


// Reset
#20; rst = 0;


// Prepare test image (4x4 pattern)


$display("Simulation done. Check waveform viewer.");
#20;
$finish;
end
endmodule
