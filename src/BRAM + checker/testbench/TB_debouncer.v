`timescale 1ns / 1ps


module TB_debouncer;

  // Inputs
  reg clk;
  reg reset;
  reg PB;

  // Outputs
  wire PB_state;
  wire PB_down;
  wire PB_up;

  // Instantiate the Unit Under Test (UUT)
  debouncer uut (
    .clk(clk), 
    .reset(reset), 
    .PB(PB), 
    .PB_state(PB_state), 
    .PB_down(PB_down), 
    .PB_up(PB_up)
  );

  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    PB = 0;

    // Wait 100 ns for global reset to finish
    #100;
    reset = 0;

    // Add stimulus here

  end

  always 
    begin
      #40000 PB = 1'b1;

      #400 PB = 1'b0;		

      #800 PB = 1'b1;	

      #800 PB = 1'b0;				

      #800 PB = 1'b1;

      #40000 PB = 1'b0;

      #4000 PB = 1'b1;		

      #40000 PB = 1'b0;

      #400 PB = 1'b1;

      #800 PB = 1'b0;		

      #800 PB = 1'b1;

      #800 PB = 1'b0;

      #40000 PB = 1'b1;		

      #4000 PB = 1'b0;

      $stop;
    end


  always 
    #5 clk = ~clk;    // every five nanoseconds invert the clock



endmodule

