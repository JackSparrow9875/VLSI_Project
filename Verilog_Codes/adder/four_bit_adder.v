/* In this code we are trying to write the verilog code for a 4-bit adder. To achieve this we are creating a seperate module
called full_add that basically is the verilog-coded version of a full-adder that takes in three inputs, say A, B and Cin
and gives out two outputs, Sum and Cout. Logically, Sum = XOR(A,B,Cin) and Cout = (A*B)+(B*Cin)+(Cin*A). After creating
this module we then use this module multiple times to obtain the 4-bit sum and 1-bit carry of the the two given 4-bit inputs
and Cin */

module adder_four_bit(
    //defining the inputs and outputs of the 4-bit adder
    output [3:0]sum, 
    output Cout , 
    input [3:0]a,b);

    //let us create some wires to which we can assign the Cins from each of the full-adders
    wire c1,c2,c3,c4;

    full_add ad0( .a(a[0]), .b(b[0]),.cin(1'b0), .s(sum[0]), .cout(c1));
    full_add ad1( .a(a[1]), .b(b[1]),.cin(c1), .s(sum[1]), .cout(c2));
    full_add ad2( .a(a[2]), .b(b[2]),.cin(c2), .s(sum[2]), .cout(c3));
    full_add ad3( .a(a[3]), .b(b[3]),.cin(c3), .s(sum[3]), .cout(c4));
    assign Cout=c4;

endmodule


//definig the full-adder moudle
module full_add(
    input a,
    input b,
    input cin,
    output s, 
    output cout);
    
    assign s=a^b^cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule