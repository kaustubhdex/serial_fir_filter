module mux (inp, sel, out);

	input [3:0] inp;
	input [1:0] sel;
	output reg out;
	
	always@(inp,sel)
	begin
	
	case(sel)
		2'd0: out <= inp[0];
		2'd1: out <= inp[1];
		2'd2: out <= inp[2];
		2'd3: out <= inp[3];
		default: out <= 1'b0;
	endcase
	
	end

endmodule