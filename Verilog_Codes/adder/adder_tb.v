`timescale 1ns / 1ps

module testbench_four_bit_adder;

    //define the signals to connect to the four-bit full adder
    reg [3:0] a, b;
    reg c;
    wire [3:0] sum;
    wire carry;

    //instantiate the four-bit full adder
    four_bit_adder uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry));

    //stimulus generation
    initial begin
    //add the VCD file and variables dumping commands
    $dumpfile("adder.vcd");
    $dumpvars(0, uut);
    
    
    $display("Testing Four-Bit Full Adder");

    //test case 1: 3 + 5 = 8 (no carry)
    a = 4'b0011;
    b = 4'b0101;
    c = 1'b0;

    //apply inputs
    #10;

    //check results
    if (sum === 4'b1000 && carry === 1'b0)
      $display("Test case 1 passed");
    else
      $display("Test case 1 failed");

    //test case 2: 7 + 9 = 0 (with carry)
    a = 4'b0111;
    b = 4'b1001;
    c = 1'b0;

    //apply inputs
    #10;

    //check results
    if (sum === 4'b0000 && carry === 1'b1)
      $display("Test case 2 passed");
    else
      $display("Test case 2 failed");

    //additional test cases can be added here

    //finish simulation
    $finish;
  end

endmodule


