`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 20:41:40
// Design Name: 
// Module Name: stage1
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


module stage1(out1,out2,out3,a,b,c,d,e,f);
    input [7:0] a;
    input [7:0] b;
    input [7:0] c;
    input [7:0] d;
    input [7:0] e;
    input [7:0] f;
    output [7:0] out1;
    output [7:0] out2;
    output [7:0] out3;
    
     
    assign out1  = a / b;
    assign out2 = c / d;
    assign out3 = e / f;
    
   
    
endmodule
