`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for 32-bit Ripple-Carry Adder (ALU)
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

    // Testbench signals
    reg         clk;
    reg         rst;
    reg  [31:0] A;
    reg  [31:0] B;
    reg         Cin;
    wire [31:0] Sum;
    wire        Cout;

    // Instantiate ALU
    ALU uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Clock generation (10ns period -> 100MHz)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        A   = 0;
        B   = 0;
        Cin = 0;

        // Hold reset for 2 cycles
        #20;
        rst = 0;

        // Apply test vectors
        @(posedge clk);
        A = 32'h0000_0001;  B = 32'h0000_0001;  Cin = 0; // 1 + 1 = 2

        @(posedge clk);
        A = 32'h0000_0005;  B = 32'h0000_0003;  Cin = 0; // 5 + 3 = 8

        @(posedge clk);
        A = 32'hFFFF_FFFF;  B = 32'h0000_0001;  Cin = 0; // overflow test

        @(posedge clk);
        A = 32'hAAAA_AAAA;  B = 32'h5555_5555;  Cin = 1; // alternating pattern

        @(posedge clk);
        A = 32'h1234_5678;  B = 32'h1111_1111;  Cin = 0; // random test

        // Finish after some cycles
        #50;
        $finish;
    end

    // Monitor results
    initial begin
        $monitor("Time=%0t | A=%h B=%h Cin=%b || Sum=%h Cout=%b",
                  $time, A, B, Cin, Sum, Cout);
    end

endmodule
