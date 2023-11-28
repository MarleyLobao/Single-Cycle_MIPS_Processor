module ParallelOUT(input [7:0]Address, RegData,
                   input we, clk,
                   output reg wren,
                   output reg [7:0]DataOut);

wire S,w_flip;

assign S = (Address==8'hFF)? 1:0;

assign w_flip = we & S;

always@(*) wren = (~S) & we;

always@(posedge clk)
  if(w_flip) DataOut = RegData;
endmodule
