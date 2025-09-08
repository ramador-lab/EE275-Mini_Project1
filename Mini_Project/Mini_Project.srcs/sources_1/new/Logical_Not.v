`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 03:42:50 PM
// Design Name: 
// Module Name: Logical_Not
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


module Logical_Not(
    input wire clk,
    input wire rst,
    input wire [31:0] A,
    output reg C

    );
    
    wire [31:0] C_stage1; 
    
    assign C_stage1  = ~(&A);
    
    
        // Sequential logic (clock + asynchronous reset)
    always @(posedge clk) begin
        if (rst) begin
            C  <= 1'b0;
        end else begin
            C  <= C_stage1;
        end
    end
endmodule

