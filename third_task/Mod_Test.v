`include "RegisterFile.v"
`include "ULA.v"
`include "MUX2_1.v"

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

wire [7:0]w_rd1SrcA,w_rd2,w_SrcB,w_ULAResultWd3;
wire [7:0]Constant_in;

assign Constant_in[7:0] = 8'h07;

RegisterFile U0(.wd3(SW[7:0]),.clk(KEY[3]),.we3(1'b1),.wa3(SW[16:14]),.ra1(SW[13:11]),.ra2(3'b010),.rd1(w_rd1SrcA[7:0]),.rd2(w_rd2[7:0]));
MUX2_1 U1(.A(w_rd2[7:0]),.B(Constant_in[7:0]),.Sel(SW[17]),.Y(w_SrcB[7:0]));
ULA U2(.SrcA(w_rd1SrcA[7:0]),.SrcB(w_SrcB[7:0]),.ULAControl(SW[10:8]),.ULAResult(w_ULAResultWd3[7:0]),.FlagZ(LEDG[0]));

assign LEDG[8] = KEY[3];
assign w_d0x0[7:0]=w_rd1SrcA[7:0];
assign w_d1x0[7:0]=w_rd2[7:0];
assign w_d1x1[7:0]=w_SrcB[7:0];
assign w_d0x4[7:0]=w_ULAResultWd3[7:0];

endmodule