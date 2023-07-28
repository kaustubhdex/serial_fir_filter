module serial_fir_filter_tb();

reg clk,rst;
reg [11:0] c0,c1,c2,x;

wire [24:0] y;
serial_fir tb(clk,rst,c0,c1,c2,x,y);
initial
	begin
		clk=1'd0;
		rst=1'd1;
		c0=12'd0;
		c1=12'd0;
		c2=12'd0;
		x=12'd0;
	end
always #10 c0 = c0+12'd1;
always #10 c1 = c1+12'd1;
always #10 c2 = c2+12'd1;
always #10 x = x+12'd1;
always #5 clk = ~clk;
always #100 rst = ~rst;

endmodule