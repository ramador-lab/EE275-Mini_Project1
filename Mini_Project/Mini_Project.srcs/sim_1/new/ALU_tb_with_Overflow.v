`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for ALU
//////////////////////////////////////////////////////////////////////////////////

module tb_ALU;

    // Testbench signals
    reg         clk;
    reg         rst;
    reg  [31:0] A;
    reg  [31:0] B;
    reg         Cin;
    wire [31:0] Sum;
    wire        Cout;
    wire        CC;

    // DUT instance
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

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        A   = 0;
        B   = 0;
        Cin = 0;

        // Apply reset
        #12 rst = 0;

        // Test 1: Simple addition
        #10 A = 32'd15; B = 32'd10; Cin = 0;

        // Test 2: With carry-in
        #20 A = 32'd20; B = 32'd25; Cin = 1;

        // Test 3: Large numbers (check carry out)
        #20 A = 32'hFFFF_FFFF; B = 32'd1; Cin = 0;

        // Test 4: Random inputs
        #20 A = 32'h1234_5678; B = 32'h8765_4321; Cin = 0;

        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("t=%0t | A=%h B=%h Cin=%b || Sum=%h Cout=%b CC=%b", 
                  $time, A, B, Cin, Sum, Cout, CC);
    end

endmodule
