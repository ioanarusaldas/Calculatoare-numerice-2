`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 05:09:09 PM
// Design Name: 
// Module Name: RISC_V_IF_ID
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


module RISC_V_IF_ID(input clk, //semnalul de ceas global
                    input reset, //semnal de reset global
                    //semnalele provenite din stagii viitoare
                    //sunt pre_setate pentru aceasta lucrare
                    //vor fi discutate lucrarile urmatoare
                    input IF_ID_write,//semnal de scriere pentru registrul de pipeline IF_ID
                    input PCSrc,PC_write, //semnale de control pentru PC
                    input [31:0] PC_Branch, //PC-ul calculat in etapa EX pentru instructiunile de salt
                    input RegWrite_WB, //semnal de activare a scrierii in bancul de registrii
                    input [31:0] ALU_DATA_WB,//rezultatul calculat de ALU
                    input [4:0] RD_WB,//registrul rezultat in care se face scrierea
                    
                    //semnalele de iesire din ID
                    //vor fi vizualizate pe simulare
                    output [31:0] PC_ID, //adresa PC a instructiunii din etapa ID
                    output [31:0] INSTRUCTION_ID, //instructiunea curenta in etapa ID
                    output [31:0] IMM_ID, //valoarea calculata
                    output [31:0] REG_DATA1_ID, //valoarea primului registru sursa citit
                    output [31:0] REG_DATA2_ID, //valoarea celui de-al doilea registru sursa citit
                    
                    output [2:0] FUNCT3_ID, //funct3 din codificarea instructiunii
                    output [6:0] FUNCT7_ID, //funct7 din codificarea instructiunii
                    output [6:0] OPCODE_ID, //opcode-ul instructiunii
                    output [4:0] RD_ID, //registru destinatie
                    output [4:0] RS1_ID, //registru sursa1
                    output [4:0] RS2_ID //registru sursa2
                     );
                     
       wire [31:0] PC_IF_aux,INSTRUCTION_IF_aux,PC_IF_reg,INSTRUCTION_IF_reg;
       IF IF_instance(clk,reset,PCSrc,PC_write,PC_Branch,PC_IF_aux,INSTRUCTION_IF_aux);
       reg_IF_ID req_pipeline(clk,reset,IF_ID_write,INSTRUCTION_IF_aux,PC_IF_aux,INSTRUCTION_IF_reg,PC_IF_reg);
       ID ID_instance(clk,PC_IF_reg,INSTRUCTION_IF_reg,RegWrite_WB,ALU_DATA_WB,RD_WB,IMM_ID,REG_DATA1_ID,REG_DATA2_ID,FUNCT3_ID,FUNCT7_ID,OPCODE_ID,RD_ID,RS1_ID,RS2_ID);
       assign INSTRUCTION_ID = INSTRUCTION_IF_reg;
       assign PC_ID = PC_IF_reg;
       
                     
endmodule
