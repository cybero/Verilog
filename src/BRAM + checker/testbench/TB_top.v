`timescale 1ns / 1ps


module TB_top;

  // Inputs
  reg clk;
  reg reset;
  reg btn;

  // Outputs
  wire [7:0] leds;

  // Instantiate the Unit Under Test (UUT)
  top uut (
    .clk(clk), 
    .reset(reset), 
    .btn(btn), 
    .leds(leds)
  );

  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    btn = 0;

    // Wait 100 ns for global reset to finish
    #100;
    reset = 0;

    // Add stimulus here

  end




  always 
    begin
      #40000 btn = 1'b1;

      #400 btn = 1'b0;		

      #800 btn = 1'b1;	

      #800 btn = 1'b0;				

      #800 btn = 1'b1;

      #40000 btn = 1'b0;

      #4000 btn = 1'b1;		

      #40000 btn = 1'b0;

      #400 btn = 1'b1;

      #800 btn = 1'b0;		

      #800 btn = 1'b1;

      #800 btn = 1'b0;

      #40000 btn = 1'b1;		

      #4000 btn = 1'b0;

      $stop;
    end


  always 
    #5 clk = ~clk;    // every five nanoseconds invert the clock


endmodule

