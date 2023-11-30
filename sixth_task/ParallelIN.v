module ParallelIN(input [7:0]MemData, DataIn, Address,
                  output [7:0]RegData);

  wire external_input;

  assign external_input = (Address==8'hFF)? 1:0;

  MUX2_1 U0(.A(MemData[7:0]),
            .B(DataIn[7:0]),
            .Sel(external_input),
            .Y(RegData[7:0]));

endmodule
