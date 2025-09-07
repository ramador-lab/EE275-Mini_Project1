`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 05:02:03 PM
// Design Name: 
// Module Name: ALU_2s_comp
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


module ALU_2s_comp(

    input  [31:0] A,      // 32-bit input
    input  [31:0] B,      // 32-bit input
    input         Cin,    // Initial carry in
    output [31:0] Sum,    // 32-bit sum
    output        Cout    // Final carry out

    );

wire [31:0] C;  // Internal carry wires

wire [31:0] Ain;

wire [31:0] Bin;

assign Ain = ~A;

assign Bin = 32'h0000_0001;


    
ALU alu0 (.A(Ain), .B(Bin), .Cin(Cin),    .Sum(Sum), .Cout(C));   
    
endmodule
