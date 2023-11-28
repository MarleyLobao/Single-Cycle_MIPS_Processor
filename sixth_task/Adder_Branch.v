module Adder_Branch(input [7:0]A, B,
                    output reg [7:0]S);

  always@(*)
    S = A + B;
endmodule
