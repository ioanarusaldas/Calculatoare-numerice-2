`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 03:02:15 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(input [31:0] in,output reg [31:0] out);
    wire [31:0] aux;
    integer i;

	always @(*)
	begin
	    case(in[6:0])
		7'b0000011: begin //I - immediate
                   out[0] = in[20];
                   out[4:1] = in[24:21];
                   out[10:5] = in[30:25];
                    for(i = 11; i < 32; i = i+ 1)
                    begin
                        out[i] = in[31];
                    end
          end
            
	 7'b0010011: begin //I - immediate
        out[0] = in[20];
        out[4:1] = in[24:21];

        out[10:5] = in[30:25];

               for(i = 11; i < 32; i = i+ 1)
                    begin
                        out[i] = in[31];
                    end
    end
    7'b0100011: begin //S - immediate
               out[0] = in[7];
               out[4:1] = in[11:8];
               out[10:5] = in[30:25];
                for(i = 11; i < 32; i = i+ 1)
                begin
                    out[i] = in[31];
                end
    end
    7'b1100011:begin //B - immediate
               out[0] = 0;
               out[4:1] = in[11:8];
               out[10:5] = in[30:25];
                out[11] = in[7];
                for(i = 12; i < 32; i = i+ 1)
                begin
                    out[i] = in[31];
                end
    end
   default:
        out = 0;
 endcase
 end
endmodule
