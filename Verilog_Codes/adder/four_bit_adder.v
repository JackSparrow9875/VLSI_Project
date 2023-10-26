/* In this code we are trying to write the verilog code for a 4-bit adder. To achieve this we are creating a seperate module
called full_add that basically is the verilog-coded version of a full-adder that takes in three inputs, say A, B and Cin
and gives out two outputs, Sum and Cout. Logically, Sum = XOR(A,B,Cin) and Cout = (A*B)+(B*Cin)+(Cin*A). After creating
this module we then use this module multiple times to obtain the 4-bit sum and 1-bit carry of the the two given 4-bit inputs
and Cin */

module four_bit_adder(
    //defining the inputs and outputs
    input [3:0]a,b,
    input c,
    output [3:0]sum,
    output carry);
    
    //defining wires to which we will assign the values of carries
    wire c0,c1,c2;

    fulladder f0(sum[0],c0,a[0],b[0],c);
    fulladder f1(sum[1],c1,a[1],b[1],c0);
    fulladder f2(sum[2],c2,a[2],b[2],c1);
    fulladder f3(sum[3],carry,a[3],b[3],c2);
    //the above part of the code uses the another module named 'fulladder' that basically performs the addition of two
    //bits as that of a full-adder. f(i) takes a(i), b(i) and c(i) (only 'c' if i=0) and produces the output sum(i) and
    //carry of the respective addition.

endmodule



//we are defining the module 'fulladder' in structural-behavioural form
module fulladder(sum,carry,a,b,c3);
    //defining the inputs
    output sum,carry;
    input a,b,c3;
    
    //defining the required wires
    wire p,q,r;
    
    //necessary code in structural form
    xor(p,a,b);
    and(r,a,b);
    xor(sum,p,c3);
    and(q,p,c3);
    or(carry,q,r);

endmodule