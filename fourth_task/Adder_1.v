module Adder_1(input [7:0]A,
               output reg [7:0]S);

  always@(*) begin
    S = A + 1'b1;
  end

endmodule
