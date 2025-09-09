`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 03:06:12 PM
// Design Name: 
// Module Name: Full_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Full Adder with clock and asynchronous reset
// 
//////////////////////////////////////////////////////////////////////////////////

module Full_Adder(
//    input  wire clk,     // Clock
//    input  wire rst,     // Active-high asynchronous reset
    input   A,       // First input
    input   B,       // Second input
    input   Cin,     // Carry input
    output  Sum,     // Registered sum output
    output  Cout     // Registered carry output
);


    // Combinational logic
    assign Sum  = A ^ B ^ Cin;                  
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule
