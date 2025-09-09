`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 03:31:00 PM
// Design Name: 
// Module Name: Logical_XOR
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


module Not_Equal_To(
    input wire clk,
    input wire rst,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg C
    );
    
    wire [31:0] C_stage1;
    wire [31:0] C_stage2; 
    
    assign C_stage1  = (~A & ~B) | (A & B);
    assign C_stage2  = ~C_stage1;

    
        // Sequential logic (clock + asynchronous reset)
    always @(posedge clk) begin
        if (rst) begin
            C  <= 1'b0;
        end else begin
            C  <= C_stage2;
        end
    end
    
endmodule
