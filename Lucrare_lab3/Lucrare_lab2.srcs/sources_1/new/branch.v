`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2021 03:11:09 PM
// Design Name: 
// Module Name: branch
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


module branch(input zero, input branch,input [6:0] OPCODE,input [2:0] FUNCT3, input[31:0] ALU_rez,output reg execute);
    //beq bne blt bge bltu bgeu
    
   // assign execute = zero && branch;
   always @(*)begin
       if (OPCODE == 7'b1100011) begin 
            case(FUNCT3)
               3'b000: begin //beq
                    if (zero == 1)
                        execute = 1;
                    else
                        execute = 0;
               end
               3'b001: begin //bne
                    if (ALU_rez == 0)
                        execute = 1;
                    else
                        execute = 0;
               end
               3'b100: begin //blt
                    if (ALU_rez < 0)
                        execute = 1;
                    else
                        execute = 0;
               end
               3'b101: begin //bge
                    if (ALU_rez >= 0)
                        execute = 1;
                    else
                        execute = 0;
               end
               3'b110: begin //bltu
                    if (ALU_rez < 0 && (ALU_rez[31] != 1))
                        execute = 1;
                    else
                        execute = 0;
               end
                3'b111: begin //bgeu
                    if (ALU_rez >= 0 && (ALU_rez[31] != 1))
                        execute = 1;
                    else
                        execute = 0;
               end
               
             endcase
        end
        else
           execute = 0;
   end
endmodule
