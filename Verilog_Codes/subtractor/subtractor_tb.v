`timescale 1ns / 1ps

module subtractor_four_bit_tb;
    reg [3:0] a;       // 4-bit minuend
    reg [3:0] b;       // 4-bit subtrahend
    wire [3:0] diff;   // 4-bit difference output
    wire Bout;         // Borrow output

    // Instantiate the subtractor module
    subtractor_four_bit uut (
        .a(a),
        .b(b),
        .diff(diff),
        .Bout(Bout)
    );

    initial begin
        // Add the VCD file and variables dumping commands
        $dumpfile("subtractor.vcd");
        $dumpvars(0, subtractor_four_bit_tb);

        // Test case 1: 7 - 3
        a = 4'b0111;
        b = 4'b0011;
        #10; // Wait for 10 time units
        $display("Test Case 1 - Subtract: 7 - 3 = %b, Borrow: %b", diff, Bout);

        // Test case 2: 10 - 5
        a = 4'b1010;
        b = 4'b0101;
        #10; // Wait for 10 time units
        $display("Test Case 2 - Subtract: 10 - 5 = %b, Borrow: %b", diff, Bout);

        // Add more test cases as needed

        $finish; // Finish the simulation
    end

endmodule
