`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 01:14:13 PM
// Design Name: 
// Module Name: registers
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


module registers(input clk,reg_write,input [4:0] read_reg1,read_reg2,write_reg,input [31:0] write_data,output[31:0] read_data1,read_data2);
	reg [31:0] registers [31:0];
	reg [31:0] out1,out2;
	integer i;
	initial begin
	for (i = 0; i <= 31; i = i + 1)
	begin
	   registers[i] = i;
	end
	end
	
	always @(posedge clk)
	begin
		
		if (reg_write == 1) 
		begin
			registers[write_reg] <= write_data;
		end
	end
	always @(*)
	begin
		out1 <= registers[read_reg1];
		out2 <= registers[read_reg2];
	end
	assign read_data1 = out1;
	assign read_data2 = out2;
endmodule

