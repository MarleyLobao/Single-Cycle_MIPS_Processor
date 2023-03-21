module InstructionMemory(input [7:0]A,
                         output reg [31:0]RD);

always@(*)
  begin
    case(A)
      8'b00000000: begin
        RD = 32'b001000_00000_00001_00000_00000_000011;
      end
      8'b00000001: begin
        RD = 32'b001000_00000_00010_00000_00000_001001;
      end
      8'b00000010: begin
        RD = 32'b000000_00001_00010_00010_00000_100000;
      end
      8'b00000011: begin
        RD = 32'b000000_00001_00010_00011_00000_100100;
      end
      8'b00000100: begin
        RD = 32'b000000_00001_00010_00100_00000_100101;
      end
      default: begin
        RD = 32'b000000_00000_00000_00000_00000_000000;
      end
    endcase
  end
endmodule
