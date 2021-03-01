`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2021 05:14:24 PM
// Design Name: 
// Module Name: RISC_V_TB_2
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


module RISC_V_TB_2();
  reg clk,reset;
  wire[31:0] PC_EX;
  wire[31:0] ALU_OUT_EX;
  wire[31:0] PC_MEM;
  wire PCSrc;
  wire[31:0] DATA_MEMORY_MEM;
  wire[31:0] ALU_DATA_WB;
  wire[1:0] forwardA, forwardB;
  wire pipeline_stall;

  RISC_V RV(clk, reset, PC_EX, ALU_OUT_EX, PC_MEM, PCSrc, DATA_MEMORY_MEM, ALU_DATA_WB, forwardA, forwardB, pipeline_stall);

  always #5 clk=~clk;
  initial begin
    #0 clk=1'b0;
       reset=1'b1;
    #10 reset=1'b0;
    #1000 $finish;
  end
endmodule
