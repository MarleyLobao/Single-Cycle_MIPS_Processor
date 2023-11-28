module ULA(input [7:0]SrcA, SrcB,
           input [2:0]ULAControl,
           output reg[7:0]ULAResult,
           output reg FlagZ);

  always@(*) begin
    case(ULAControl)
      3'b010:ULAResult=SrcA+SrcB;
      3'b110:ULAResult=SrcA+(~SrcB)+1'b1;
      3'b000:ULAResult=SrcA&SrcB;
      3'b001:ULAResult=SrcA|SrcB;
      3'b111:ULAResult=(SrcA<SrcB)?8'b1:8'b0;
      default: ULAResult=8'b0;
    endcase

    if(ULAResult==8'b0)
      FlagZ = 1'b1;
    else
      FlagZ = 1'b0;
  end

endmodule
