`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 12:16:47 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);//desemnare operatie realizata de alu
    always @(*)
    begin
        case(ALUop)
		      2'b00: 
		      begin //ld sd
		          ALUinput = 4'b0010;
		      end
		      2'b10://R-type 
		      begin 
		          if ((funct7 == 0) && (funct3 == 0))//add
		          begin
		              ALUinput = 4'b0010;
		          end
		          
		          if ((funct7 == 7'b0100000) && (funct3 == 0))//sub
		          begin
		              ALUinput = 4'b0110;
		          end
		          
		          if ((funct7 == 0) && (funct3 == 3'b111))//and
		          begin
		              ALUinput = 4'b0000;
		          end
		          
		          if ((funct7 == 0) && (funct3 == 3'b110))//or
		          begin
		              ALUinput = 4'b0001;
		          end
		          
		          if ((funct7 == 0) && (funct3 == 3'b100))//xor
		          begin
		              ALUinput = 4'b0011;
		          end
		          
		          if ((funct7 == 0) && (funct3 == 3'b101))//srl srli
		          begin
		              ALUinput = 4'b0101;
		          end
		          
		          if ((funct7 == 0) && (funct3 == 3'b001))//sll slli
		          begin
		              ALUinput = 4'b0100;
		          end
		          
		          if ((funct7 == 7'b0100000 ) && (funct3 == 3'b101))//sra srai
		          begin
		              ALUinput = 4'b1001;
		          end
		          
		          if ((funct7 == 0) && (funct3 == 3'b010))//slt
		          begin
		              ALUinput = 4'b1000;
		          end
		          
		          if ((funct7 == 0) && (funct3 == 3'b011))//sltu
		          begin
		              ALUinput = 4'b0111;
		          end
		      end
		      2'b01://B-type
		      begin
		          case(funct3)
		              3'b000://beq
		              begin
		                  ALUinput = 4'b0110;
		              end
		              
		              3'b001://bne
		              begin
		                  ALUinput = 4'b0110;
		              end
		              
		              3'b100://blt 
		              begin
		                  ALUinput = 4'b1000;
		              end
		              
		              3'b001://bge
		              begin
		                  ALUinput = 4'b1000;
		              end
		              
		              3'b110://bltu
		              begin
		                  ALUinput = 4'b0111;
		              end
		              3'b111://bgeu
		              begin
		                  ALUinput = 4'b0111;
		              end
		          endcase 
		      end 
		endcase
    
        
    end
endmodule
