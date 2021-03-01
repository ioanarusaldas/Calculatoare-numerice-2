`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 03:07:03 PM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(input [31:0] ina,inb,inc,ind,input[1:0] sel, output reg[31:0] out);

	 always@(*)
	 begin
		case (sel) 
			0:
				out <= ina;
			1:
				out <= inb;
			2:
				out <= inc;
			3:
				out <= ind;
		endcase
	 end
endmodule
