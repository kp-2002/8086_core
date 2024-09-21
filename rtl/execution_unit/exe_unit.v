module reg_file(
	input      clk,
	input      rst_n,
	input      w_en,
	input      raddr1[4:0],
	input      raddr2[4:0]
	input      waddr [4:0],
	input      wdata [63:0],
	output reg rdata1[63:0],
	output reg rdata2[63:0]
);

	reg [63:0] rf [1:31];

	always @(posedge clk) begin
		if(~rst_n) begin
			for(int i=1;i<32;i++)
				rf[i] <= 64'b0;
			rdata1 <= 64'b0;
			rdata2 <= 64'b0;
		end
		else begin
			if(w_en)
				rf[waddr] <= wdata;
			rdata1 <= (raddr1 != 32'b0) ? rf[raddr1]: 64'b0;
			rdata2 <= (raddr2 != 32'b0) ? rf[raddr2]: 64'b0;
		end
	end

endmodule
