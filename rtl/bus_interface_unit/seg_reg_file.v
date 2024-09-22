module seg_reg_file(
	input             clk,
	//clock
	input             rst,
	//reset
	input      [1:0]  wr_addr,
	//selects the address of segment register to be written to
	input             wr_en,
	//enables a write operation to the selected register
	input      [15:0] wr_data,
	//supplies data to be written to the selected register 
	input      [1:0]  rd_addr,
	//selects the address of segment register to be read from
	input             rd_en,
	//enables a read operation from the selected register
	output reg [15:0] rd_data
	//supplies data read from the selected register
	);

	reg [15:0] code_seg_reg;
	reg [15:0] data_seg_reg;
	reg [15:0] extra_seg_reg;
	reg [15:0] stack_seg_reg;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			//do reset
			code_seg_reg  <= 16'b0;
			data_seg_reg  <= 16'b0;
			extra_seg_reg <= 16'b0; 
			stack_seg_reg <= 16'b0; 
		end
		else begin
			if(wr_en) begin
				case(wr_sel)
					2'b00: code_seg_reg  <= wr_data;
					2'b01: data_seg_reg  <= wr_data;
					2'b10: extra_seg_reg <= wr_data; 
					2'b11: stack_seg_reg <= wr_data; 
				endcase
			end
			if(rd_en) begin
				case(rd_sel)
					2'b00: rd_data <= code_seg_reg;
					2'b01: rd_data <= data_seg_reg; 
					2'b10: rd_data <= extra_seg_reg; 
					2'b11: rd_data <= stack_seg_reg; 
				endcase
			end
		end
	end

endmodule
