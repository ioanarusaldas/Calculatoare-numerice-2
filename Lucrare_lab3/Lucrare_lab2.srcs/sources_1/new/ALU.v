`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 12:29:13 PM
// Design Name: 
// Module Name: ALU
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


module ALU(input [3:0] ALUop,//ALUinput ce selecteaza operatia
           input [31:0] ina,inb,//operanzi
           output reg zero,//semnal ce verifica daca rezultatul 0 
           output reg [31:0] out);//rezultatul operatiei
    always @ (*)
    begin
        case(ALUop)
		      4'b0010: begin //ld sd add
		                 out = ina + inb; 
		               end
		      4'b0110: begin //sub
		                 out = ina - inb; 
		               end
		      4'b0000: begin //and
		                 out = ina & inb; 
		               end
		      4'b0001: begin //or
		                 out = ina | inb; 
		               end
		      4'b0011: begin //xor
		                 out = ina ^ inb; 
		               end
		      4'b0101: begin //srli srl
		                 out = ina >> inb; 
		               end
		      4'b0100: begin //sll slli
		                 out = ina << inb; 
		               end
		      4'b0111: begin //sltu
		                 out = ina < inb; 
		               end
		      4'b1001: begin //sra, srai
		                 out = ina >>> inb; 
		               end
		      4'b1000: begin //slt
		                 //out = ina >>> inb; 
		                 if (ina[31] != inb[31])
		                 begin
					       if (ina[31] > inb[31]) //a negativ - b pozitiv
					       begin
						      out = 1;
					       end 
					       else 
					       begin
						      out = 0;
					       end
				        end 
				        else begin
						  out = ina < inb;
					    end
		               end
		endcase
		
    end
    always @(out) begin
		if (out == 0) begin
			zero <= 1;
		end else begin
			zero <= 0;
		end
	end
endmodule
