`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for Full_Adder
//////////////////////////////////////////////////////////////////////////////////

module Full_Adder_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg A;
    reg B;
    reg Cin;
    wire Sum;
    wire Cout;

    // Instantiate the Full_Adder
    Full_Adder uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Clock generator: 10ns period
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize
        clk = 0;
        rst = 1;   // Start with reset asserted
        A = 0; B = 0; Cin = 0;

        // Hold reset for a bit
        #12 rst = 0;  // Release reset

        // Try all input combinations
        #10 A=0; B=0; Cin=0;  
        #10 A=0; B=0; Cin=1;  
        #10 A=0; B=1; Cin=0;  
        #10 A=0; B=1; Cin=1;  
        #10 A=1; B=0; Cin=0;  
        #10 A=1; B=0; Cin=1;  
        #10 A=1; B=1; Cin=0;  
        #10 A=1; B=1; Cin=1;  

        // Apply reset again mid-simulation
        #10 rst = 1;
        #10 rst = 0;

        // Finish
        #20 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | rst=%b | A=%b B=%b Cin=%b || Sum=%b Cout=%b",
                 $time, rst, A, B, Cin, Sum, Cout);
    end

endmodule
