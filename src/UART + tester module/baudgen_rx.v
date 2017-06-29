`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Design Name: Baud Rate generator
// Description: 
// Modulus M counter
// It counts from 0 to M-1. When the count value equals M-1, the tick signal is raised.
// This module generates a square signal.
// This pulse acts as a clock for the sampling process in the UART receiver.
// The pulse is generated just in the middle of the period.
// Uart clock has to be 16 times faster than the Baud Rate.

//                         __                                         __
//     ____________________| |________________________________________| |_____________________
//     |                  ->  <- 1 clock cycle   |
//     <-------  Period ------------------------->


//////////////////////////////////////////////////////////////////////////////////

module baudgen_rx#(parameter max = 13 )(
  input clk,
  input reset,
  output tick
);

   /*
    * The formula to calculate the max counter value is:
    * max = clk/(16 * baud_rate)
    * baud_rate : This is the baud rate we are going to use when sending the date to the FPGA.
    */

   /*
    * Input paramete = system clock -> 2MHz, Baud rate -> 9600.
    * max = 2000000 / (16 * 9600) = 13
    */

  //parameter max = 13 ;
  
  reg[31:0]counter;

  assign tick=(counter==max-1)?1'b1:1'b0;

  always@(posedge clk or negedge reset) begin
    if(!reset)
      counter<=0;
    else if(counter==max-1)
      counter<=0;
    else
      counter<=counter+1; end
      
endmodule
