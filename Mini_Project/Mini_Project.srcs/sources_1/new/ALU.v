`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 32-bit ALU Adder with clock and reset
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU (
    input  wire        clk,   // Clock
    input  wire        rst,   // Active-high reset
    input  wire [31:0] A,     // 32-bit input
    input  wire [31:0] B,     // 32-bit input
    input  wire        Cin,   // Initial carry in
    output wire [31:0] Sum,   // 32-bit sum
    output wire        Cout,   // Final carry out
    output wire        CC
);

    wire [31:0] C;  // Internal carry wires
    

    
    Overflow_Underflow overunder (
        .clk(clk),
        .rst(rst),
        .A(C[30]),  
        .B(Cout),  
        .CC(CC)  
        
    );

    // LSB full adder
    Full_Adder fa0 (
        .clk(clk),
        .rst(rst),
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(C[0])
    );

    // Middle full adders
    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin : adder_chain
            Full_Adder fa (
                .clk(clk),
                .rst(rst),
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i-1]),
                .Sum(Sum[i]),
                .Cout(C[i])
            );
        end
    endgenerate

    // Final carry out
    assign Cout = C[31];

endmodule
