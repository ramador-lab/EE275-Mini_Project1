`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for 32-bit Sequential Ripple-Carry Adder (ALU)
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

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        A   = 0;
        B   = 0;
        Cin = 0;

        // Hold reset for a few cycles
        #15;
        rst = 0;

        // Apply test cases
        @(posedge clk);
        A = 32'h0000_0001;  B = 32'h0000_0001;  Cin = 0;  // 1+1=2

        @(posedge clk);
        A = 32'h0000_0005;  B = 32'h0000_0003;  Cin = 0;  // 5+3=8

        @(posedge clk);
        A = 32'hFFFF_FFFF;  B = 32'h0000_0001;  Cin = 0;  // overflow

        @(posedge clk);
        A = 32'h7FFF_FFFF;  B = 32'h0000_0001;  Cin = 0;  // signed overflow

        @(posedge clk);
        A = 32'h8000_0000;  B = 32'h8000_0000;  Cin = 0;  // negative overflow

        @(posedge clk);
        A = 32'hAAAA_AAAA;  B = 32'h5555_5555;  Cin = 1;  // alternating pattern

        @(posedge clk);
        A = 32'h1234_5678;  B = 32'h1111_1111;  Cin = 0;  // random test

        // Run a few extra cycles then stop
        #50;
        $finish;
    end

    // Monitor results
    initial begin
        $monitor("T=%0t | A=%h B=%h Cin=%b || Sum=%h Cout=%b CC=%b",
                 $time, A, B, Cin, Sum, Cout, CC);
    end

endmodule
