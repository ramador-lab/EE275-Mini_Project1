`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for ALU with Overflow/Underflow detection
//////////////////////////////////////////////////////////////////////////////////

module ALU_Over_Under_tb;

    // Testbench signals
    reg         clk;
    reg         rst;
    reg  [31:0] A;
    reg  [31:0] B;
    reg         Cin;
    wire [31:0] Sum;
    wire        Cout;
    wire        CC;

    // Instantiate DUT
    ALU uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout),
        .CC(CC)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        A   = 0;
        B   = 0;
        Cin = 0;

        // Apply reset
        #12 rst = 0;

        // Overflow test case: +2147483647 + 1
        #20 A = 32'h7FFF_FFFF;   // Max positive int
            B = 32'h0000_0001;   // +1
            Cin = 0;
//        // Underflow test case
//        #20 A = 32'h8000_0000;   // -2147483648
//            B = 32'hFFFF_FFFF;   // -1
//            Cin = 0; 
            
        // Finish simulation
        #50 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("t=%0t | A=%h B=%h Cin=%b || Sum=%h Cout=%b CC=%b", 
                  $time, A, B, Cin, Sum, Cout, CC);
    end

endmodule
