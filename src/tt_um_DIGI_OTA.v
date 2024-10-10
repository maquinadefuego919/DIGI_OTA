/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_DIGI_OTA (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    wire Out, Vip, Vin;
  // All output pins must be assigned. If not used, assign to 0.
    assign [0] uo_out  = Out;  // Example: ou_out is the sum of ui_in and uio_in
    assign uo_out[7:1] = 7'b0000000:
    
    
    assign Vip= ui_in [0]   ;
    assign Vin= ui_in [1];

wire INn, INp, CMP, EN, not_EN, Op, On, Pr, INn_CMP, INp_CMP, INp_And, INn_And; //internals nets
not IV1 (INn, Vip);
not IV2 (INn, CMP);
not IV3 (INp, Vin);
not IV4 (INp, CMP);

    
nor NOR1 (INn_And, INn, INn_CMP):
nor NOR2 (INp_And, INp, Inp_CMP);
    
not IV5 (Op, INn_CMP);
not IV6 (On, INp_CMP);
    
not IV7 (not_EN, EN);
xor XOR1 (EN, Op, On);
bufif1 BT1 (Pr, EN, Op);
notif1 IT1 (CMP, not_EN, Op);
   
  assign uio_out = 0;
    assign uio_oe  = 0;
    
  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
