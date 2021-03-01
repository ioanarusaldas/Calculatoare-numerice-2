`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2020 16:05:32
// Design Name: 
// Module Name: sim_adder
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


module sim_adder();
    reg [31:0] a, b;
    wire [31:0] Rez;
    adder a2(a,b,Rez);
    initial begin
    a = 12;b= 10;

    end
endmodule
