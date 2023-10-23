`timescale 1ns / 1ps

module four_bit_adder_tb;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] s;
    wire Cout;

    // Instantiate the four-bit adder
    adder_four_bit testadd(.sum(s), .Cout(Cout), .a(a), .b(b));

    initial begin
        // Add the VCD file and variables dumping commands
        $dumpfile("adder.vcd");
        $dumpvars(0, four_bit_adder_tb);

        // Initialize test inputs
        a = 4'b0000;
        b = 4'b0001;

        // Test cases
        #30;
        a = 4'b0001;
        b = 4'b0001;

        #30;
        a = 4'b0010;
        b = 4'b0001;

        #30;
        a = 4'b0100;
        b = 4'b0101;

        #30;
        a = 4'b1100;
        b = 4'b1101;

        // Finish the simulation
        #30;
        $finish;
    end
endmodule
