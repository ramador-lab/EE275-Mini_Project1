`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 03:18:48 PM
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


module ALU(

    input  [31:0] A,      // 32-bit input
    input  [31:0] B,      // 32-bit input
    input         Cin,    // Initial carry in
    output [31:0] Sum,    // 32-bit sum
    output        Cout    // Final carry out

    );
    
wire [31:0] C;  // Internal carry wires
// LSB full adder
Full_Adder fa0 (.A(A[0]), .B(B[0]), .Cin(Cin),    .Sum(Sum[0]), .Cout(C[0]));

// Middle full adders
genvar i;
generate
    for (i = 1; i < 32; i = i + 1) begin : adder_chain
        Full_Adder fa (.A(A[i]), .B(B[i]), .Cin(C[i-1]), .Sum(Sum[i]), .Cout(C[i]));
    end
endgenerate

assign Cout = C[31];  // Final carry out
endmodule
