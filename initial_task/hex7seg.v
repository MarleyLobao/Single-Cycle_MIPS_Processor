module hex7seg (
	input [3:0] in,
	output reg [0:6] out
);

always @(*) begin
	case(in)
		4'h0: out = 7'h01;
		4'h1: out = 7'h4F;
		4'h2: out = 7'h12;
		4'h3: out = 7'h06;
		4'h4: out = 7'h4C;
		4'h5: out = 7'h24;
		4'h6: out = 7'h20;
		4'h7: out = 7'h0F;
		4'h8: out = 7'h00;
		4'h9: out = 7'h04;
		4'hA: out = 7'h08;
		4'hB: out = 7'h60;
		4'hC: out = 7'h31;
		4'hD: out = 7'h42;
		4'hE: out = 7'h30;
		4'hF: out = 7'h38;
	endcase
end
endmodule
