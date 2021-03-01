`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2020 15:25:41
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory( input [9:0] address,output reg [31:0] instruction);
    reg [31:0] memory[0:1023];
	initial
	begin
		$readmemh("code.mem",memory);
	end
    always @(*) begin
	   assign instruction = memory[address] ;	
	 end
endmodule