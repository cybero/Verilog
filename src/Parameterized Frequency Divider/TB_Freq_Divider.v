`timescale 1ns / 1ps

module TB_Freq_Divider;

  // Inputs
  reg Clk_in;

  // Outputs
  wire Clk_out;

  // Instantiate the Unit Under Test (UUT)
  Freq_Divider #(.sys_clk(50000000), .clk_out(10)) 
  uut (
    .Clk_in(Clk_in), 
    .Clk_out(Clk_out)
  );

  initial begin
    // Initialize Inputs
    Clk_in = 0;

    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here

  end
  
  always #5 Clk_in = ~Clk_in;

endmodule

