module four_bit_adder_subtractor(
    //defining the inputs and outputs
    input [3:0]A,
    input [3:0]B,
    input m,
    output [3:0]Sum,
    output Carry);

    //depending on the value of 'm', we perform the operation of either addition (m=0),
    //or subtraction (m=1). This allows to directly tie out C0 with m

    wire c0,c1,c2;

    wire B0,B1,B2,B3;
    xor x1(B0,B[0],m);
    xor x2(B1,B[1],m);
    xor x3(B2,B[2],m);
    xor x4(B3,B[3],m);

    full_adder fa0(.a(A[0]),.b(B0),.c_in(m),.sum(Sum[0]),.carry(c0));
    full_adder fa1(.a(A[1]),.b(B1),.c_in(c0),.sum(Sum[1]),.carry(c1));
    full_adder fa2(.a(A[2]),.b(B2),.c_in(c1),.sum(Sum[2]),.carry(c2));
    full_adder fa3(.a(A[3]),.b(B3),.c_in(c2),.sum(Sum[3]),.carry(Carry));
    
endmodule


//defining a full adder module that, as the name suggests, performs the addition of two 1-bit
//numbers 
module full_adder(
    //defining the inputs and outputs of the 
    input a,
    input b,
    input c_in,
    output sum,
    output carry);

    wire w1,c1,c2,c3;

    xor (w1,a,b);              //'sum' is equivalent to the Ex-OR operation performed on the three
    xor (sum,w1,c_in);         //inputs; a,b and c_in
    
    /*initial begin
        $display("sum = %b", sum);
    end*/

    and (c1,a,b);
    and (c2,b,c_in);             
    and (c3,a,c_in);

    or (carry,c1,c2,c3);       //this gives us the output 'carry' that is equivalent to the sum
                               //of the three a and b, b and c_in and a and c_in

endmodule