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
    input  wire clk,     // Clock
    input  wire rst,     // Active-high asynchronous reset
    input  wire A,       // First input
    input  wire B,       // Second input
    input  wire Cin,     // Carry input
    output reg  Sum,     // Registered sum output
    output reg  Cout     // Registered carry output
);

    wire sum_comb;
    wire cout_comb;

    // Combinational logic
    assign sum_comb  = A ^ B ^ Cin;                  
    assign cout_comb = (A & B) | (B & Cin) | (A & Cin);

    // Sequential logic (clock + asynchronous reset)
    always @(posedge clk) begin
        if (rst) begin
            Sum  <= 1'b0;
            Cout <= 1'b0;
        end else begin
            Sum  <= sum_comb;
            Cout <= cout_comb;
        end
    end

endmodule
