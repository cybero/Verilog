`timescale 1ns / 1ps

module TB_BRAM;

  // Inputs
  reg clka;
  reg [0:0] wea;
  reg [3:0] addra;
  reg [7:0] dina;

  // Outputs
  wire [7:0] douta;

  // Instantiate the Unit Under Test (UUT)
  bram_16x8 uut (
    .clka(clka), 
    .wea(wea), 
    .addra(addra), 
    .dina(dina), 
    .douta(douta)
  );

  initial begin
    // Initialize Inputs
    clka = 0;
    wea = 0;
    addra = 0;
    dina = 0;

    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here

    $display("LEEMOS");
    wea = 0;
    addra=4'h0;		#100;
    addra=4'h1;		#100;
    addra=4'h2;		#100;
    addra=4'h3;		#100;
    addra=4'h4;		#100;
    addra=4'h5;		#100;
    addra=4'h6;		#100;
    addra=4'h7;		#100;
    addra=4'h8;		#100;
    addra=4'h9;		#100;
    addra=4'hA;		#100;
    addra=4'hB;		#100;
    addra=4'hC;		#100;
    addra=4'hD;		#100;
    addra=4'hE;		#100;
    addra=4'hF;		#100;

    $display("ESCRIBIMOS");
    wea = 1;
    addra=4'h0;		dina = 8'd0;		#100;
    addra=4'h1;		dina = 8'd1;		#100;
    addra=4'h2;		dina = 8'd2;		#100;
    addra=4'h3;		dina = 8'd3;		#100;
    addra=4'h4;		dina = 8'd4;		#100;
    addra=4'h5;		dina = 8'd5;		#100;
    addra=4'h6;		dina = 8'd6;		#100;
    addra=4'h7;		dina = 8'd7;		#100;
    addra=4'h8;		dina = 8'd8;		#100;
    addra=4'h9;		dina = 8'd9;		#100;
    addra=4'hA;		dina = 8'd10;		#100;
    addra=4'hB;		dina = 8'd11;		#100;
    addra=4'hC;		dina = 8'd12;		#100;
    addra=4'hD;		dina = 8'd13;		#100;
    addra=4'hE;		dina = 8'd14;		#100;
    addra=4'hF;		dina = 8'd15;		#100;


    $display("LEEMOS");
    wea = 0;
    addra=4'h0;		#100;
    addra=4'h1;		#100;
    addra=4'h2;		#100;
    addra=4'h3;		#100;
    addra=4'h4;		#100;
    addra=4'h5;		#100;
    addra=4'h6;		#100;
    addra=4'h7;		#100;
    addra=4'h8;		#100;
    addra=4'h9;		#100;
    addra=4'hA;		#100;
    addra=4'hB;		#100;
    addra=4'hC;		#100;
    addra=4'hD;		#100;
    addra=4'hE;		#100;
    addra=4'hF;		#100;

    $stop	;        

  end

  always
    #10 clka = ! clka;	

endmodule

