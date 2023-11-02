`timescale 1ns / 1ps

module tb_four_bit_adder_subtractor;
    reg [3:0] A;
    reg [3:0] B;
    reg m;
    wire [3:0] Sum;
    wire Carry;

    //instantiating the four_bit_adder_subtractor module
    four_bit_adder_subtractor UUT (
        .A(A),
        .B(B),
        .m(m),
        .Sum(Sum),
        .Carry(Carry));

    initial begin
    $dumpfile("add_sub.vcd");
    $dumpvars(0,UUT);
    A = 4'b1101;        //binary equivalent of 13
    B = 4'b0011;        //binary equivalent of 3
    //set m to 0 for addition
    m = 1'b0;
    #10;                //add a delay here
    $display("A = %b, B = %b, m = %b", A, B, m);
    #10;                //add a delay here
    $display("Sum = %b, Carry = %b", Sum, Carry);

    A = 4'b1111;        //binary equivalent of 15
    B = 4'b0011;        //binary equivalent of 3
    //set m to 1 for subtraction
    m = 1'b1;
    #10;                //add a delay here
    $display("A = %b, B = %b, m = %b", A, B, m);
    #10;                //add a delay here
    $display("Sum = %b, Carry = %b", Sum, Carry);

    A = 4'b1001;        //binary equivalent of 9
    B = 4'b0011;        //binary equivalent of 3
    //set m to 1 for subtraction
    m = 1'b1;
    #10;                //add a delay here
    $display("A = %b, B = %b, m = %b", A, B, m);
    #10;                //add a delay here
    $display("Sum = %b, Carry = %b", Sum, Carry);

    $finish;
end

endmodule
