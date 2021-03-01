`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 10:29:36 PM
// Design Name: 
// Module Name: sim_register
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


module sim_register();
reg clk, reg_write;
reg[4:0] read_reg1, read_reg2, write_reg;
reg[31:0] write_data;
wire [31:0] read_data1, read_data2;

registers reg_instance(clk, reg_write, read_reg1, read_reg2, write_reg, write_data, read_data1, read_data2);

initial begin
    clk = 1;
    reg_write = 1;
    read_reg1 = 10;  read_reg2 = 15;//registrii din care se citeste
    write_reg = 1;//registru in care se scrie
    write_data = 50;
    #100 read_reg1 = 1;
    write_reg = 20;
    write_data = 100;
    #100
       read_reg2 = 20;
       reg_write = 0;//dezactivare scriere
    #100
        write_reg = 15;
        write_data = 200;
    #100
        read_reg1 = 15;
    end
       
    always #50 clk = ~clk;
 

endmodule
