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

  assign uo_out[5:0] = 6'd0;
  //Make ui_in[0] where the start button will be hooked up to
  //Make uo_out[1:0] be red
  //Make uo_out[3:2] be blue
  //Make uo_out[5:4] be green
  //Make uo_out[6] be hsync
  //Make uo_out[7] be vsync


  //VGA logic/variables
  wire [15:0] H_count_value, V_count_value;
  wire enable_V_counter;
  horizontal_counter h_counter(.clk(clk), .H_count_value(H_count_value), .enable_V_counter(enable_V_counter));
  vertical_counter v_counter(.clk(clk), .V_count_value(V_count_vaule), .enable_V_counter(enable_V_counter));

  wire [1:0] symbol1, symbol2, symbol3; 
  // display_slots draw_slots(.clk(clk), .symbol1(symbol1), .symbol2(symbol2), .symbol3(symbol3), .hcount(H_count_value), .vcount(V_count_value), .red(uo_out[1:0]), .green(uo_out[3:2]), .blue(uo_out[5:4]));
  // slot_spinner spin_slots (.start(start), .clk(clk), .reset_n(reset_n), .symbol1(symbol1), .symbol2(symbol2), .symbol3(symbol3));
  assign uo_out[6] = (H_count_value < 96) ? 1'b1:1'b0;
  assign uo_out[7] = (V_count_value < 2) ? 1'b1:1'b0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, 1'b0};
  wire unused2 = &{uio_in, 8'd0};

endmodule

module horizontal_counter 
(
    input logic clk,
    output reg [15:0] H_count_value,
    output logic enable_V_counter
);
    initial H_count_value = 0;
    always @(posedge clk) begin
        if (H_count_value < 799) begin
            H_count_value <= H_count_value + 1;
            enable_V_counter <= 0;
        end
        else begin
            H_count_value <= 0;
            enable_V_counter <= 1;
        end
    end
endmodule: horizontal_counter

module vertical_counter
(
    input logic clk, 
    input logic enable_V_counter,
    output reg [15:0] V_count_value
);
	initial V_count_value = 0;
    always @(posedge clk) begin
        if (enable_V_counter == 1'b1) begin
            if (V_count_value < 524) begin
                V_count_value <= V_count_value + 1;
            end
            else begin
                V_count_value <= 0;
            end
        end
    end
endmodule: vertical_counter

            

