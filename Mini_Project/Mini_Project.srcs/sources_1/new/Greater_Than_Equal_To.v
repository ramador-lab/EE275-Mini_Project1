`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 03:39:47 PM
// Design Name: 
// Module Name: Greater_Than
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


module Greater_Than_Equal_To(
    input wire clk,
    input wire rst,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg C
    );
    
    wire [31:0] C_stage1; 
    
    assign C_stage1  = (A & ~B)| ((~A & ~B) | (A & B));

    
        // Sequential logic (clock + asynchronous reset)
    always @(posedge clk) begin
        if (rst) begin
            C  <= 1'b0;
        end else begin
            C  <= C_stage1;
        end
    end
    
endmodule