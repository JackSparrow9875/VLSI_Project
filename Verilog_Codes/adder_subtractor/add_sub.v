module four_bit_adder_subtractor(
    //defining the inputs and outputs
    input [3:0]A,
    input [3:0]B,
    input C_in,
    input m,
    output [3:0]sum,
    output carry);

    //now, depending on the value of 
    always @ (A or B or C_in) begin
        if (m===1'b0) begin
            //perform addition by taking C_in = 1'b0
        end else begin
            //perform subtraction by taking C_in = 1'b1
        end
    end

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

    wire w1, c1, c2, c3, out1;
    xor x1(w1,a,b);             //'sum' is equivalent to the Ex-OR operation performed on the three
    xor x2(sum,w1,c);           //inputs; a,b and c_in

    and a1(c1,a,b);
    and a2(c2,b,c);             
    and a3(c3,a,c);

    or o1(out1,c1,c2);          //this gives us the output 'carry' that is equivalent to the sum
    or o2(carry,out1,c3);       //of the three a and b, b and c_in and a and c_in

endmodule