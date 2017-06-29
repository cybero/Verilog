`timescale 1ns / 1ps

module Reciever(
  input clk,
  input reset,
  input Data_in,
  input tick,
  output reg[7:0] dout,
  output reg load
);
  // flag for start bit
  reg start_flag;
  // shift register
  reg [7:0]shift_reg;
  // counters
  reg [3:0]counter;
  reg [3:0]bit_cnt;
  // perform the following every rising edge
  always@(posedge clk or negedge reset)
    if(!reset) // reset condition
      begin
        shift_reg<=0;
        counter<=0;
        bit_cnt<=0;
        start_flag<=0;
      end
  else
    begin
      load <= 0; // by default load is equal to 0
      if(!start_flag)begin // if there is no start flag
        if(!Data_in && tick) // check that input is zero with tick = 1
          if(counter==7)    // if 8 ticks takes place during Data_in=0
            begin
              start_flag<=1; // set the start flag as this is the data start condition
              counter<=0;    // reset the counter
            end
        else
          counter<=counter+1;end // else increment the counter
      else if(tick)  // after the start flag is set, do the follwoing with each tick signal
        if(counter == 15 && bit_cnt==8) // if the tick counter = 15 and bit counter = 8
          begin
            load<=1;             // set the load signal
            counter<=0;
            dout<=shift_reg[7:0]; // send the received data to output port
            start_flag<=0;        // reset start flag
            bit_cnt<=0;
          end
      else if(counter == 15) //  if the tick counter = 15 and bit counter less than 8. el 15 es pk se samplea cada bit 16 veces, para asegurarse de superar los errores de velocidad de transmisión

        begin
          counter<=0;         // reset the tick counter
          //shift_reg<={Data_in,shift_reg[7:1]}; // shift in the new bit
          shift_reg<={shift_reg[6:0],Data_in}; // shift in the new bit <<--- para mostrar K e IV como en Python
          bit_cnt<=bit_cnt+1;  // increment bit counter
        end
      else
        counter<=counter+1; // count every tick
    end
endmodule