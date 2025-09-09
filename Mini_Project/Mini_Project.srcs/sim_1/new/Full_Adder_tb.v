`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for Full_Adder
//////////////////////////////////////////////////////////////////////////////////

module Full_Adder_tb;

    // Testbench signals
    reg A;
    reg B;
    reg Cin;
    wire Sum;
    wire Cout;

    // Instantiate the Full_Adder
    Full_Adder uut (
//        .clk(clk),
//        .rst(rst),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );


    // Stimulus
    initial begin
        A = 0; B = 0; Cin = 0;
        
        // Try all input combinations
        #10 A=0; B=0; Cin=0;  
        #10 A=0; B=0; Cin=1;  
        #10 A=0; B=1; Cin=0;  
        #10 A=0; B=1; Cin=1;  
        #10 A=1; B=0; Cin=0;  
        #10 A=1; B=0; Cin=1;  
        #10 A=1; B=1; Cin=0;  
        #10 A=1; B=1; Cin=1;  

       
        // Finish
        #20 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | A=%b B=%b Cin=%b || Sum=%b Cout=%b",
                 $time, A, B, Cin, Sum, Cout);
    end

endmodule
