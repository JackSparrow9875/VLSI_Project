/* In this code, we aim to design a 4-bit subtractor in Verilog. To achieve this, we create a separate module, 'full_subtract,' which serves as a Verilog-coded representation of a full subtractor. The full subtractor module takes in 
three inputs: Minuend (A), Subtrahend (B), and Borrow-In (Bin), and produces two outputs: Difference (Diff) and Borrow-Out 
(Bout). The logic for subtraction is as follows: Diff = A - B - Bin, and Bout represents the borrow-out generated during the 
subtraction. We then use this 'full_subtract' module multiple times to obtain the 4-bit difference and 1-bit borrow-out for
two given 4-bit inputs, representing the Minuend and Subtrahend. This 4-bit subtractor allows us to perform subtraction
operations on 4-bit binary numbers while considering borrow propagation between each bit position, making it a fundamental
component in digital arithmetic and circuit design. */

module subtractor_four_bit(
    output [3:0] diff, // 4-bit difference output
    output Bout,       // Borrow output
    input [3:0] a,     // 4-bit minuend
    input [3:0] b      // 4-bit subtrahend
);

    wire B0,B1,B2,B3; // Borrow wires

    full_subtract fs0 (.a(a[0]), .b(b[0]), .bin(1'b0), .diff(diff[0]), .bout(B0));
    full_subtract fs1 (.a(a[1]), .b(b[1]), .bin(B0), .diff(diff[1]), .bout(B1));
    full_subtract fs2 (.a(a[2]), .b(b[2]), .bin(B1), .diff(diff[2]), .bout(B2));
    full_subtract fs3 (.a(a[3]), .b(b[3]), .bin(B2), .diff(diff[3]), .bout(B3));

    assign Bout = B3;

endmodule

module full_subtract(
    input a,     // Minuend bit
    input b,     // Subtrahend bit
    input bin,   // Borrow input
    output diff, // Difference output
    output bout  // Borrow output
);

    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (bin & (a ^ b));

endmodule

