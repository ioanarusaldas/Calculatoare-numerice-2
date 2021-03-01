`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 16:05:46
// Design Name: 
// Module Name: Sim_mux81
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


module Sim_mux81();
    reg S0,S1,S2;
    reg [7:0] number;
    wire Rez;
    mux_81 mux(Rez,number,S0,S1,S2);
    initial begin
    number = 8'b00110101;
     S2 = 0; S1 = 0; S0 = 0 ;
     #100 S2 = 0; S1 = 0; S0 = 1 ;
     #100 S2 = 0; S1 = 1; S0 = 0 ;
     #100 S2 = 0; S1 = 1; S0 = 1 ;
     #100 S2 = 1; S1 = 0; S0 = 0 ;
     #100 S2 = 1; S1 = 0; S0 = 1 ;
     #100 S2 = 1; S1 = 1; S0 = 0 ;
     #100 S2 = 1; S1 = 1; S0 = 1 ;
    end
endmodule
