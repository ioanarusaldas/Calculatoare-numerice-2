`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 05:01:44 PM
// Design Name: 
// Module Name: reg_EX_MEM
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


module reg_EX_MEM(input clk,input reset, input write,
                    input MemRead,MemtoReg,MemWrite,RegWrite,Branch,
                    input [31:0] PC_Branch,
                    input ZERO,
                    input [31:0] ALU,
                    input [31:0] REG_DATA2_EX_FINAL,
                    input [4:0] RD_ID,
                    input [6:0] OPCODE_EX,
                    input [2:0] FUNCT3_EX,
                    output reg MemRead_out,MemtoReg_out,MemWrite_out,RegWrite_out,Branch_out,
                    output reg [31:0] PC_Branch_out,
                    output reg ZERO_out,
                    output reg [31:0] ALU_out,
                    output reg [31:0] REG_DATA2_EX_FINAL_out,
                    output reg [4:0] RD_ID_out,
                    output reg [6:0] OPCODE_MEM,
                    output reg [2:0] FUNCT3_MEM);

    always @(posedge clk)
        if (reset)
        begin
            MemRead_out <= 0;
            MemtoReg_out <= 0;
            MemWrite_out <= 0;
            RegWrite_out <= 0;
            Branch_out <= 0;
            PC_Branch_out <= 0;
            ZERO_out <= 0;
            ALU_out <= 0;
            REG_DATA2_EX_FINAL_out <= 0;
            RD_ID_out <= 0;
            OPCODE_MEM <= 0;
            FUNCT3_MEM <= 0;
        end
        else    
        begin
            if (write)
            begin
                MemRead_out <=  MemRead ;
                MemtoReg_out <= MemtoReg;
                MemWrite_out <= MemWrite;
                RegWrite_out <= RegWrite;
                Branch_out <= Branch;
                PC_Branch_out <= PC_Branch;
                ZERO_out <= ZERO;
                ALU_out <= ALU;
                REG_DATA2_EX_FINAL_out <= REG_DATA2_EX_FINAL;
                RD_ID_out <= RD_ID;
                OPCODE_MEM <= OPCODE_EX;
                FUNCT3_MEM <= FUNCT3_EX;
            end
        end
endmodule
