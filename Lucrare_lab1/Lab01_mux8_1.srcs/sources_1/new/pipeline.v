`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 21:04:19
// Design Name: 
// Module Name: pipeline
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


module pipeline(Rez,a,b,c,d,e,f,clk,en,reset);
    input clk,en,reset; 
    input [7:0] a;
    input [7:0] b;
    input [7:0] c;
    input [7:0] d;
    input [7:0] e;
    input [7:0] f;
    
    output [7:0] Rez;
    wire [7:0] r1,r2,r3,r4,r5,r6,out1,out2,out3,out4,out5;
    
    stage1 s1(out1,out2,out3,a,b,c,d,e,f);
    reg_pipeline reg1(out1,r1,reset,en,clk);
    reg_pipeline reg2(out2,r2,reset,en,clk);
    reg_pipeline reg3(out3,r3,reset,en,clk);
    
    stage2 s2(out4,r1,r2);
    reg_pipeline reg4(out4,r4,reset,en,clk);
    reg_pipeline reg6(r3,r6,reset,en,clk);
    
    stage3 s3(out5,r4,r6);
    reg_pipeline reg5(out5,r5,reset,en,clk);
    assign Rez = out5;
     
endmodule
