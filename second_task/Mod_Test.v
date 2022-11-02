module Mod_Test (
	//Clocks
	input CLOCK_27, CLOCK_50,
	//Keys and Buttons
	input [3:0] KEY,
	input [17:0] SW,
	//7-segment displays and LEDs
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
	output [8:0] LEDG,
	output [17:0] LEDR,
	//Serial
	output UART_TXD,
	input UART_RXD,
	//Outputs that would be for the LCD
	output [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
	output [7:0] w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5,
	//GPIO
	inout [35:0] GPIO_0, GPIO_1
);

assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;

assign LEDG[0] = ~KEY[1];

RegisterFile U0(.wd3(SW[7:0]),.clk(KEY[1]),.we3(SW[17]),.wa3(SW[16:14]),.ra1(SW[13:11]),.ra2(SW[10:8]),.rd1(w_d0x0[7:0]),.rd2(w_d0x1[7:0]));
hex7seg U1(.in(SW[3:0]),.out(HEX0[0:6]));
hex7seg U2(.in(SW[7:4]),.out(HEX1[0:6]));

endmodule
