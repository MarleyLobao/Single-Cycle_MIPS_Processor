module ParallelOUT(input [7:0]Address, RegData,
                   input we, clk,
                   output reg wren,
                   output reg [7:0]DataOut);

  wire register_output, w_flip;

  assign register_output = (Address==8'hFF)? 1:0;

  assign w_flip = we & register_output;

  always@(*) wren = (~register_output) & we;

  always@(posedge clk)
    if(w_flip) DataOut = RegData;

endmodule
