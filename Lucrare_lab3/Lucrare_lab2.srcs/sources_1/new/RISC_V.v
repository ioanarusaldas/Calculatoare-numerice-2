`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 05:17:50 PM
// Design Name: 
// Module Name: RISC_V
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


module RISC_V(input clk, //semnal de ceas global
              input reset, //semnal de reset global
              
              output [31:0] PC_EX, //adresa PC in etapa EX
              output [31:0] ALU_OUT_EX, //valoarea calculata de ALU in etapa EX
              output [31:0] PC_MEM, //adresa de salt calculata
              output PCSrc, //semnal de selectie pentru PC
              output [31:0] DATA_MEMORY_MEM, //valoarea citita din memoria de date in MEM
              output [31:0] ALU_DATA_WB, //valoarea finala scrisa in etapa WB
              output [1:0] forwardA, forwardB, //semnale forwarding
              output pipeline_stall //semnal de stall la detectia de hazarduri
             );
    //IF **********************************************
    wire PC_write;
    wire [31:0] PC_IF,INSTRUCTION_IF;
    // ID *************************************************
    wire [31:0] PC_ID,INSTRUCTION_ID;//ies din registrul IF/ID
    wire IF_ID_write;//semnal pt registru IF/ID, vine de la detection Hazard
    wire RegWrite_WB;//fir apel ID, vine din WB
    wire [4:0] RD_WB;//registrul rezultat in stagiul ID
    wire[31:0] IMM_ID; //valoarea imediatac
    wire[31:0] REG_DATA1_ID; //valoarea primului registru sursa citit
    wire[31:0] REG_DATA2_ID; //valoarea celui de-al doilea registru sursa citit
    wire[2:0] FUNCT3_ID; //funct3 din codificarea instructiunii
    wire[6:0] FUNCT7_ID; //funct7 din codificarea instructiunii
    wire[6:0] OPCODE_ID; //opcode-ul instructiunii
    wire[4:0] RD_ID; //adresaregistru destinatie
    wire[4:0] RS1_ID; //adresa registru sursa1
    wire[4:0] RS2_ID; //adresa registru sursa2
    wire [31:0] PC_ID_out; //propagat in ID
    
    // CONTROL PATH *************************************************
    wire MemRead,MemtoReg,MemWrite,RegWrite,Branch,ALUSrc;//semnale selectie folosite in control_path
    wire [1:0] ALUop;//calculat in control_path
    
    //EX**********************************************
    wire [31:0] IMM_EX;
    wire [31:0] REG_DATA1_EX;
    wire [31:0]REG_DATA2_EX;
    wire [2:0] FUNCT3_EX;
    wire [6:0] FUNCT7_EX;
    wire [6:0] OPCODE_EX;
    wire[6:0] OPCODE_EX_out;
    wire [4:0] RD_EX;
    wire [4:0] RS1_EX;
    wire [4:0] RS2_EX;
    
    //propagate din ID
    wire MemRead_EX,MemtoReg_EX,MemWrite_EX,RegWrite_EX,Branch_EX,ALUSrc_EX;
    wire [1:0] ALUop_EX;
    
    wire [31:0] PC_Branch_EX;   //adresa de salt calculata in EX
    wire[31:0] REG_DATA2_EX_FINAL;  //valoarea registrului sursa 2 selectata dintre valorile
    wire ZERO_EX;   //flagul zero calculat de ALU
    
    //output EX
    wire  MemRead_out,MemtoReg_out,MemWrite_out,RegWrite_out,Branch_out;
    wire [4:0] RD_out;
    
    //MEM ***************************************************
    wire [31:0] ALU_OUT_MEM; //valoarea calculata de ALU, prezenta in MEM
    wire MemRead_MEM,MemtoReg_MEM,MemWrite_MEM,RegWrite_MEM,Branch_MEM; //valori selectie salvate de reg EX/MEM
    //valori salvate de reg EX/MEM

    wire [31:0]REG_DATA2_MEM;
    wire [4:0] RD_MEM;
    wire ZERO_MEM;
    wire [31:0]ALU_MEM_out;
     wire [6:0] OPCODE_MEM;
     wire [2:0] FUNCT3_MEM;
    
    //variablie auxiliare propagare prin stagiul MEM************************88
    wire MemtoReg_MEM_out,RegWrite_MEM_out;
    wire [4:0] RD_MEM_out;
    
    //WB****************************
    wire MemtoReg_WB;
    wire[31:0] read_data_WB;
    wire[31:0] ALU_WB;
    
   //STAGIUL IF
    IF IF_instance(//INPUT
                    clk,reset,PCSrc,PC_write,PC_MEM,
                    //OUTPUT
                    PC_IF,INSTRUCTION_IF);
    
    //REGISTRU IF_ID
    reg_IF_ID reg_IF_ID_instance(clk,reset,IF_ID_write,
                                INSTRUCTION_IF,PC_IF,
                                INSTRUCTION_ID,PC_ID);
    
    //STAGIU ID
    ID ID_instance(//INPUT
                   clk,PC_ID,
                   INSTRUCTION_ID,// instructiune
                   RegWrite_WB,
                    ALU_DATA_WB,//valoare scrisa in WB
                    RD_WB, //adresa registru destinatie
                    //OUTPUT
                    IMM_ID, //valoare imediata
                    REG_DATA1_ID, //valoare registru sursa 1
                    REG_DATA2_ID,//valoare registru sursa 2
                    FUNCT3_ID,FUNCT7_ID,OPCODE_ID,
                    RD_ID,RS1_ID,RS2_ID, //adrese registrii
                    PC_ID_out
                    );
   
    control_path control_path_instance(//INPUT
                    OPCODE_ID,
                    pipeline_stall,//semnal de stall la detectia de hazard
                    //OUTPUT
                    MemRead,MemtoReg,MemWrite,RegWrite,Branch,ALUSrc, //semnale de control
                    ALUop);
    //REGISTRU ID_EX
   reg_ID_EX reg_ID_EX_instance(clk,reset,1'b1,
                          PC_ID_out, 
                          IMM_ID,
                          REG_DATA1_ID,REG_DATA2_ID,
                          FUNCT3_ID,FUNCT7_ID,OPCODE_ID,
                          RD_ID,RS1_ID,RS2_ID,
                          MemRead,MemtoReg,MemWrite,RegWrite,Branch,ALUSrc,ALUop,
                          
                          PC_EX,
                          IMM_EX,
                          REG_DATA1_EX,REG_DATA2_EX,
                          FUNCT3_EX,FUNCT7_EX,OPCODE_EX,RD_EX,
                          RS1_EX,RS2_EX,
                          MemRead_EX,MemtoReg_EX,MemWrite_EX,RegWrite_EX,Branch_EX,ALUSrc_EX,ALUop_EX); 
   //STAGIUL EX                  
   EX EX_instance(//INPUT
                IMM_EX,
                REG_DATA1_EX,REG_DATA2_EX,
                PC_EX,
                FUNCT3_EX,FUNCT7_EX,
                RD_EX,RS1_EX,RS2_EX,
                RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX,ALUop_EX,ALUSrc_EX,Branch_EX,//semnale control
                forwardA,forwardB,//semnale pentru muxuri
                ALU_DATA_WB,
                ALU_OUT_MEM,
                //OUTPUT
                ZERO_EX,//flag zero
                ALU_OUT_EX,//rezultat calculat de ALU
                PC_Branch_EX,//adresa de salt calculata
                REG_DATA2_EX_FINAL,
                MemRead_out,MemtoReg_out,MemWrite_out,RegWrite_out,Branch_out,//semnale de control propagate
                RD_out //adresa registru destinatie propagat
                );
    assign OPCODE_EX_out =  OPCODE_EX;
   // assign FUNCT3_EX_out = FUNCT3_EX;
   //REGISTRUL EX_MEM   
   reg_EX_MEM reg_EX_MEM_instance(clk,reset,1'b1,
                    MemRead_out,MemtoReg_out,MemWrite_out,RegWrite_out,Branch_out,
                    PC_Branch_EX,
                    ZERO_EX,
                    ALU_OUT_EX,
                    REG_DATA2_EX_FINAL,
                    RD_EX,
                    OPCODE_EX_out,
                    FUNCT3_EX,
                    
                    MemRead_MEM,MemtoReg_MEM,MemWrite_MEM,RegWrite_MEM,Branch_MEM,
                    PC_MEM,
                    ZERO_MEM,
                    ALU_OUT_MEM,
                    REG_DATA2_MEM,
                    RD_MEM,
                    OPCODE_MEM,
                    FUNCT3_MEM);
    //STAGIUL MEM
    //verificare conditii salt            
/*     branch branch_instance(//INPUT
                            ZERO_MEM,Branch_MEM,
                            //OUTPUT
                            PCSrc);*/
      branch branch_instance(ZERO_MEM,Branch_MEM,OPCODE_MEM,FUNCT3_MEM,ALU_OUT_MEM,PCSrc);
                              

     data_memory data_memory_instance(//INPUT
                   clk,       
                   MemRead_MEM,  //semnal activare citire
                   MemWrite_MEM,//semnal activare citire
                   ALU_OUT_MEM, //adresa de scriere/citire
                   REG_DATA2_MEM, //valoarea scrisa in memorie
                   //OUTPUT
                  DATA_MEMORY_MEM //valoarea citita din memorie
                   );
    //propagare semnale
    assign MemtoReg_MEM_out = MemtoReg_MEM;
    assign RegWrite_MEM_out = RegWrite_MEM;
    assign RD_MEM_out = RD_MEM;
    assign ALU_MEM_out = ALU_OUT_MEM;
    
    //REGISTRUL MEM_WB
    reg_MEM_WB reg_MEM_WB_instance(clk,reset,1'b1,
                    MemtoReg_MEM_out,RegWrite_MEM_out,
                    DATA_MEMORY_MEM,
                    ALU_MEM_out,
                    RD_MEM_out,
                    
                    MemtoReg_WB,RegWrite_WB,
                    read_data_WB,
                    ALU_WB,
                    RD_WB);
     //STAGIUL WB
     mux2_1 WB_instance(//INPUT
                        ALU_WB,read_data_WB,MemtoReg_WB,
                        //OUTPUT
                        ALU_DATA_WB);
                        
     //MODULE DETECTIE + REZOLVARE HAZARD
     forwarding forwarding_instance(//INPUT
                 RS1_EX,RS2_EX,//adrese registrii sursa
                 RD_MEM,RD_WB,//adrese registru destinatie in MEM/WB
                 RegWrite_MEM,//semnal scriere
                  RegWrite_WB,
                  //OUTPUT
                  forwardA,forwardB //semnale selectie mux din EX
                  );
                  
     hazard_detection hazard_instance(//INPUT
                        RD_EX,RS1_ID,RS2_ID,
                        MemRead,
                        PC_write, //semnal sriere in registrul PC
                        IF_ID_write,//semnal scriere registru IF_ID
                        pipeline_stall //semnal de stall
                        );
  
endmodule
