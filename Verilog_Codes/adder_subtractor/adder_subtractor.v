module four_bit_adder_subtractor(
    //defining the inputs and outputs
    input [3:0] a,
    input [3:0] b,
    input add_subtract,             //control input to select operation (0 for ADD, 1 for SUB)
    input carry_in,
    output [3:0] result,            //net output of the computation
    output carry_out);

    //defining the wires for using them as intermediate carry values
    wire [3:0] c;
    wire carry;

    //here, we have used another module that performs the bit-wise operation of addition or subtraction depending on the
    //value of 'add_subtract'
    full_adder_subtractor f0(result[0], c[0], a[0], b[0], add_subtract, carry_in);
    full_adder_subtractor f1(result[1], c[1], a[1], b[1], add_subtract, c[0]);
    full_adder_subtractor f2(result[2], c[2], a[2], b[2], add_subtract, c[1]);
    full_adder_subtractor f3(result[3], carry, a[3], b[3], add_subtract, c[2]);

    assign carry_out = carry;

endmodule


//defining the 'full_adder_subtractor' module
module full_adder_subtractor(
    //defining inputs and outputs
    output sum,
    output carry,
    input a,
    input b,
    input add_subtract,
    input carry_in);

    //defining the necessary wires
    wire p, g, carry_out;

    //structural implementation of the code
    xor(p, a, b);
    and(g, a, b);
    xor(sum, p, carry_in);
    and(carry_out, g, add_subtract);
    or(carry, carry_out, p);
endmodule


