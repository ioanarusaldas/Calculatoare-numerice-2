`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 04:34:24 PM
// Design Name: 
// Module Name: reg_IF_ID
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


module reg_IF_ID(clk,reset,write,instruction,PC_in,ins_out,PC_out);
input [31:0] instruction;
input [31:0] PC_in;
input reset,write,clk;
output reg [31:0] ins_out;
output reg [31:0] PC_out;

    always @(posedge clk)
        if (reset)
        begin
            ins_out <= 0;
            PC_out <= 0;
        end
        else    
        begin
            if (write)
            begin
                ins_out <= instruction;
                PC_out <= PC_in;
            end
        end

/*module reg_pipeline(rin,rout,reset,en,clk);
    //output rout;
    output reg [7:0] rout;
    input [7:0] rin;
    input reset,en,clk;
    always @(posedge clk)
        if (reset)
            rout <= 0;
        else    if (en)
            rout <= rin;
endmodule*/
endmodule
