module DCT_4Point(
	//input i_clk,
	//input i_clr,
	
	input [7:0] i_data0,
	input [7:0] i_data1,
	input [7:0] i_data2,
	input [7:0] i_data3,

	output [15:0] o_data0,
	output [15:0] o_data1,
	output [15:0] o_data2,
	output [15:0] o_data3
	);
	
	// DCT matrix data
	reg signed [7:0] r_c00 = 8'h08; //0.5
	reg signed [7:0] r_c01 = 8'h08; //0.5
	reg signed [7:0] r_c02 = 8'h08; //0.5
	reg signed [7:0] r_c03 = 8'h08; //0.5

	reg signed [7:0] r_c10 = 8'h0A; //0.653
	reg signed [7:0] r_c11 = 8'h04; //0.2705
	reg signed [7:0] r_c12 = 8'hFC; //-0.2705
	reg signed [7:0] r_c13 = 8'hF6; //-0.653
 
	reg signed [7:0] r_c20 = 8'h08; //0.5
	reg signed [7:0] r_c21 = 8'hF8; //-0.5
	reg signed [7:0] r_c22 = 8'hF8; //-0.5
	reg signed [7:0] r_c23 = 8'h08; //0.5

	reg signed [7:0] r_c30 = 8'h04; //0.2705
	reg signed [7:0] r_c31 = 8'hF6; //-0.653
	reg signed [7:0] r_c32 = 8'h0A; //0.653
	reg signed [7:0] r_c33 = 8'hFC; //-0.2705
	
	// Internal wires
	wire signed [15 : 0] w_M00;
	wire signed [15 : 0] w_M01;
	wire signed [15 : 0] w_M02;
	wire signed [15 : 0] w_M03;
	wire signed [15 : 0] w_F0;

	wire signed [15 : 0] w_M10;
	wire signed [15 : 0] w_M11;
	wire signed [15 : 0] w_M12;
	wire signed [15 : 0] w_M13;
	wire signed [15 : 0] w_F1;
	
	wire signed [15 : 0] w_M20;
	wire signed [15 : 0] w_M21;
	wire signed [15 : 0] w_M22;
	wire signed [15 : 0] w_M23;
	wire signed [15 : 0] w_F2;
	
	wire signed [15 : 0] w_M30;
	wire signed [15 : 0] w_M31;
	wire signed [15 : 0] w_M32;
	wire signed [15 : 0] w_M33;
	wire signed [15 : 0] w_F3;
	
	
	// Calculate o_data0
	Signed_Mult Signed_Mult_inst00 (
		//.clk(i_clk), // input clk
		.a(r_c00), // input [7 : 0] a
		.b(i_data0), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M00) // output [15 : 0] p
	);
	
	Signed_Mult Signed_Mult_inst01 (
		//.clk(i_clk), // input clk
		.a(r_c01), // input [7 : 0] a
		.b(i_data0), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M01) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst02 (
		//.clk(i_clk), // input clk
		.a(r_c02), // input [7 : 0] a
		.b(i_data0), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M02) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst03 (
		//.clk(i_clk), // input clk
		.a(r_c03), // input [7 : 0] a
		.b(i_data0), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M03) // output [15 : 0] p
	);
	
	assign w_F0 = w_M00 + w_M01 + w_M02 + w_M03;
	assign o_data0 = w_F0;
	
	
	// Calculate o_data1
	Signed_Mult Signed_Mult_inst10 (
		//.clk(i_clk), // input clk
		.a(r_c10), // input [7 : 0] a
		.b(i_data0), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M10) // output [15 : 0] p
	);
	
	Signed_Mult Signed_Mult_inst11 (
		//.clk(i_clk), // input clk
		.a(r_c11), // input [7 : 0] a
		.b(i_data1), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M11) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst12 (
		//.clk(i_clk), // input clk
		.a(r_c12), // input [7 : 0] a
		.b(i_data2), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M12) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst13 (
		//.clk(i_clk), // input clk
		.a(r_c13), // input [7 : 0] a
		.b(i_data3), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M13) // output [15 : 0] p
	);
	
	assign w_F1 = w_M10 + w_M11 + w_M12 + w_M13;
	assign o_data1 = w_F1;


	// Calculate o_data2
	Signed_Mult Signed_Mult_inst20 (
		//.clk(i_clk), // input clk
		.a(r_c20), //  input [7 : 0] a
		.b(i_data0), //input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M20) // output [15 : 0] p
	);
	
	Signed_Mult Signed_Mult_inst21 (
		//.clk(i_clk), // input clk
		.a(r_c21), // input [7 : 0] a
		.b(i_data1), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M21) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst22 (
		//.clk(i_clk), // input clk
		.a(r_c22), // input [7 : 0] a
		.b(i_data2), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M22) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst23 (
		//.clk(i_clk), // input clk
		.a(r_c23), // input [7 : 0] a
		.b(i_data3), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M23) // output [15 : 0] p
	);
	
	assign w_F2 = w_M20 + w_M21 + w_M22 + w_M23;
	assign o_data2 = w_F2;

	
	// Calculate o_data3
	Signed_Mult Signed_Mult_inst30 (
		//.clk(i_clk), // input clk
		.a(r_c30), // input [7 : 0] a
		.b(i_data0), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M30) // output [15 : 0] p
	);
	
	Signed_Mult Signed_Mult_inst31 (
		//.clk(i_clk), // input clk
		.a(r_c31), // input [7 : 0] a
		.b(i_data1), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M31) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst32 (
		//.clk(i_clk), // input clk
		.a(r_c32), // input [7 : 0] a
		.b(i_data2), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M32) // output [15 : 0] p
	);

	Signed_Mult Signed_Mult_inst33 (
		//.clk(i_clk), // input clk
		.a(r_c33), // input [7 : 0] a
		.b(i_data3), // input [7 : 0] b
		//.sclr(i_clr), // input sclr
		.p(w_M33) // output [15 : 0] p
	);
	
	assign w_F3 = w_M30 + w_M31 + w_M32 + w_M33;
	assign o_data3 = w_F3;
      
endmodule

