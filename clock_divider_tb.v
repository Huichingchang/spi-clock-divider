`timescale 1ns/1ps
module clock_divider_tb;
	reg clk_in;
	reg rst_n;
	wire clk_out;
	
	// Instantiate the DUT
	clock_divider #(
		.DIV_FACTOR(4)
	) dut (
		.clk_in(clk_in),
		.rst_n(rst_n),
		.clk_out(clk_out)
	
	);
	
	// Clock generation
	initial begin
		clk_in = 0;
		forever #5 clk_in = ~clk_in;  //100MHz clock(10ns period)
	end
	
	initial begin
		$dumpfile("clock_divider.vcd");
		$dumpvars(0, clock_divider_tb);
		rst_n = 0;
		#20;
		rst_n = 1;
		
		#200;  //simulate for 200ns
		$finish;
	end
endmodule