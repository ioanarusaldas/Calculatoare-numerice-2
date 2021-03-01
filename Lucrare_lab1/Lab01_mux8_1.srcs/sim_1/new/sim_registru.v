`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2020 08:59:43
// Design Name: 
// Module Name: sim_registru
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


module sim_registru();
   reg [3:0] data;
    reg clk,EN,RESET,INC,DEC,SHL,SHR;
    wire [3:0] out;
    registru r (out,data,clk,EN,RESET,INC,DEC,SHL,SHR);
    initial begin
        clk = 1;RESET =0;
       #50 EN = 0;data = 1;RESET = 0;
       #50 EN = 1;
       #50 data = 8;
       #50 EN = 0 ; INC =1;
       #50 INC = 1;RESET = 1;
       #50 INC =1;
       #50 RESET = 0; INC = 0;
       #50 EN = 1;
       #50 data = 5;EN = 1;DEC = 1;
       #50 EN = 0;DEC = 0; SHR = 1;
       #50 SHR = 0; SHL = 1; 
       #50 data = 4 ;
       #50 SHL = 0;
        end
        always #50 clk = ~clk; 
        begin
        end
        

endmodule
