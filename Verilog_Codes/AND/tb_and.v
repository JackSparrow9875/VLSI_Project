`timescale 1ns / 1ps

module testbench();

    //defining signals to connect to the AND module
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] result;

    //clock generation
    reg clk = 0;
    always begin
        #5 clk = ~clk;
    end

    //instantiating AND module
    AND AND_inst (
        .a(a),
        .b(b),
        .result(result));

    //initializing a and b with test values
    initial begin
        $dumpfile("and.vcd");
        $dumpvars(0, AND_inst, clk);
        a = 4'b1101;
        b = 4'b1010;

        #10;

        $display("a = %b, b = %b, result = %b", a, b, result);
        $finish;
    end

endmodule



