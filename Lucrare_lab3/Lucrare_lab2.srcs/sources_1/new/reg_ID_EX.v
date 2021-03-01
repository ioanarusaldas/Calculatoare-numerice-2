`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 08:56:39 PM
// Design Name: 
// Module Name: reg_ID_EX
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


module reg_ID_EX(input clk,input reset, input write,
input [31:0] PC_ID,
input [31:0] IMM_ID,
input [31:0] REG_DATA1_ID,REG_DATA2_ID,
input [2:0] FUNCT3_ID,
input [6:0] FUNCT7_ID,
input [6:0] OPCODE_ID,
input [4:0] RD_ID,
input [4:0] RS1_ID,
input [4:0] RS2_ID,
input MemRead,MemtoReg,MemWrite,RegWrite,Branch,ALUSrc,
input [1:0]   ALUop,
output reg  [31:0] PC_ID_out,
output reg  [31:0] IMM_ID_out,
output reg[31:0] REG_DATA1_out,
output reg[31:0]REG_DATA2_out,
output reg[2:0] FUNCT3_ID_out,
output reg[6:0] FUNCT7_ID_out,
output reg[6:0] OPCODE_ID_out,
output reg [4:0] RD_ID_out,
output reg [4:0] RS1_ID_out,
output reg [4:0] RS2_ID_out,
output reg MemRead_out,MemtoReg_out,MemWrite_out,RegWrite_out,Branch_out,ALUSrc_out,
output reg [1:0]   ALUop_out);

    always @(posedge clk)
        if (reset)
        begin
            PC_ID_out <= 0;
            IMM_ID_out <= 0;
            REG_DATA1_out <= 0;
            REG_DATA2_out <= 0;
            FUNCT3_ID_out <= 0;
            FUNCT7_ID_out <= 0;
            OPCODE_ID_out <= 0;
            RD_ID_out <= 0;
            RS1_ID_out <= 0;
            RS2_ID_out <= 0;
            MemRead_out <= 0;
            MemtoReg_out <= 0;
            MemWrite_out <= 0;
            RegWrite_out <= 0;
            Branch_out <= 0;
            ALUSrc_out <= 0;
            ALUop_out <= 0;
        end
        else    
        begin
            if (write)
            begin
                PC_ID_out <= PC_ID;
                IMM_ID_out <= IMM_ID;
                REG_DATA1_out <= REG_DATA1_ID;
                REG_DATA2_out <= REG_DATA2_ID;
                FUNCT3_ID_out <= FUNCT3_ID;
                FUNCT7_ID_out <= FUNCT7_ID;
                OPCODE_ID_out <= OPCODE_ID;
                RD_ID_out <= RD_ID;
                RS1_ID_out <= RS1_ID;
                RS2_ID_out <= RS2_ID;
                MemRead_out <= MemRead;
                MemtoReg_out <= MemtoReg;
                MemWrite_out <= MemWrite;
                RegWrite_out <= RegWrite;
                Branch_out <= Branch;
                ALUSrc_out <= ALUSrc;
                ALUop_out <= ALUop;
            end
        end
endmodule
