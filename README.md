# FPGA Image Processing
This repository contains a Verilog-based FPGA image processing system designed for beginners to explore digital image manipulation on FPGAs. The project demonstrates how to implement basic image operations such as brightness adjustment, inversion, and thresholding using Vivado.

## Features

 # Image Processing Modes:

Passthrough: Original pixel values.

Brightness Adjustment: Increase or decrease pixel intensity.

Inversion: Invert RGB values.

Thresholding: Convert image to black & white based on luma.

# Modular Design:

clamp_0_255.v – Clamps pixel values between 0 and 255.

rgb_to_luma.v – Converts RGB to luma for thresholding.

image_processor.v – Main processing module.

tb_image_processor.v – Testbench for simulation and waveform visualization.

# Vivado-ready:

Run simulations and view results directly in the waveform viewer.

Observe R, G, B channels in real-time.

Getting Started

Open Vivado and create a new RTL project.

Add source files: clamp_0_255.v, rgb_to_luma.v, image_processor.v, and tb_image_processor.v.

Run Behavioral Simulation.

Observe waveform to verify image processing modes.

# Usage

Modify the testbench to add new test images or change processing modes.

Use the waveform viewer to track pixel outputs cycle by cycle.

No external image files required for basic testing.

# Purpose

Learn FPGA design using Verilog.

Understand basic image processing operations in hardware.

Practice Vivado simulation and waveform analysis.
