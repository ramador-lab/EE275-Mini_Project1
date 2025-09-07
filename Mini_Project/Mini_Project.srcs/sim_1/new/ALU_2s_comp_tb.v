`timescale 1ns / 1ps

module tb_ALU_2s_comp;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;      // Not used in your current module, but declared
    reg        Cin;

    // Outputs
    wire [31:0] Sum;
    wire        Cout;

    // Instantiate the module
    ALU_2s_comp uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Initialize inputs
        A = 32'd0;
        B = 32'd0;
        Cin = 1'b0;

        // Wait for global reset
        #10;

        // Test case 1: Two's complement of 0
        A = 32'd0; Cin = 1'b0;
        #10;
        $display("A=%d, Sum=%d, Cout=%b", A, Sum, Cout);

        // Test case 2: Two's complement of 5
        A = 32'd5; Cin = 1'b0;
        #10;
        $display("A=%d, Sum=%d, Cout=%b", A, Sum, Cout);

        // Test case 3: Two's complement of 100
        A = 32'd100; Cin = 1'b0;
        #10;
        $display("A=%d, Sum=%d, Cout=%b", A, Sum, Cout);

        // Test case 4: Two's complement of -50 (input in 2's complement)
        A = -32'd50; Cin = 1'b0;
        #10;
        $display("A=%d, Sum=%d, Cout=%b", A, Sum, Cout);

        // Test case 5: Maximum positive number
        A = 32'h7FFF_FFFF; Cin = 1'b0;
        #10;
        $display("A=%h, Sum=%h, Cout=%b", A, Sum, Cout);

        // Test case 6: Maximum negative number
        A = 32'h8000_0000; Cin = 1'b0;
        #10;
        $display("A=%h, Sum=%h, Cout=%b", A, Sum, Cout);

        // Finish simulation
        #10;
        $stop;
    end

endmodule
