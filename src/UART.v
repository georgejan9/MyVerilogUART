module UART (
    input clk,reset,transmit,
    input [7:0] TxData,
    output [7:0] RxData,
    output valid_rx,Parity_error,Stop_error,busy
);
wire clk_RX,clk_TX,TxD;

//BaudRateGenerator
BaudRateGenerator BaudRateGenerator(.clk(clk),.reset(reset),.clk_TX(clk_TX),.clk_RX(clk_RX));

//TX
TX TX(.clk(clk_TX),.reset(reset),.transmit(transmit),.TxData(TxData),.TxD(TxD),.busy(busy));

//RX
RX RX (.clk(clk_RX),.reset(reset),.RxD(TxD),.valid_rx(valid_rx),.Parity_error(Parity_error),
.Stop_error(Stop_error),.RxData(RxData));
endmodule 
