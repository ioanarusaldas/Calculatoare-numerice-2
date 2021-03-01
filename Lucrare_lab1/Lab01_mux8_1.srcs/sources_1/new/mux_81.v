`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 16:09:40
// Design Name: 
// Module Name: mux_81
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


module mux_81(out,number,S0,S1,S2);
    input [7:0]number;
    input S0,S1,S2;
    output out;
    
    wire out1,out2,out3,out4;
    wire out21,out22;
    
    //first 4 mux 2:1
    mux_21 mux1(out1,number[7],number[6],S0);
    mux_21 mux2(out2,number[5],number[4],S0);
    mux_21 mux3(out3,number[3],number[2],S0);
    mux_21 mux4(out4,number[1],number[0],S0);
    
    //2 mux 2:1
    mux_21 mux5(out21,out1,out2,S1);
    mux_21 mux6(out22,out3,out4,S1);
    
    //1 mux 2:1
    mux_21 mux7(out,out21,out22,S2);
    
endmodule
