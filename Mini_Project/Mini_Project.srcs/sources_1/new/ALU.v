`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 32-bit Sequential Ripple-Carry Adder
// Produces Sum and Cout every clock cycle
//////////////////////////////////////////////////////////////////////////////////

module ALU (
    input  wire        clk,    // Clock
    input  wire        rst,    // Active-high reset
    input  wire [31:0] A,      // 32-bit input
    input  wire [31:0] B,      // 32-bit input
    input  wire        Cin,    // Initial carry in
    output reg  [31:0] Sum,    // 32-bit sum (registered)
    output reg         Cout,    // Final carry out (registered)
    output wire        CC     // Overflow/underflow flag
);

    // Internal carry chain
    wire [31:0] C;
    wire [31:0] sum_int;
    wire        cout_int;

    // Overflow/Underflow detection
    Overflow_Underflow overunder (
        .clk(clk),
        .rst(rst),
        .A(C[30]),
        .B(Cout),
        .CC(CC)
    );



    // LSB full adder
    Full_Adder fa0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(sum_int[0]),
        .Cout(C[0])
    );

    // Middle full adders
    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin : adder_chain
            Full_Adder fa (
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i-1]),
                .Sum(sum_int[i]),
                .Cout(C[i])
            );
        end
    endgenerate

    assign cout_int = C[31];

    // Register outputs every clock cycle
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Sum  <= 32'b0;
            Cout <= 1'b0;
        end else begin
            Sum  <= sum_int;
            Cout <= cout_int;
        end
    end

endmodule
