`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2020 15:07:59
// Design Name: 
// Module Name: sim_mux
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


module sim_mux();

    reg S0;
    reg [31:0] a, b;
    wire [31:0] Rez;
    mux2_1 mux(a,b,S0,Rez);
    initial begin
    a = 12;b= 10;S0 = 1 ;
     #50 S0 = 0;
    end
endmodule
