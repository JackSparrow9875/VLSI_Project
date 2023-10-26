/* In this code, we aim to design a 4-bit subtractor in Verilog. To achieve this, we create a separate module, 'full_subtract,' which serves as a Verilog-coded representation of a full subtractor. The full subtractor module takes in 
three inputs: Minuend (A), Subtrahend (B), and Borrow-In (Bin), and produces two outputs: Difference (Diff) and Borrow-Out 
(Bout). The logic for subtraction is as follows: Diff = A - B - Bin, and Bout represents the borrow-out generated during the 
subtraction. We then use this 'full_subtract' module multiple times to obtain the 4-bit difference and 1-bit borrow-out for
two given 4-bit inputs, representing the Minuend and Subtrahend. This 4-bit subtractor allows us to perform subtraction
operations on 4-bit binary numbers while considering borrow propagation between each bit position, making it a fundamental
component in digital arithmetic and circuit design. */

module four_bit_subtractor(
    //defining the inputs and outputs
    input [3:0] a, b,
    input borrow,
    output [3:0] difference,
    output carry);

    //defining the wires so that we will assign the carry of the individual subtractors
    wire c0, c1, c2;

    full_subtractor fs0(difference[0], c0, a[0], b[0], borrow);
    full_subtractor fs1(difference[1], c1, a[1], b[1], c0);
    full_subtractor fs2(difference[2], c2, a[2], b[2], c1);
    full_subtractor fs3(difference[3], carry, a[3], b[3], c2);
    //the above part of the code uses the another module named 'full_subtractor' that basically performs the subtraction of two
    //bits as that of a full-subtractor. fs(i) takes a(i), b(i) and c(i) (only 'c' if i=0) and produces the output difference(i)
    //and carry of the respective addition.

endmodule


//we are defining the module 'full_subtractor' in structural-behavioural form
module full_subtractor(
    //defining the inputs
    output difference,
    output borrow,
    input minuend,
    input subtrahend,
    input borrow_in);

    //defining the required wires
    wire p, q, r;

    //necessary code in structural form
    xor(p, minuend, subtrahend);
    xor(difference, p, borrow_in);
    and(q, ~minuend, subtrahend);
    and(r, ~p, borrow_in);
    or(borrow, q, r);

endmodule


