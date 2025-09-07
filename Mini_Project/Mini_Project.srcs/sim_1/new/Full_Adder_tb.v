`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 03:08:15 PM
// Design Name: 
// Module Name: Full_Adder_tb
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


module tb_full_adder;

reg A, B, Cin;
wire Sum, Cout;

// Instantiate the full adder
Full_Adder full_add_sim (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    $display("A B Cin | Sum Cout");
    A = 0; B = 0; Cin = 0; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    A = 0; B = 0; Cin = 1; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    A = 0; B = 1; Cin = 0; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    A = 0; B = 1; Cin = 1; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    A = 1; B = 0; Cin = 0; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    A = 1; B = 0; Cin = 1; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    A = 1; B = 1; Cin = 0; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    A = 1; B = 1; Cin = 1; #10 $display("%b %b %b |  %b   %b", A,B,Cin,Sum,Cout);
    $finish;
end

endmodule

