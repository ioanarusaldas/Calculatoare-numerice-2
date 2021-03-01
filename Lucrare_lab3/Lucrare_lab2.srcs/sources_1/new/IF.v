`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2020 16:00:01
// Design Name: 
// Module Name: IF
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


module IF(input clk,reset,input PCSrc,PC_write,input[31:0]PC_Branch,output[31:0]PC_IF,INSTRUCTION_IF);
    wire[31:0] mux_out,add_out;
    wire[31:0] four = 4;

    adder add_instance(PC_IF,four,add_out);
    mux2_1 mux_instance(add_out,PC_Branch,PCSrc,mux_out);
    PC pc_instance(clk,reset,PC_write,mux_out,PC_IF);
    instruction_memory IM_instance(PC_IF[11:2],INSTRUCTION_IF);
endmodule
