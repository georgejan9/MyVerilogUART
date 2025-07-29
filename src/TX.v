module TX (
	input clk,reset,transmit,
	input [7:0]TxData,
	output reg TxD,busy
);
reg [10:0] TX_reg;
reg [3:0] busy_counter;
wire parity ;
assign parity =^TxData;
always @ (posedge clk or posedge reset)
begin

	if (reset==1'b1)
		TX_reg<=11'b000_0000_0000;
	else
	begin
		if (transmit == 1'b1)
		begin
			TX_reg<={1'b1,parity,TxData,1'b0}; 
			busy_counter<=4'b0001;
		end
		else if (busy_counter !=4'b0000)
		begin
			if (busy_counter <4'd12)
			begin
				busy_counter<=busy_counter+4'b0001;
				TxD<=TX_reg[0];
				TX_reg[9:0]<=TX_reg[10:1];
				TX_reg[10]<=1'b1;
				busy<=1'b1;
			end
			else
			begin
				busy_counter<=4'b0000;
				busy<=1'b0;
			end
		end
		else
			TX_reg<={1'b1,parity,TxData,1'b0}; 

	end
end

endmodule
