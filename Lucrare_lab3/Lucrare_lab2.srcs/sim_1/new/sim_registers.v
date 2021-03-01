timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 02:33:03 PM
// Design Name: 
// Module Name: sim_registers
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


module sim_registers();
    reg [4:0] read_reg1,read_reg2,write_reg;
    reg [31:0] write_data;
    reg clk,reg_write;
    wire[31:0] read_data1,read_data2;
/*    reg [31:0] a, b;
    wire [31:0] Rez;*/
    registers re(clk,reg_write,read_reg1,read_reg2,write_reg,write_data,read_data1,read_data2);
    
    initial begin
        clk = 1; reg_write = 1; read_reg1 = 10; read_reg2 = 5;write_data = 3;write_reg = 0;

        #100  read_reg1 = 4; read_reg2 = 10;
        #100 write_reg = 5; write_data = 50;
        #100 read_reg1 = 5;
        #100 reg_write = 0; write_reg = 5; write_data = 100;
        #read_reg1 = 20;
        
   end
   always #50 clk = ~clk; 
endmodule
