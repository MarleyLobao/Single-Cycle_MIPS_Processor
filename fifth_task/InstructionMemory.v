module InstructionMemory(input [7:0]address,
                         input clock,
                         output reg [31:0]q);

  always@(posedge clock) begin
    case(address)
      8'b00000000: begin
        q = 32'b00100000000000010000000000000011;
      end
      8'b00000001: begin
         q = 32'b00100000000000100000000000000000;
      end
      8'b00000010: begin
        q = 32'b00100000010000100000000000000001;
      end
      8'b00000011: begin
        q = 32'b00010000001000100000000000000001;
      end
      8'b00000100: begin
        q = 32'b00001000000000000000000000000010;
      end
      8'b00000101: begin
        q = 32'b10101100000000100000000000001001;
      end
      8'b00000110: begin
        q = 32'b10001100000001010000000000001001;
      end
      8'b00000111: begin
        q = 32'b00000000001001010010100000100000;
      end
      8'b00001000: begin
        q = 32'b00000000001001010001100000100100;
      end
      8'b00001001: begin
        q = 32'b00000000001001010010000000100101;
      end
      8'b00001010: begin
        q = 32'b00001000000000000000000000001010;
      end
      default: begin
        q = 32'b00000000000000000000000000000000;
      end
    endcase
  end

endmodule
