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
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_Adder(

    input A,       // First input
    input B,       // Second input
    input Cin,     // Carry input
    output Sum,    // Sum output
    output Cout    // Carry output
    );



assign Sum  = A ^ B ^ Cin;                // XOR for sum
assign Cout = (A & B) | (B & Cin) | (A & Cin);  // Carry out    

endmodule
