`timescale 1ns / 1ps

module top_TB();
  reg clk_in, nreset;
  wire clk_out;
  
  Freq_Divider  #(
    .sys_clk(50000000),
    .desired_clk(25000000)) 
  U1 (.clk_in(clk_in), .clk_out(clk_out),.nreset(nreset));
  
  initial
    begin
      $monitor($time, " clk = %b, rst = %b, out_clk = %b",clk_in,nreset,clk_out);
      clk_in=0;
      nreset=0;
      #20 nreset=1;
      #500 $finish;
    end

  always 
    #5  clk_in =  ! clk_in; 

  initial
    begin
      $dumpfile ("frequencydiv.vcd");
      $dumpvars (0,top_TB);
    end

endmodule
