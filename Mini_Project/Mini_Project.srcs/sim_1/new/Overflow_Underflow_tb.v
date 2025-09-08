`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 01:54:45 PM
// Design Name: 
// Module Name: Overflow_Underflow_tb
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for Overflow_Underflow
//////////////////////////////////////////////////////////////////////////////////

module tb_Overflow_Underflow;

    // Testbench signals
    reg  clk;
    reg  rst;
    reg  A;
    reg  B;
    wire CC;

    // Instantiate DUT
    Overflow_Underflow uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .CC(CC)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        A   = 0;
        B   = 0;

        // Release reset
        #12 rst = 0;

        // Case 1: A=0, B=0 ? CC=0
        #10 A = 0; B = 0;

        // Case 2: A=0, B=1 ? CC=1
        #10 A = 0; B = 1;

        // Case 3: A=1, B=0 ? CC=1
        #10 A = 1; B = 0;

        // Case 4: A=1, B=1 ? CC=0
        #10 A = 1; B = 1;

        // Back to reset
        #10 rst = 1;
        #10 rst = 0;

        // Case 5: Toggle values quickly
        #10 A = 1; B = 0;
        #10 A = 0; B = 1;

        // Finish simulation
        #50 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("t=%0t | A=%b B=%b || CC=%b", $time, A, B, CC);
    end

endmodule

