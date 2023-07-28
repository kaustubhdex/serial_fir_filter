module serial_fir_filter(
		input clk,rst,
		input [11:0] c0,c1,c2,x,
		output [24:0] y
);
      //mult_s0,mult_s1,
		wire X_ld,Y_ld,sum_ld,sum_clr;
		wire [1:0] mult_sel;
		datapath dut1 (x,c0,c1,c2,clk,rst,X_ld,Y_ld,mult_sel[0],mult_sel[1],sum_clr,sum_ld,y);
		controller dut2 (clk,rst,X_ld,Y_ld,sum_ld,sum_clr,mult_sel);
endmodule