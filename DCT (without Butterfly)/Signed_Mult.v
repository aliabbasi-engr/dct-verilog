module Signed_Mult(
  input [7:0] i_a,
  input [7:0] i_b,
  output [15:0] o_result
  );
  
  reg [7:0] r_a_inc;
  reg [7:0] r_b_inc;
  reg [15:0] r_temp;
  reg [15:0] r_result;

  assign o_result = r_result;
 
  always @*
  begin
  	case ({i_a[7], i_b[7]})
  		
  		2'b00 :
  		begin
			r_temp = i_a * i_b;
			r_result = r_temp >> 6;
		end  
				  
  		2'b01 :
  		begin
  			r_b_inc = (~i_b) + 1;
			r_temp = i_a * r_b_inc;
			r_result = (~r_temp) + 1;
		end
				  
  		2'b10 :
  		begin
  		    r_a_inc = (~i_a) + 1;
			r_temp = r_a_inc * i_b;
			r_temp = r_temp >> 6;
			r_result = (~r_temp) + 1;
		end
				  
  		2'b11 :
  		begin
			r_a_inc = (~i_a) + 1;
  		    r_b_inc = (~i_b) + 1;
			r_result = r_a_inc * r_b_inc;
		end
  		
  		default :
  		begin
			r_result = i_a * i_b;
		end 

  	endcase
  end


endmodule
