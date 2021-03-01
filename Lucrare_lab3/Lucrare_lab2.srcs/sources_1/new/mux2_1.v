`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2020 14:58:33
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(input [31:0] ina,inb,input sel, output reg[31:0] out);
    always @(*) begin
        if(sel == 1)
            out = inb;
         else begin
          out = ina;
          end;
    end
  //  assign out = (sel != 0) ? inb : ina;
endmodule
