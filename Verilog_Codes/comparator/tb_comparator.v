`timescale 1ns / 1ps

module tb_comparator_four_bit;

    //defining inputs and outputs
    reg [3:0] A;
    reg [3:0] B;
    wire Greater_than;
    wire Less_than;
    wire Equal;

    //instantiating the unit under test (uut)
    comparator_four_bit uut(
        .A(A),
        .B(B),
        .Greater_than(Greater_than),
        .Less_than(Less_than),
        .Equal(Equal));

    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0, uut);

        //initializing inputs
        A = 4'b0000;
        B = 4'b0000;

        #50;

        //adding stimulus here
        A = 4'b0001;
        B = 4'b0000;

        #50;

        //verifying the results
        if (Greater_than === 1'b1 && Less_than === 1'b0 && Equal === 1'b0)
            $display("Test case 1 passed");
        else
            $display("Test case 1 failed");

        //second stimulus
        A = 4'b0000;
        B = 4'b0001;

        #50;

        if (Greater_than === 1'b0 && Less_than === 1'b1 && Equal === 1'b0)
            $display("Test case 2 passed");
        else
            $display("Test case 2 failed");

        //third stimulus
        A = 4'b0000;
        B = 4'b0000;

        #50;

        if (Greater_than === 1'b0 && Less_than === 1'b0 && Equal === 1'b1)
            $display("Test case 3 passed");
        else
            $display("Test case 3 failed");

        $finish;
    end

endmodule







