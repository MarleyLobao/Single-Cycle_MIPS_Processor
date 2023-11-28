module DataMem(input clk,
               input [7:0] addr,
               input [7:0] data,
               input wren,
               output [7:0] q);
 
  reg [7:0] tmp_data;
  reg [7:0] mem [256];
  
  always @ (posedge clk) begin
    if(wren)
      mem[addr] <= data;
    else
      tmp_data <= mem[addr];
  end
  
  assign q = wren ? 'hz : tmp_data;
endmodule
