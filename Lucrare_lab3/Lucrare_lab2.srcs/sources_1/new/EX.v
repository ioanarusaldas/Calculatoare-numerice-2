`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 03:10:46 PM
// Design Name: 
// Module Name: EX
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


module EX(input [31:0] IMM_EX,   //valoarea immediate in EX      
          input [31:0] REG_DATA1_EX, //valoarea registrului sursa 1
          input [31:0] REG_DATA2_EX, //valoarea registrului sursa 2
          input [31:0] PC_EX,   //adresa instructiunii curente in EX
          input [2:0] FUNCT3_EX,    //funct3 pentru instructiunea din EX
          input [6:0] FUNCT7_EX,    //funct7 pentru instructiunea din EX
          input [4:0] RD_EX,    //adresa registrului destinatie
          input [4:0] RS1_EX,   //adresa registrului sursa 1
          input [4:0] RS2_EX,   //adresa registrului sursa 2
          input RegWrite_EX,    //semnal de scriere in bancul de registrii
          input MemtoReg_EX,
          input MemRead_EX, //semnal pentru activarea citirii in memorie
          input MemWrite_EX,    //semnal pentru activarea scrierii in memorie
          input [1:0] ALUop_EX, //semnal de control
          input ALUSrc_EX,  //semnal de selectie intre RS2 si valoarea imediata
          input Branch_EX,  //semnal identificare instructiuni de tip branch
          input [1:0] forwardA,forwardB,    //semnale de selectie pentru multiplexoarele de forwarding
          
          input [31:0] ALU_DATA_WB, //valoarea calculata de ALU, prezenta in WB
          input [31:0] ALU_OUT_MEM,     //valoarea calculata de ALU, prezenta in MEM
          
          output ZERO_EX,   //flagul zero calculat de ALU
          output [31:0] ALU_OUT_EX, //rezultat calculat de ALU in EX
          output [31:0] PC_Branch_EX,   //adresa de salt calculata in EX
          output [31:0] REG_DATA2_EX_FINAL,  //valoarea registrului sursa 2 selectata dintre valorile
                                            //prezentate in etapele EX,MEM, WB
          output  MemRead_out,MemtoReg_out,MemWrite_out,RegWrite_out,Branch_out,//semnale de control propagate
          output [4:0] RD_out //registru rezultat propagat
          );
          wire [31:0] out_mux1,out_mux2,out_mux3,add_out_EX;
          wire [3:0] ALUinput_gen;
          //alegere registrii 
          mux4_1 mux41_instance1(REG_DATA1_EX,ALU_DATA_WB,ALU_OUT_MEM,0,forwardA,out_mux1);
          mux4_1 mux41_instance2(REG_DATA2_EX,ALU_DATA_WB,ALU_OUT_MEM,0,forwardB,REG_DATA2_EX_FINAL);
          
          //alegere valoare imediata sau r2
          mux2_1 mux21_instance(REG_DATA2_EX_FINAL,IMM_EX,ALUSrc_EX,out_mux3);
          
          //calculare adresa de salt
          adder add_instance_EX(PC_EX,IMM_EX,PC_Branch_EX);
          //calculare operatie executata de ALU
          ALUcontrol alu_control_instance(ALUop_EX,FUNCT7_EX,FUNCT3_EX,ALUinput_gen);
          // calcul rezultat operatie
          ALU alu_instance(ALUinput_gen,out_mux1,out_mux3,ZERO_EX,ALU_OUT_EX);
          //propagare mai departe
          assign MemRead_out = MemRead_EX;
          assign MemtoReg_out = MemtoReg_EX;
          assign MemWrite_out = MemWrite_EX;
          assign RegWrite_out = RegWrite_EX;
          assign Branch_out = Branch_EX;
          assign RD_out = RD_EX;

endmodule
