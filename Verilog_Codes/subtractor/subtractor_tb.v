`timescale 1ns/1ps

module testbench_four_bit_subtractor;

    // Define signals
    reg [3:0] a, b;
    reg borrow;
    wire [3:0] difference;
    wire carry;

    // Instantiate the four_bit_subtractor module
    four_bit_subtractor uut (
        .a(a),
        .b(b),
        .borrow(borrow),
        .difference(difference),
        .carry(carry));

    // Initialize signals
    initial begin
        $dumpfile("four_bit_subtractor.vcd");
        $dumpvars(0, testbench_four_bit_subtractor);

        // Test cases
        a = 4'b0110;  // 6 in binary
        b = 4'b0011;  // 3 in binary
        borrow = 0;
        #10;

        a = 4'b1101;  // -3 in two's complement
        b = 4'b0101;  // 5 in binary
        borrow = 1;
        #10;

        a = 4'b1100;  // -4 in two's complement
        b = 4'b0010;  // 2 in binary
        borrow = 0;
        #10;

        $finish;
    end

endmodule



