`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 15:52:48
// Design Name: 
// Module Name: main_controller
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


module main_controller #(parameter N=32)(opcode,branch,regwrite,memread,memwrite,mem2reg,ALUsrc,ALUop);
input logic [6:0] opcode;
output logic branch,regwrite,memread,memwrite,mem2reg,ALUsrc;
output logic [2:0]ALUop;
always_comb
begin
case(opcode) 
7'b0010011:begin //i type
branch=1'b0;
ALUsrc=1'b1;
ALUop=2'b00;
memread=1'b0;
memwrite=1'b0;
mem2reg=1'b0;
regwrite=1'b1;
end
7'b0110011:begin //r type
branch=1'b0;
ALUsrc=1'b0;
ALUop=2'b10;
memread=1'b0;
memwrite=1'b0;
mem2reg=1'b0;
regwrite=1'b1;
end
7'b0000011:begin //lw type
branch=1'b0;
ALUsrc=1'b1;
ALUop=2'b00;
memread=1'b1;
memwrite=1'b0;
mem2reg=1'b1;
regwrite=1'b1;
end
7'b0100011:begin //sw type
branch=1'b0;
ALUsrc=1'b1;
ALUop=2'b00;
memread=1'b0;
memwrite=1'b1;
mem2reg=1'b0;
regwrite=1'b1;
end
7'b1100011:begin //beq
branch=1'b1;
ALUsrc=1'b0;
ALUop=2'b00;
memread=1'b0;
memwrite=1'b0;
mem2reg=1'b0;
regwrite=1'b0;
end	
endcase
end
endmodule
