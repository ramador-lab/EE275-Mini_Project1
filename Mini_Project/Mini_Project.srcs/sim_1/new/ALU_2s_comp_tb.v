`timescale 1ns / 1ps

module tb_ALU_2s_comp;

    // Testbench signals
    reg        clk;
    reg        rst;
    reg [31:0] A;
    reg [31:0] B;
    reg        Cin;
    wire [31:0] Sum;
    wire        Cout;

    // Instantiate the DUT
    ALU_2s_comp dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        // Initialize signals
        rst = 1;
        A = 32'd0;
        Cin = 1'b0;  // For 2's complement, Cin = 1
        #12;         // Hold reset for a bit

        rst = 0;

        // Test case 1: 5 - 3
        A = 32'd5;
        B = 32'd1;
        #20;
        // Finish simulation
        $finish;
    end

    // Optional: monitor outputs
    initial begin
        $display("Time\t A\t B\t Sum\t Cout");
        $monitor("%0t\t %d\t %d\t %d\t %b", $time, A, B, Sum, Cout);
    end

endmodule
