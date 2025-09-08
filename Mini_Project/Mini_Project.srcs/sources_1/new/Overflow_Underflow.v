`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 12:46:38 PM
// Design Name: 
// Module Name: Overflow_Underflow
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


module Overflow_Underflow(

    input  wire clk,    // Clock
    input  wire rst,    // Active-high reset
    input  wire A,      // 32-bit input
    input  wire B,
    output reg  CC    //CC - Reg

    );
    
    wire CCin;
    
    assign CCin = A ^ B;
    
        // Register outputs on clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            CC <= 1'b0;
        end else begin
            CC  <= CCin;
        end
    end
    
    
endmodule
