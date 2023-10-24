`timescale 1ns / 1ps

module testbench;

    reg [3:0] a, b;
    wire G, E, L;

    //instantiate the comparator module
    comparator_4bit uut (
        .G(G),
        .E(E),
        .L(L),
        .a(a),
        .b(b));

    //clock generation
    reg clk = 0;
    always begin
        #5 clk = ~clk;
    end

    //stimulus
    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0, uut, clk);
        
        $display("a | b | G | E | L");
        $display("------------------");

        //test with specific examples
        //example 1    
        a = 5;
        b = 3;
        #1; //wait for one time unit
        $display("%b | %b | %b | %b | %b", a, b, G, E, L);

        a = 7;  //example 2
        b = 7;
        #1; //wait for one time unit
        $display("%b | %b | %b | %b | %b", a, b, G, E, L);

        a = 3;  //example 3
        b = 6;
        #1; //wait for one time unit
        $display("%b | %b | %b | %b | %b", a, b, G, E, L);

        //terminate simulation
        $finish;
    end

endmodule
