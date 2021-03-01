`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 15:58:29
// Design Name: 
// Module Name: mux_21
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


module mux_21(out,I0,I1,S);
    input I0;
    input I1;
    input S;
    output out;
    
    wire and1;
    wire and2;
    wire not_S;
    //!SI0 + SI1
    not(not_S,S);
    and(and1,I0,not_S);
    and(and2,I1,S);
    or(out,and1,and2);
    
endmodule
