module Signed_Mult(
	input signed [7:0] a,
	input signed [7:0] b,
	output [15:0] p
	);

	assign p = a * b;	
	
endmodule