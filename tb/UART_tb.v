`timescale 1ns/100ps

module UART_tb ();
    reg clk,reset,transmit;
    reg [7:0] TxData;
    wire [7:0] RxData;
    wire valid_rx,Parity_error,Stop_error,busy;

//DUT
UART DUT (.clk(clk),.reset(reset),.transmit(transmit),.busy(busy),.TxData(TxData),
.RxData(RxData),.valid_rx(valid_rx),.Parity_error(Parity_error),.Stop_error(Stop_error));

//clk
initial
begin
clk=0;
forever 
#31.25 clk=~clk;
end

initial
begin

reset =1;
#40000
reset=0;
TxData=8'b1010_0011;
#40000
transmit=1'b1;
#40000
transmit=1'b0;
#500000000;
$stop;
end
endmodule

