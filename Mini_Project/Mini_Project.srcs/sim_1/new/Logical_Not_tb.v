`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2025 03:47:00 PM
// Design Name: 
// Module Name: Logical_Not_tb
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

module tb_Logical_Not;

    // Testbench signals
    reg clk;
    reg rst;
    reg [31:0] A;
    wire C;

    // Instantiate the DUT
    Logical_Not dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .C(C)
    );

    // Clock generation: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Apply reset
        rst = 1;
        A = 32'b0;
        #10;
        rst = 0;

        // Test case 1: all zeros
        A = 32'h0000_0000;
        #10;
        $display("Test 1: A=%h, C=%b", A, C); // Expect C=1

        // Test case 2: all ones
        A = 32'hFFFF_FFFF;
        #10;
        $display("Test 2: A=%h, C=%b", A, C); // Expect C=0

        // Test case 3: mixed bits
        A = 32'hAAAA_AAAA;
        #10;
        $display("Test 3: A=%h, C=%b", A, C); // Expect C=0 (since ~A & A = ~A & A = 0)

        // Test case 4: single one bit
        A = 32'h0000_0001;
        #10;
        $display("Test 4: A=%h, C=%b", A, C); // Expect C=0

        // Test case 5: single zero bit in mostly ones
        A = 32'hFFFF_FFFE;
        #10;
        $display("Test 5: A=%h, C=%b", A, C); // Expect C=0

        // Finish simulation
        #10;
        $finish;
    end

endmodule
