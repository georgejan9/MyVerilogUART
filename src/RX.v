module RX (
    input clk,reset,RxD,
    output reg valid_rx,
    output Parity_error,Stop_error,
    output [7:0] RxData
);
reg [10:0] RX_reg;
wire parity ;
reg [3:0]RX_counter,clk_counter;

assign parity =^RX_reg[8:1];
assign Parity_error=(parity ^ RX_reg[9]);
assign Stop_error=~RX_reg[10];
assign RxData=RX_reg[8:1];

always @ (posedge clk or posedge reset)
begin

	if (reset==1'b1)
	begin
		RX_reg<=11'b000_0000_0000;
        valid_rx<=1'b0;
		RX_counter<=4'b0000;
	end
	else if (clk_counter == 4'b1000)
	begin 

		if (RxD == 1'b0 && RX_counter==4'b0000)
		begin
			RX_counter<=4'b0001;
            RX_reg[10]<=1'b0;
            valid_rx<=1'b0; 
		end
        else if (RX_counter != 4'b0000)
        begin
			if (RX_counter <4'd11)
			begin
				RX_counter<=RX_counter+4'b0001;
				RX_reg[10]<=RxD;
				RX_reg[9:0]<=RX_reg[10:1];
			end
			else
			begin
				RX_counter<=4'b0000;
                valid_rx<=1'b1; 
			end
        end
	end
end
always @ (posedge clk or posedge reset)
	begin
	if (reset==1'b1)
		clk_counter<=4'b0000;
	else if (clk_counter == 4'd15)
		clk_counter<=4'b0000;	
	else 
		clk_counter<=(clk_counter + 4'b0001);
	end
endmodule
