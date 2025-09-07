`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025
// Module Name: ALU_2s_comp
// Description: 32-bit 2's complement ALU with clock and reset
//////////////////////////////////////////////////////////////////////////////////

module ALU_2s_comp(
    input  wire        clk,    // Clock
    input  wire        rst,    // Active-high reset
    input  wire [31:0] A,      // 32-bit input
    input  wire [31:0] B,      // 32-bit input
    input  wire        Cin,    // Initial carry in
    output reg  [31:0] Sum,    // 32-bit sum
    output reg         Cout    // Final carry out
);

    wire [31:0] C;      // Internal carry from ALU
    wire [31:0] Ain;    // Inverted A
    wire [31:0] Bin;    // Constant 1 for 2's complement

    // Compute 2's complement: Ain = ~A, Bin = 1
    assign Ain = ~A;
    assign Bin = 32'h0000_0001;

    // Instantiate ALU (assume ALU already has clk/rst ports)
    wire [31:0] Sum_internal;
    wire        Cout_internal;

    ALU alu0 (
        .clk(clk),
        .rst(rst),
        .A(Ain),
        .B(Bin),
        .Cin(Cin),
        .Sum(Sum_internal),
        .Cout(Cout_internal)
    );

    // Register outputs on clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Sum  <= 32'b0;
            Cout <= 1'b0;
        end else begin
            Sum  <= Sum_internal;
            Cout <= Cout_internal;
        end
    end

endmodule
