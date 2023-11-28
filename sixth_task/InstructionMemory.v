module InstructionMemory(input [7:0]address,
                         input clock,
                         output reg [31:0]q);

  always@(posedge clock)
    begin
      case(address)
        8'b00000000: begin
          q = 32'b10001100000000010000000011111111;
        end
        8'b00000001: begin
          q = 32'b10101100000000010000000000001001;
        end
        8'b00000010: begin
          q = 32'b10001100000000100000000000001001;
        end
        8'b00000011: begin
          q = 32'b10101100000000100000000011111111;
        end
        8'b00000100: begin
          q = 32'b00001000000000000000000000000000;
        end
        default: begin
          q = 32'b00000000000000000000000000000000;
        end
      endcase
    end

endmodule
