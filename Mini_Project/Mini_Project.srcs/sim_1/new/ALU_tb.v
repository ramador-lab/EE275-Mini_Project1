`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for 32-bit Clocked ALU
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg [31:0] A;
    reg [31:0] B;
    reg Cin;
    wire [31:0] Sum;
    wire Cout;

    // Instantiate the ALU
    ALU uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Clock generator: 10 ns period
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        A = 0; B = 0; Cin = 0;

        // Hold reset for a few cycles
        #12 rst = 0;

        // Test case 1: 10 + 5
        #10 A = 32'd10; B = 32'd5; Cin = 0;

        // Test case 2: max value + 1 (overflow check)
        #20 A = 32'hFFFFFFFF; B = 32'd1; Cin = 0;

        // Test case 3: random values
        #20 A = 32'd12345; B = 32'd54321; Cin = 0;

//        // Test case 4: with Cin = 1
//        #20 A = 32'd100; B = 32'd50; Cin = 0;

        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | rst=%b | A=%d | B=%d | Cin=%b | Sum=%d | Cout=%b",
                  $time, rst, A, B, Cin, Sum, Cout);
    end

endmodule
