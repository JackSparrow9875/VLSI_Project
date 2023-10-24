module AND(
    //defining the inputs and outputs
    input [3:0] a,
    input [3:0] b,
    output [3:0] result);

    //defining a wire array which stores the result of the bit-wise AND operation of a and b in the same respective order
    wire [3:0] results;

    //here, we use the module 'and_gate' that basically performs the AND operation of two-bits
    and_gate and0 (.a(a[0]), .b(b[0]), .x(results[0]));
    and_gate and1 (.a(a[1]), .b(b[1]), .x(results[1]));
    and_gate and2 (.a(a[2]), .b(b[2]), .x(results[2]));
    and_gate and3 (.a(a[3]), .b(b[3]), .x(results[3]));

    assign result = results;

endmodule


//defining the new module and_gate
module and_gate(
    //defining the inputs and outputs
    input a,
    input b,
    output x);

    //defining the structural code
    and(x,a,b);

endmodule
