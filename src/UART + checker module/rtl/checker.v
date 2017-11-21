`timescale 1ns / 1ps

module checker
  ( 
    input wire clk,
    input wire reset,
    input wire rx_done_tick,
    input wire [7:0] r_data,
    output reg [7:0] w_data,
    output reg tx_start

  );

  // state declaration for the FSM
  localparam [1:0]
  idle_and_receive    = 2'b00,
  send 					 = 2'b01;

  //	signal declaration
  reg [1:0] state_reg;
  reg [7:0] rx_buffer;

  always@(posedge clk, posedge reset)

    if(reset)begin
      state_reg<=idle_and_receive;
      tx_start<=0;
    end
  else 

    case (state_reg)

      idle_and_receive: 
        begin 
          tx_start<=0;
          if(rx_done_tick)begin
            tx_start<=0;
            rx_buffer<=r_data;
            state_reg<=send;
          end 
        end

      send:
        begin
          tx_start<=1;
          w_data<=rx_buffer+1'b1;
          state_reg<=idle_and_receive;
        end

    endcase

endmodule
