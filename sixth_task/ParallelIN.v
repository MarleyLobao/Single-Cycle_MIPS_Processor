module ParallelIN(input [7:0]MemData, DataIn, Address,
                  output [7:0]RegData);

wire S;

assign S = (Address==8'hFF)? 1:0;
  
MUX2_1 U0(.A(MemData[7:0]),
          .B(DataIn[7:0]),
          .Sel(S),
          .Y(RegData[7:0]));

endmodule
