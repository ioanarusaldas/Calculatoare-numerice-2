`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 21:19:28
// Design Name: 
// Module Name: sim_pipeline
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


module sim_pipeline();
    reg [7:0] a,b,c,d,e,f;
    reg clk,EN,RESET;
    wire [7:0] out;
    pipeline p (out,a,b,c,d,e,f,clk,EN,RESET);
    initial begin
        clk = 1;RESET =0;EN = 1;
        a = 10; b = 10; c = 8; d = 8; e = 0; f = 1;
        #20 a = 10; b = 2; c = 10; d = 2; e = 20; f = 4;
       #20 a = 20; b = 5; c = 3; d = 3; e = 4; f = 2;   
    end
        
    always #10 clk = ~clk; 
    begin
    end

endmodule
