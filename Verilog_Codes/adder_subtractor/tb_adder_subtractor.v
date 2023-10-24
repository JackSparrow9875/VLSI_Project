`timescale 1ns / 1ps

module tb_four_bit_adder_subtractor;
    //defining inputs and outputs
    reg [3:0] a, b;
    reg add_subtract;
    reg carry_in;
    wire [3:0] result;
    wire carry_out;

    //instantiate the module under test
    four_bit_adder_subtractor uut (
        .a(a),
        .b(b),
        .add_subtract(add_subtract),
        .carry_in(carry_in),
        .result(result),
        .carry_out(carry_out));

    //clock generation
    reg clk = 0;
    always begin
        #5 clk = ~clk;
    end

    //test vectors
    initial begin
    $dumpfile("adder_subtractor.vcd");
    $dumpvars(0, uut, clk);


    $monitor("Time=%0t: a=%b, b=%b, add_subtract=%b, carry_in=%b, result=%b, carry_out=%b", $time, a, b, add_subtract, carry_in, result, carry_out);
        
    //test case 1: Addition
    a = 4'b1100;
    b = 4'b0010;
    add_subtract = 0;   //perform addition
    carry_in = 0;       //initial carry is 0
    #10 $finish;

    //test case 2: Subtraction
    a = 4'b1100;
    b = 4'b0010;
    add_subtract = 1;   //perform subtraction
    carry_in = 0;       //initial carry is 0
    #10 $finish;

    end

endmodule
