module BaudRateGenerator_tb ();

    reg clk,reset;
    wire clk_TX,clk_RX;

//DUT
BaudRateGenerator DUT (.clk(clk),.reset(reset),.clk_TX(clk_TX),.clk_RX(clk_RX));

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
#31.25
reset=0;
#500000000;
$stop;
end
endmodule
