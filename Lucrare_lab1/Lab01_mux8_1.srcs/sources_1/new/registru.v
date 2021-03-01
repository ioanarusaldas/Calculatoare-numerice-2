`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2020 08:55:39
// Design Name: 
// Module Name: registru
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


module registru(out,data,clk,EN,RESET,INC,DEC,SHL,SHR);
    input [3:0] data;
    input clk,EN,INC,DEC,SHL,SHR;
    input RESET;
    output reg [3:0] out;
    always @(posedge clk or posedge RESET)
    begin
        if (RESET == 1)
            out <= 0;
        else 
            if (EN == 1)
                out <= data;
             else
                 if (INC == 1)
                    out <= out + 1;
                  else
                    if (DEC == 1)
                        out <= out - 1;
                    else
                        if (SHR == 1)
                            out <= out >> 1;
                    else
                        if (SHL == 1)
                            out <= out << 1;
                     
    end
   
endmodule
