`timescale 1ns / 1ps

module tb_ALU_Block_as_2to4Decoder;

    // Inputs
    reg S0;
    reg S1;
    reg enable;

    // Outputs
    wire [3:0] y;

    // Instantiate the Unit Under Test (UUT)
    ALU_Block_as_2to4Decoder uut (
        .S0(S0),
        .S1(S1),
        .enable(enable),
        .y(y)
    );

    initial begin
        // Initialize Inputs
        S0 = 0;
        S1 = 0;
        enable = 0;

        // Add dumpfile and dumpvars commands
        $dumpfile("ALU.vcd");
        $dumpvars(0, tb_ALU_Block_as_2to4Decoder);

        // Wait 100 ns for global reset to finish
        #100;

        // Add test cases here
        // Test case 1: S0=0, S1=0, enable=1
        S0 = 0;
        S1 = 0;
        enable = 1;
        #10;
        $display("y=%b", y);
        
        // Test case 2: S0=0, S1=1, enable=1
        S0 = 0;
        S1 = 1;
        enable = 1;
        #10;
        $display("y=%b", y);
        
        // Test case 3: S0=1, S1=0, enable=1
        S0 = 1;
        S1 = 0;
        enable = 1;
        #10;
        $display("y=%b", y);
        
        // Test case 4: S0=1, S1=1, enable=1
        S0 = 1;
        S1 = 1;
        enable = 1;
        #10;
        $display("y=%b", y);
        
        // Test case 5: S0=0, S1=0, enable=0
        S0 = 0;
        S1 = 0;
        enable = 0;
        #10;
        $display("y=%b", y);

    end

endmodule
