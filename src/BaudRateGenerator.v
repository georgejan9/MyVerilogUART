module BaudRateGenerator (
    input clk,reset,
    output reg clk_TX,clk_RX
);
reg [15:0] counter_TX,counter_RX;
always @ (posedge clk or posedge reset)
begin
    if (reset==1'b1)
        begin
            counter_TX<=16'd0;
            counter_RX<=16'd0;
            clk_RX<=1'b0;
            clk_TX<=1'b0;
        end
    else
    begin
    if (counter_TX == 16'd833 )
        begin
            clk_TX<=~clk_TX;
            counter_TX<=16'd0;
        end
    else 
        counter_TX<=counter_TX+16'd1;
    
        if (counter_RX == 16'd52)
        begin
            clk_RX<=~clk_RX;
            counter_RX<=16'd0;
        end
    else 
        counter_RX<=counter_RX+16'd1;
    end
end

endmodule
