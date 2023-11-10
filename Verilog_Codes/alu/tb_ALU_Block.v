`timescale 1ns / 1ps

module tb_alu_block;
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] S;
    wire [3:0] result;

    alu_block UUT(
        .A(A),
        .B(B),
        .S(S),
        .result(result));

    // Initialize inputs
    initial begin
        $dumpfile("alu_block.vcd");
        $dumpvars(0, UUT);
        A = 4'b1100; // 12 in binary
        B = 4'b0011; // 3 in binary
        S = 2'b00;   // control bits for addition

        #50;

        $display("A = %b, B = %b, S = %b", A, B, S);
        $display("Result = %b", result);

        //control bits for subtraction
        S = 2'b01;
        #50;
        $display("A = %b, B = %b, S = %b", A, B, S);
        $display("Result = %b", result);

        //control bits for comparison
        S = 2'b10;
        #50;
        $display("A = %b, B = %b, S = %b", A, B, S);
        $display("Greater_than = %b, Less_than = %b, Equal = %b", result[2], result[1], result[0]);

        // Set for logical AND
        S = 2'b11;
        #50;
        $display("A = %b, B = %b, S = %b", A, B, S);
        $display("Result = %b", result);

        // Finish simulation
        $finish;
    end
endmodule
