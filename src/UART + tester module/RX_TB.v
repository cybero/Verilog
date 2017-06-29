`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2017 11:29:24
// Design Name: 
// Module Name: RX_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RX_TB;

//inputs
    reg reset, clk, Serial_in;
    //outputs
wire RX_done;
wire [7:0] Data_out;

	// Instantiate the Unit Under Test (UUT)
	RX uut (
		.reset(reset), 
		.clk(clk), 
		.Serial_in(Serial_in), 
		.RX_done(RX_done), 
		.Data_out(Data_out) 
	);




integer i,j;
reg [8:0]data;
	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		Serial_in = 1;
      data = 170;
		// Wait 100 ns for global reset to finish
		#100;
      reset = 1;
		for(j=0;j<20;j=j+1)begin
			for(i=0;i<7;i=i+1)begin		
				#104166	
				Serial_in = data[i];		
			end
			#104166	
			Serial_in = 1;	
	   end
	end
always
#250 clk=!clk;  
      
//frecuencia es 1/2*delay
//#5 ---> 100MHZ....#10 ---> 50Mhz
		
endmodule
