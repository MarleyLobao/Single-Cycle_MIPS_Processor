module ProgramCounter(input [7:0]PCin,
                      input clk, rst,
                      output reg [7:0]PC);

  always@(posedge clk) begin
    if(~rst)
      PC = 0;
    else
      PC = PCin;
  end

endmodule
