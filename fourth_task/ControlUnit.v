module ControlUnit(input [5:0]OP, Funct,
	           output reg RegWrite, RegDst, ULASrc, Branch, MemWrite, MemtoReg, Jump,
	           output reg [2:0]ULAControl);

  always@(*) begin
    case(OP)
      6'b000000:
      case(Funct)
        6'b100000://ADD
	  begin
            RegWrite = 1'b1;
            RegDst = 1'b1;
            ULASrc = 1'b0;
            ULAControl = 3'b010;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            Jump = 1'b0;
	    end
        6'b100010://SUB
	  begin
            RegWrite = 1'b1;
            RegDst = 1'b1;
            ULASrc = 1'b0;
            ULAControl = 3'b110;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            Jump = 1'b0;
	  end
        6'b100100://AND
          begin
            RegWrite = 1'b1;
            RegDst = 1'b1;
            ULASrc = 1'b0;
            ULAControl = 3'b000;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            Jump = 1'b0;
          end
          6'b100101://OR
          begin
            RegWrite = 1'b1;
            RegDst = 1'b1;
            ULASrc = 1'b0;
            ULAControl = 3'b001;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            Jump = 1'b0;
          end
          6'b101010://SLT
          begin
            RegWrite = 1'b1;
            RegDst = 1'b1;
            ULASrc = 1'b0;
            ULAControl = 3'b111;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            Jump = 1'b0;
          end
          default:
          begin
            RegWrite = 1'b0;
            //RegDst = 1'b1;
            //ULASrc = 1'b0;
            //ULAControl = 3'b111;
            //Branch = 1'b0;
            MemWrite = 1'b0;
            //MemtoReg = 1'b0;
            Jump = 1'b0;
          end
        endcase
      6'b100011://LW
      begin
        RegWrite = 1'b1;
        RegDst = 1'b0;
        ULASrc = 1'b1;
        ULAControl = 3'b010;
        Branch = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 1'b1;
        Jump = 1'b0;
      end
      6'b101011://SW
      begin
        RegWrite = 1'b0;
        //RegDst = 1'b0;
        ULASrc = 1'b1;
        ULAControl = 3'b010;
        Branch = 1'b0;
        MemWrite = 1'b1;
        //MemtoReg = 1'b1;
        Jump = 1'b0;
      end
      6'b000100://BEQ
      begin
        RegWrite = 1'b0;
        //RegDst = 1'b0;
        ULASrc = 1'b0;
        ULAControl = 3'b110;
        Branch = 1'b1;
        MemWrite = 1'b0;
        //MemtoReg = 1'b1;
        Jump = 1'b0;
      end
      6'b001000://ADDi
      begin
        RegWrite = 1'b1;
        RegDst = 1'b0;
        ULASrc = 1'b1;
        ULAControl = 3'b010;
        Branch = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 1'b0;
        Jump = 1'b0;
      end
      6'b000010://J
      begin
        RegWrite = 1'b0;
        //RegDst = 1'b0;
        //ULASrc = 1'b1;
        //ULAControl = 3'b010;
        //Branch = 1'b0;
        MemWrite = 1'b0;
        //MemtoReg = 1'b1;
        Jump = 1'b1;
      end
      default:
      begin
        RegWrite = 1'b0;
        //RegDst = 1'b1;
        //ULASrc = 1'b0;
        //ULAControl = 3'b111;
        //Branch = 1'b0;
        MemWrite = 1'b0;
        //MemtoReg = 1'b0;
        Jump = 1'b0;
      end
    endcase
  end
endmodule
