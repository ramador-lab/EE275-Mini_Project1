`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 03:14:41 PM
// Design Name: 
// Module Name: Logical_And_tb
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

module Less_Than_Equal_To_tb;
    // Testbench signals
    reg clk;
    reg rst;
    reg [31:0] A;
    reg [31:0] B;
    wire C;

    // Instantiate the DUT
    Less_Than_Equal_To dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C)
    );

    // Clock generation: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        A = 32'b0;
        B = 32'b0;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: all zeros
        A = 32'h0000_0000;
        B = 32'h0000_0000;
        #10;
        $display("Test 1: A=%h, B=%h, C=%b", A, B, C);

        // Test case 2: all ones
        A = 32'hFFFF_FFFF;
        B = 32'hFFFF_FFFF;
        #10;
        $display("Test 2: A=%h, B=%h, C=%b", A, B, C);

        // Test case 3: mixed bits (not all 1s)
        A = 32'hFFFF_0001;
        B = 32'hFFFF_0000;
        #10;
        $display("Test 3: A=%h, B=%h, C=%b", A, B, C);

        // Test case 4: one zero bit
        A = 32'hFFFF_FFFE;
        B = 32'hFFFF_FFFF;
        #10;
        $display("Test 4: A=%h, B=%h, C=%b", A, B, C);

        // Finish simulation
        #10;
        $finish;
    end

endmodule
