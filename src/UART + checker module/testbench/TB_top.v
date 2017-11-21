`timescale 1ns / 1ps

module TB_top;

	// Inputs
	reg clk;
	reg reset;
	reg data_in;

	// Outputs
	wire data_out;
	wire [7:0] leds;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset(reset), 
		.data_in(data_in), 
		.data_out(data_out), 
		.leds(leds)
	);
	
	integer i,j;
	reg [7:0]data;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		data_in = 0;
      data = 227;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
        
		// Add stimulus here
		#5 data_in=0;
		for(j=0;j<20;j=j+1)begin
			for(i=0;i<8;i=i+1)begin		
				#300	
				data_in = data[i];		
			end
			#300	
			data_in = 1;	
	   end
	end

always
#10 clk=!clk;

      
endmodule
