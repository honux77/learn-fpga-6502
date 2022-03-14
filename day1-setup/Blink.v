module blink (
    input wire FPGA_CLK1_50, //50mhz input clock
    output wire LED_POWER // LED output    
);

wire clk;

clk_pll (
		.refclk(FPGA_CLK1_50),   //  refclk.clk
		.rst(),      //   reset.reset
		.outclk_0(clk)  // outclk0.clk
	);

reg [31:0] cnt; //32-bit counter

initial begin
    cnt <= 32'h00000000;
end

always @(posedge clk) begin
    cnt <= cnt + 1;
end

assign LED_POWER = cnt[24];

endmodule
