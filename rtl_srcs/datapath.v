module datapath(
		input [11:0] x,c0,c1,c2,
		input clk,rst,X_ld,Y_ld,mult_s0,mult_s1,sum_ld,sum_clr,
		output [24:0] y
	);
		reg [11:0] Xt0,Xt1,Xt2,cr0,cr1,cr2;
		reg [24:0] y_reg;
		
		wire [11:0] mult_out1,mult_out2;
		wire [11:0] w1,w2;
		wire [24:0] y_wire;
		
		assign w1=12'd0;
		assign w2=12'd0;
		
		mux dut1({Xt0, Xt1, Xt2, w1}, {mult_s1, mult_s0}, mult_out1);
		mux dut2({cr0, cr1, cr2, w2}, {mult_s1, mult_s0}, mult_out2);
		mac_unit dut(mult_out1, mult_out2, clk, sum_clr, sum_ld, y_wire);
		
		always @(posedge clk or posedge rst)
		if (rst) begin
			Xt0 <= 12'd0;
			Xt1 <= 12'd0;
			Xt2 <= 12'd0;
		end 
		else if(X_ld) begin
			Xt0 <= x;
			Xt1 <= Xt0;
			Xt2 <= Xt1;
		end
		
		always @(posedge clk or posedge rst)
		if (rst) begin
			cr0 <= 12'd0;
			cr1 <= 12'd0;
			cr2 <= 12'd0;
		end 
		else begin
			cr0 <= c0;
			cr1 <= c1;
			cr2 <= c2;
		end

		always @(posedge clk or posedge rst)
		if (rst) begin
			y_reg <= 12'd0;
		end 
		else if(Y_ld) begin
			y_reg <= y_wire;
		end
		
		assign y= y_reg;

endmodule