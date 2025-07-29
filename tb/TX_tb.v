module TX_tb ();
//input and output
	reg clk,reset,transmit;
	reg [7:0]TxData;
	wire TxD,busy;

//DUT
TX DUT(.clk(clk),.reset(reset),.transmit(transmit),.TxData(TxData),
.TxD(TxD),.busy(busy));

//clk
initial
begin
clk=0;
forever 
#10 clk=~clk;
end

//test
initial
begin
	TxData=8'b1101_1001;
	#10;
	reset=1;
	#10;
	reset=0;
	#20;
	@(negedge clk)
	transmit=1;
	@(negedge clk)
	transmit=0;
	#5000;
	$stop;
end
//monitor
initial
	$monitor("reset=%b,transmit=%b,TxData=%b,TxD=%b,busy=%b",reset,transmit,TxData,TxD,busy);
endmodule




