`include "RegisterFile.v"
`include "ULA.v"
`include "MUX2_1.v"
`include "Adder_1.v"
`include "InstructionMemory.v"
`include "ControlUnit.v"
`include "ProgramCounter.v"

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
  
  wire w_ULASrc, w_RegWrite, w_RegDst;
  wire [2:0]w_ULAControl, w_wa3;
  wire [7:0]w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3;
  wire [31:0]w_Inst;
  
  ProgramCounter U0(.PCin(w_PCp1[7:0]),
                    .clk(KEY[1]),
                    .PC(w_PC[7:0]),
                    .rst(SW[0]));
  
  Adder_1 U1(.A(w_PC[7:0]),
             .S(w_PCp1[7:0]));
    
  InstructionMemory U2(.A(w_PC[7:0]),
                       .RD(w_Inst[31:0]));
  
  ControlUnit U3(.OP(w_Inst[31:26]),
                 .Funct(w_Inst[5:0]),
                 .RegWrite(w_RegWrite),
                 .RegDst(w_RegDst),
                 .ULASrc(w_ULASrc),
                 .ULAControl(w_ULAControl[2:0]));
  
  MUX2_1 U4(.A(w_rd2[7:0]),
            .B(w_Inst[7:0]),
            .Sel(w_ULASrc),
            .Y(w_SrcB[7:0]));
  
  MUX2_1 U5(.A(w_Inst[20:16]),
            .B(w_Inst[15:11]),
            .Sel(w_RegDst),
            .Y(w_wa3[2:0]));
  
  RegisterFile U6(.wd3(w_ULAResultWd3[7:0]),
                  .clk(KEY[1]),
                  .we3(w_RegWrite),
                  .wa3(w_wa3[2:0]),
                  .ra1(w_Inst[25:21]),
                  .ra2(w_Inst[20:16]),
                  .rd1(w_rd1SrcA[7:0]),
                  .rd2(w_rd2[7:0]),
                  .s0(w_d0x0[7:0]),
                  .s1(w_d0x1[7:0]),
                  .s2(w_d0x2[7:0]),
                  .s3(w_d0x3[7:0]),
                  .s4(w_d1x0[7:0]),
                  .s5(w_d1x1[7:0]),
                  .s6(w_d1x2[7:0]),
                  .s7(w_d1x3[7:0]));
  
  ULA U7(.SrcA(w_rd1SrcA[7:0]),
         .SrcB(w_SrcB[7:0]),
         .ULAResult(w_ULAResultWd3[7:0]),
         .ULAControl(w_ULAControl[2:0]));
  
  assign w_d0x4[7:0]= w_PC[7:0];
  
  assign LEDG[7] = ~KEY[1];
  
  assign LEDR[9] = w_RegWrite;
  assign LEDR[8] = w_RegDst;
  assign LEDR[7] = w_ULASrc;
  assign LEDR[6:4] = w_ULAControl;
  
  assign w_d0x5 = w_ULAResultWd3;
  assign w_d1x4 = w_SrcB;
  assign w_d1x5 = w_wa3;

endmodule
