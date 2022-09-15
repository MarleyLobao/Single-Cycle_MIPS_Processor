`timescale 1ns / 1ps
`default_nettype none //Command to disable automatic wires declaration

module simple_testbench();

parameter PERIOD_NS_50 = 20;		//  T = 1/(50*10^6 Hz) = 20ns
parameter PERIOD_NS_27 = 37.04;	//  T = 1/(27*10^6 Hz) = 37.04ns

//Clocks
logic tb_CLOCK_27, tb_CLOCK_50;
//Keys and Buttons
logic [3:0] tb_KEY;
logic [17:0] tb_SW;
//7-segment displays and LEDs
logic [0:6] tb_HEX0, tb_HEX1, tb_HEX2, tb_HEX3, tb_HEX4, tb_HEX5, tb_HEX6, tb_HEX7;
logic [8:0] tb_LEDG;
logic [17:0] tb_LEDR;
//Serial
logic tb_UART_TXD;
logic tb_UART_RXD;
logic [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5;
logic [7:0] w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
//GPIO
wire [35:0] tb_GPIO_0, tb_GPIO_1;

always #(PERIOD_NS_27/2) tb_CLOCK_27 = ~tb_CLOCK_27;
always #(PERIOD_NS_50/2) tb_CLOCK_50 = ~tb_CLOCK_50;

Mod_Test MT (
	.CLOCK_27(tb_CLOCK_27),
	.CLOCK_50(tb_CLOCK_50),
	.KEY(tb_KEY),
	.SW(tb_SW),
	.HEX0(tb_HEX0),
	.HEX1(tb_HEX1),
	.HEX2(tb_HEX2),
	.HEX3(tb_HEX3),
	.HEX4(tb_HEX4),
	.HEX5(tb_HEX5),
	.HEX6(tb_HEX6),
	.HEX7(tb_HEX7),
	.LEDG(tb_LEDG),
	.LEDR(tb_LEDR),
	.UART_TXD(tb_UART_TXD),
	.UART_RXD(tb_UART_RXD),
	.w_d0x0, .w_d0x1, .w_d0x2, .w_d0x3, .w_d0x4, .w_d0x5,
	.w_d1x0, .w_d1x1, .w_d1x2, .w_d1x3, .w_d1x4, .w_d1x5,
	.GPIO_0(tb_GPIO_0),
	.GPIO_1(tb_GPIO_1)
);

initial begin
	tb_CLOCK_27 = 1'b1;
	tb_CLOCK_50 = 1'b1;
	
	tb_KEY[0] = 1'b0;
	
	tb_SW[15:0] = 16'hFACA;
	tb_KEY[1] = 1'b0;
	#50;
	tb_SW[15:0] = 16'hAAAA;
	tb_KEY[1] = 1'b1;
	#50;
	tb_SW[15:0] = 16'hBBBB;
	tb_KEY[1] = 1'b0;
	#50;
	tb_SW[15:0] = 16'hCCCC;
	tb_KEY[1] = 1'b1;
	#50;
	tb_SW[15:0] = 16'hDDDD;
	tb_KEY[1] = 1'b0;
	#50;
	tb_SW[15:0] = 16'hEEEE;
	tb_KEY[1] = 1'b1;
	#50;
	tb_SW[15:0] = 16'hFFFF;
	tb_KEY[1] = 1'b0;
	#50;
	tb_SW[15:0] = 16'hFACA;
	tb_KEY[1] = 1'b1;
	#50;
	
	
	#200;
	$stop;
end

endmodule