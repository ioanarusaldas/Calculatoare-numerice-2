`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 04:11:24 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk,       
                   input mem_read,//semnal asincron citire din memorie
                   input mem_write,//semnal de activare a scrierii in memorie
                   input [31:0] address, //adresa de scriere/citire
                   input [31:0] write_data, //valoare scrisa in memorie
                   output reg [31:0] read_data //valoarea citita din memorie
                   );
    reg [31:0] memory[0:1023];
    integer i;
    initial begin
        
        for (i = 0; i <= 1023; i = i + 1)
        begin
           memory[i] = 32'b0;
        end
	end
	
    always 	@(posedge clk)
    begin
        if (mem_write)
        begin
            memory[address >> 2] = write_data;
        end
    end
    always @(*)
    begin
        if(mem_read)
        begin
            read_data = memory[address >> 2];
        end
    end
    
    
endmodule
