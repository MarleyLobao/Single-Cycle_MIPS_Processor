`include "RegisterFile.v"
`include "ULA.v"
`include "MUX2_1.v"
`include "Adder_1.v"
`include "InstructionMemory.v"
`include "ControlUnit.v"
`include "ProgramCounter.v"
`include "DataMem.v"
`include "Div_Freq.v"
`include "Adder_Branch.v"

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
  inout [35:0] GPIO_0, GPIO_1);

  assign GPIO_1 = 36'hzzzzzzzzz;
  assign GPIO_0 = 36'hzzzzzzzzz;

  wire w_ULASrc, w_RegWrite, w_RegDst, w_MemtoReg, w_MemWrite, w_PCSrc, w_Jump, w_Branch, w_Z, clk10MHz;
  wire [2:0]w_ULAControl, w_wa3;
  wire [7:0]w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_wd3, w_RData, w_m1, w_nPC, w_PCBranch;
  wire [31:0]w_Inst;

  Div_Freq U0(.clk_in(CLOCK_50),
              .rst(SW[0]),
              .clk_out(clk10MHz));

  ProgramCounter U1(.PCin(w_nPC[7:0]),
                    .clk(clk10MHz),
                    .rst(SW[1]),
                    .PC(w_PC[7:0]));

  Adder_1 U2(.A(w_PC[7:0]),
             .S(w_PCp1[7:0]));

  Adder_Branch U3(.A(w_PCp1[7:0]),
                  .B(w_Inst[7:0]),
                  .S(w_PCBranch[7:0]));

  MUX2_1 U4(.A(w_PCp1[7:0]),
            .B(w_PCBranch[7:0]),
            .Sel(w_PCSrc),
            .Y(w_m1[7:0]));

  MUX2_1 U5(.A(w_m1[7:0]),
            .B(w_Inst[7:0]),
            .Sel(w_Jump),
            .Y(w_nPC[7:0]));

  ControlUnit U6(.OP(w_Inst[31:26]),
                 .Funct(w_Inst[5:0]),
                 .RegWrite(w_RegWrite),
                 .RegDst(w_RegDst),
                 .ULASrc(w_ULASrc),
                 .ULAControl(w_ULAControl[2:0]),
                 .Branch(w_Branch),
                 .MemWrite(w_MemWrite),
                 .MemtoReg(w_MemtoReg),
                 .Jump(w_Jump));

  MUX2_1 U7(.A(w_rd2[7:0]),
            .B(w_Inst[7:0]),
            .Sel(w_ULASrc),
            .Y(w_SrcB[7:0]));

  MUX2_1 U8(.A(w_Inst[20:16]),
            .B(w_Inst[15:11]),
            .Sel(w_RegDst),
            .Y(w_wa3[2:0]));

  RegisterFile U9(.wd3(w_wd3[7:0]),
                  .clk(clk10MHz),
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

  ULA U10(.SrcA(w_rd1SrcA[7:0]),
          .SrcB(w_SrcB[7:0]),
          .ULAResult(w_ULAResultWd3[7:0]),
          .ULAControl(w_ULAControl[2:0]),
          .FlagZ(w_Z));

  InstructionMemory U11(.address(w_PC[7:0]),
                        .clock(CLOCK_50),
                        .q(w_Inst[31:0]));

  DataMem U12(.addr(w_ULAResultWd3[7:0]),
              .clk(CLOCK_50),
              .data(w_rd2[7:0]),
              .wren(w_MemWrite),
              .q(w_RData[7:0]));

  MUX2_1 U13(.A(w_ULAResultWd3[7:0]),
             .B(w_RData[7:0]),
             .Sel(w_MemtoReg),
             .Y(w_wd3[7:0]));
 
  assign w_PCSrc = w_Branch & w_Z;
  assign LEDG[8] = ~clk10MHz;
  assign w_d0x4 = w_PC;

endmodule
