`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 20:38:20
// Design Name: 
// Module Name: reg_pipeline
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_pipeline(rin,rout,reset,en,clk);
    //output rout;
    output reg [7:0] rout;
    input [7:0] rin;
    input reset,en,clk;
    always @(posedge clk)
        if (reset)
            rout <= 0;
        else    if (en)
            rout <= rin;
endmodule
