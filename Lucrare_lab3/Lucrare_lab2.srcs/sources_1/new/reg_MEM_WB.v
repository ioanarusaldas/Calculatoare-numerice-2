`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 05:12:48 PM
// Design Name: 
// Module Name: reg_MEM_WB
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


module reg_MEM_WB(input clk,input reset, input write,
                    input MemtoReg_MEM,RegWrite_MEM,
                    input [31:0] read_data,
                    input [31:0] ALU_MEM,
                    input [4:0] RD_MEM,
                    output reg MemtoReg_MEM_out,RegWrite_MEM_out,
                    output reg [31:0] read_data_out,
                    output reg [31:0] ALU_MEM_out,
                    output reg [4:0] RD_MEM_out);

    always @(posedge clk)
        if (reset)
        begin
            MemtoReg_MEM_out <= 0;
            RegWrite_MEM_out <= 0;
            read_data_out <=0;
            ALU_MEM_out <= 0;
            RD_MEM_out <= 0;
        end
        else    
        begin
            if (write)
            begin
            MemtoReg_MEM_out <= MemtoReg_MEM;
            RegWrite_MEM_out <= RegWrite_MEM;
            read_data_out <= read_data;
            ALU_MEM_out <= ALU_MEM;
            RD_MEM_out <= RD_MEM;
            end
        end
endmodule
