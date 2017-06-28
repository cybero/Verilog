`timescale 1ns / 1ps //1ns represents the reference time and 1ps the precision value

module Freq_Divider #(
  parameter sys_clk = 50000000,   // Input system clock: 50 MHz
  parameter desired_clk = 25000000    // Output clock: 25 MHz
)

  (
    clk_in,        //clock input
    nreset,        //reset active low
    clk_out        //clock output
  );

  // input ports
  input clk_in, nreset;

  // output ports
  output reg clk_out;

  // counter size calculation according to input and output frequencies
  parameter max = sys_clk / (2*desired_clk); // max-counter size

  reg [4:0]counter = 0; // 5-bit counter size

  always@(posedge clk_in or negedge nreset) begin
    if (~nreset)    // Asynchronous reset when reset goes low
      begin
        clk_out<=0;
      end
    else if(counter == max-1)
      begin
        counter <= 0;
        clk_out <= ~clk_out;
      end
    else
      begin
        counter <= counter + 1'd1;
      end
  end
endmodule
