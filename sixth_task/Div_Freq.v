module Div_Freq(input clk_in,
                input rst,
                output reg clk_out);

  reg [3:0]cont;
 
  always@(posedge clk_in) begin
    cont = cont + 1'b1;

    if(cont == 5) begin // 50MHz/5 = 10MHz
      clk_out = ~clk_out;
      cont = '0;
    end
 
    if(~rst) begin
      cont = '0;
      clk_out = 1'b0;
    end
  end

endmodule
