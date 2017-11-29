`timescale 1ns / 1ps

module top(clk, reset, btn, leds);

  input wire clk;
  input reset;
  input  wire btn;
  output [7 : 0] leds;

  wire [3:0] addra_bus;
  wire [7:0] leds_bus;
  wire button_wire;

  bram_controller bram_controller_unit (
    .clk(clk), 
    .reset(reset), 
    .btn(button_wire), 
    .wea(wea), 
    .addra(addra_bus)
  );

  debouncer debouncer_unit (
    .clk(clk),     
	 .reset(reset), 
    .PB(btn), 
    .PB_state(), 
    .PB_down(button_wire), 
    .PB_up()
  );

  bram2 bram_8x16 (
    .clka(clk), // input clka
    .wea(wea), // input [0 : 0] wea
    .addra(addra_bus), // input [3 : 0] addra
    .dina(dina), // input [7 : 0] dina
    .douta(leds_bus) // output [7 : 0] douta
  );

  assign leds = leds_bus;

endmodule
