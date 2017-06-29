`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: RX
// Description: 
// This is the top level module for the Receiver
//
//////////////////////////////////////////////////////////////////////////////////
module RX(
    input reset,
    input clk,
    input Serial_in,
    output RX_done,
    output [7:0] Data_out
    );
parameter baudrate = 9600 ;
parameter freq = 2000000 ;
wire tick;
baudgen_rx#(freq/(baudrate*16)) baudgen_rx (
    .clk(clk), 
    .reset(reset), 
    .tick(tick)
    );
Reciever Reciever (
    .clk(clk), 
    .reset(reset), 
    .Data_in(Serial_in), 
    .tick(tick), 
    .dout(Data_out), 
    .load(RX_done)
    );
endmodule
