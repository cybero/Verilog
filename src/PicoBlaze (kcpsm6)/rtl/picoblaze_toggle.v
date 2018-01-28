`timescale 1ns / 1ps
module picoblaze_toggle(
    input iReset,
    input iClk,
    output oLed0
    );

  wire clock = iClk;
// NOTE: In Verilog a 'reg' must be used when a signal is used in a process and a 'wire'
//       must be used when using a simple assignment. This means that you may need to 
//       change the definition for the 'interrupt', 'kcpsm6_sleep' and 'kcpsm6_reset'
//       depending on how you use them in your design. For example, if you don't use 
//       interrupt then you will probably tie it to '0' and this will require a 'wire'.
//
wire	[11:0]	address;
wire	[17:0]	instruction;
wire			bram_enable;
wire	[7:0]		port_id;
wire	[7:0]		out_port;
reg	[7:0]		in_port;
wire			write_strobe;
wire			k_write_strobe;
wire			read_strobe;
wire			interrupt;            
wire			interrupt_ack;
wire			kcpsm6_sleep;         
wire        kcpsm6_reset = iReset;
wire			cpu_reset;
wire			rdl = iReset;

  kcpsm6 #(
	.interrupt_vector	(12'h3FF),
	.scratch_pad_memory_size(64),
	.hwbuild		(8'h00))
  processor (
	.address 		(address),
	.instruction 	(instruction),
	.bram_enable 	(bram_enable),
	.port_id 		(port_id),
	.write_strobe 	(write_strobe),
	.k_write_strobe 	(k_write_strobe),
	.out_port 		(out_port),
	.read_strobe 	(read_strobe),
	.in_port 		(in_port),
	.interrupt 		(interrupt),
	.interrupt_ack 	(interrupt_ack),
	.reset 		(kcpsm6_reset),
	.sleep		(kcpsm6_sleep),
	.clk 			(clock));
	
assign kcpsm6_sleep = 1'b0;
assign interrupt = 1'b0;	
	
led led_rom (
    .address(address), 
    .instruction(instruction), 
    .enable(bram_enable), 
    .clk(clock)
    );



   // only one bit written to by picoblaze, the LED.
   // therefore don't need to decode port_id.
   // if write_strobe asserts, grab out_port[0] and
   // hold it in userbit.

   reg userbit = 0;

   always @(posedge clock) 
	  begin
       if(write_strobe) 
		   begin
           userbit <= out_port[0];
         end
     end

assign oLed0 = userbit;

endmodule
