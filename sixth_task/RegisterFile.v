module RegisterFile(input [7:0] wd3,
                    input clk, we3,
                    input [2:0] wa3, ra1, ra2,
                    output wire [7:0] s0,
                    output reg [7:0] rd1, rd2, s1, s2, s3, s4, s5, s6, s7);

  assign s0 = 0;

  always@(posedge clk) begin
    if(we3)
      case(wa3)
        3'b001:s1=wd3;
        3'b010:s2=wd3;
        3'b011:s3=wd3;
        3'b100:s4=wd3;
        3'b101:s5=wd3;
        3'b110:s6=wd3;
        3'b111:s7=wd3;
      endcase
  end
 
  always@(*) begin
    case(ra1)
      3'b000:rd1=s0;
      3'b001:rd1=s1;
      3'b010:rd1=s2;
      3'b011:rd1=s3;
      3'b100:rd1=s4;
      3'b101:rd1=s5;
      3'b110:rd1=s6;
      3'b111:rd1=s7;
    endcase
    case(ra2)
      3'b000:rd2=s0;
      3'b001:rd2=s1;
      3'b010:rd2=s2;
      3'b011:rd2=s3;
      3'b100:rd2=s4;
      3'b101:rd2=s5;
      3'b110:rd2=s6;
      3'b111:rd2=s7;
    endcase
  end

endmodule
