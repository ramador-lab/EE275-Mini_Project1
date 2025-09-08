`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 32-bit Sequential ALU with cycle-accurate ready signal
//////////////////////////////////////////////////////////////////////////////////

module ALU (
    input  wire        clk,    // Clock
    input  wire        rst,    // Active-high reset
    input  wire [31:0] A,      // 32-bit input
    input  wire [31:0] B,      // 32-bit input
    input  wire        Cin,    // Initial carry in
    output wire [31:0] Sum,    // 32-bit sum
    output wire        Cout,   // Final carry out
    output wire        CC,     // Overflow/underflow flag
    output reg         ready   // High when result is fully valid
);

    wire [31:0] C;  // Internal carry wires

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

    // Ready generation using a shift register for 32-cycle propagation
    reg [31:0] ready_shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ready_shift <= 32'b0;
            ready <= 1'b0;
        end else begin
            // Shift in 1 at LSB each clock; ready becomes 1 after 32 cycles
            ready_shift <= {ready_shift[30:0], 1'b1};
            ready <= ready_shift[31];
        end
    end

endmodule
