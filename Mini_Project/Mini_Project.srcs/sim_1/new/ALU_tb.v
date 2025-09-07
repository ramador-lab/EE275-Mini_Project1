`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 03:29:44 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;

// Testbench signals
reg  [31:0] A;
reg  [31:0] B;
reg        Cin;
wire [31:0] Sum;
wire        Cout;
    

// Instantiate the ALU
ALU ALU_sim (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);
initial begin
        $display("Time\tA\t\t\tB\t\t\tCin\t|\tSum\t\t\t\t\tCout");
        $monitor("%0dns\t%h\t%h\t%b\t|\t%h\t%b", $time, A, B, Cin, Sum, Cout);

        // Test case 1
        A = 32'h0000_0000; B = 32'h0000_0000; Cin = 0; #10;

        // Test case 2
        A = 32'h0000_0001; B = 32'h0000_0001; Cin = 0; #10;

        // Test case 3 THIS IS OVERFLOW
        A = 32'hFFFF_FFFF; B = 32'h0000_0001; Cin = 0; #10;

        // Test case 4
        A = 32'h0000_1111; B = 32'h0000_0002; Cin = 0; #10;

        // Test case 5
        A = 32'h1234_5678; B = 32'h8765_4321; Cin = 1; #10;

        // Test case 6 (carry propagation)
        A = 32'hFFFF_FFFF; B = 32'hFFFF_FFFF; Cin = 1; #10;

        $finish;
    end
endmodule
