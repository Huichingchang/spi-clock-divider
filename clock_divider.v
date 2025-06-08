module clock_divider #(
	parameter DIV_FACTOR = 4
)(
	input wire clk_in,
	input wire rst_n,
	output reg clk_out
);
	integer counter;
	always @(posedge clk_in or negedge rst_n) begin
		if(!rst_n) begin
			counter <= 0;
			clk_out <= 0;
		end else begin
			if (counter == DIV_FACTOR - 1) begin
				clk_out <= ~clk_out;
				counter <=0;
			end else begin
				counter <= counter + 1;
			end
		end
	end
endmodule