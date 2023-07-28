module mac_unit(
    input [12:0] a_in, b_in,
	 input clk, sum_clr, sum_ld,
    output [23:0] sum_out
    );
		reg [23:0] sum_reg;
		wire [23:0] sum_wire1, sum_wire2;
		wire [23:0] interc;
		
		
		assign chash = 1'b0;
		
		multiplier dut1 (a_in, b_in, interc);
		full_adder dut2 (interc, sum_wire1, sum_wire2);
		
		always @ (negedge sum_clr or posedge clk)
			begin
			// Reset whenever the reset signal goes low, regardless of the clock
			// or the clock enable
			if (!sum_clr)
			begin
				sum_reg <= 24'd0;
			end
			// If not resetting, and the clock signal is enabled on this register,
			// update the register output on the clock's rising edge
			else
			begin
				if (clk & sum_ld)
				begin
					sum_reg <= sum_wire2;
				end
				else begin
					sum_reg <= 24'd0;
				end
			end
			end

		assign sum_wire1 = sum_reg;
		assign sum_out = sum_wire1;
		
endmodule