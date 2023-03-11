module MUX2_1(input [7:0]A,B,input Sel,output reg[7:0]Y);

always@(*)
begin
		case(Sel)
			1'b0: Y=A;
			1'b1: Y=B;
		endcase
end

endmodule
