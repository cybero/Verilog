`timescale 1ns / 1ps

module Freq_Divider_3 
  (
    clk_in,        //clock input
    nreset,        //reset active low
    clk_out        //clock output
  );

  // input ports
  input clk_in, nreset;

  // output ports
  output clk_out;

  reg [1:0] pos_count, neg_count;

//Posedge counter. It counts rising edges
  always@(posedge clk_in)begin
    if (~nreset)begin
      pos_count<=0;
    end
    else if(pos_count == 2)begin
      pos_count <=0;
    end
    else begin
      pos_count<=pos_count+1;
    end
  end

//Negedge counter. It counts falling edges
  always@(negedge clk_in)begin
    if (~nreset)begin
      neg_count<=0;
    end
    else if(neg_count == 2)begin
      neg_count <=0;
    end
    else begin
      neg_count<=neg_count+1;
    end
  end   

//When pos_count and neg_count are different than 2, clk_out=1.
//In other case, clk_out=0;
  assign clk_out = ((pos_count!=2) && (neg_count!=2));

endmodule
