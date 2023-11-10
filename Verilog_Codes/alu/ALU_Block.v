`include "./and.v"
`include "./comparator.v"
`include "./add_sub.v"

module alu_block(
    input [3:0] A,
    input [3:0] B,
    input [1:0] S,           //control 2-bit number S
    output reg [3:0] result);

    wire not_S0, not_S1;
    wire enable_add, enable_sub, enable_comp, enable_and;
    wire [3:0] A_add, B_add, A_sub, B_sub, A_comp, B_comp, A_and, B_and;
    wire [3:0] add_result, sub_result, comp_result, and_result;
    wire Greater_than, Less_than, Equal;
    wire carry, borrow;

    not U1(not_S0, S[0]);
    not U2(not_S1, S[1]);

    //assigning the result bits as the outputs of the 2x4 Decoder
    assign U3 = not_S0 & not_S1;
    assign U4 = S[0] & not_S1;
    assign U5 = not_S0 & S[1];
    assign U6 = S[0] & S[1];

    //determining enable signals based on the decoder result
    assign enable_add = (U3 == 1'b1);
    assign enable_sub = (U4 == 1'b1);
    assign enable_comp = (U5 == 1'b1);
    assign enable_and = (U6 == 1'b1);

    //creating enable blocks for each operation
    enable_block add_enable(A, B, enable_add, A_add, B_add);
    enable_block sub_enable(A, B, enable_sub, A_sub, B_sub);
    enable_block comp_enable(A, B, enable_comp, A_comp, B_comp);
    enable_block and_enable(A, B, enable_and, A_and, B_and);

    //performing ALU operations using 4-bit adder/subtractor, comparator, and AND gate
    four_bit_adder_subtractor adder(A_add, B_add, S[0], add_result, carry);
    four_bit_adder_subtractor subtractor(A_sub, B_sub, S[0], sub_result, borrow);
    comparator_four_bit comparator(A_comp, B_comp, Greater_than, Less_than, Equal);
    AND and_gate(A_and, B_and, and_result);

    //concatenating the results of individual operations
    always @* begin
        if (enable_add)
            result = add_result;
        else if (enable_sub)
            result = sub_result;
        else if (enable_comp)
            result = {Greater_than, Less_than, Equal};
        else if (enable_and)
            result = and_result;
        else
            result = 4'b0000;
    end

endmodule


module enable_block(
    input [3:0] A,
    input [3:0] B,
    input enable,
    output [3:0] new_A,
    output [3:0] new_B);

    //defining the new inputs for the ALU operations to be performed
    assign new_A = (enable) ? A : 4'b0000;
    assign new_B = (enable) ? B : 4'b0000;

endmodule