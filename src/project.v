/*
 * Copyright (c) 2024 Edward Lei
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_Edward2005lol_Slot_Machine_Top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 8'd0;
  assign uio_oe  = 8'b11111111;

  //Make ui_in[0] where the start button will be hooked up to
  
  //VGA logic/variables
  wire [9:0] H_count_value, V_count_value;
  wire enable_V_counter;
  wire [1:0] red, green, blue;

  horizontal_counter h_counter(.clk(clk), .H_count_value(H_count_value), .enable_V_counter(enable_V_counter));
  vertical_counter v_counter(.clk(clk), .V_count_value(V_count_value), .enable_V_counter(enable_V_counter));

  wire [1:0] symbol1, symbol2, symbol3; 
  display_slots draw_slots(.clk(clk), .symbol1(symbol1), .symbol2(symbol2), .symbol3(symbol3), .hcount(H_count_value), .vcount(V_count_value), .red(red), .green(green), .blue(blue));
  slot_spinner spin_the_slots (.start(ui_in[0]), .clk(clk), .reset_n(rst_n), .symbol1(symbol1), .symbol2(symbol2), .symbol3(symbol3));
  
  //Assign outputs
  assign uo_out[0] = red[1];
  assign uo_out[1] = green[1];
  assign uo_out[2] = blue[1];
  assign uo_out[3] = (V_count_value < 2) ? 1'b1:1'b0;
  assign uo_out[4] = red[0];
  assign uo_out[5] = green[0];
  assign uo_out[6] = blue[0];
  assign uo_out[7] = (H_count_value < 96) ? 1'b1:1'b0;
  

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, 1'b0};
  wire unused2 = &{uio_in, 8'd0};
  wire unused3 = &{ui_in[7:1], 7'd0};

endmodule

