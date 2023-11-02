module comparator_four_bit(
    input [3:0] A,
    input [3:0] B,
    output reg Greater_than,
    output reg Less_than,
    output reg Equal);

    wire [3:0] G_bits;
    wire [3:0] L_bits;
    wire [3:0] E_bits;

    //comparing each bit
    comparator_one_bit c3(A[3], B[3], G_bits[3], L_bits[3], E_bits[3]);
    comparator_one_bit c2(A[2], B[2], G_bits[2], L_bits[2], E_bits[2]);
    comparator_one_bit c1(A[1], B[1], G_bits[1], L_bits[1], E_bits[1]);
    comparator_one_bit c0(A[0], B[0], G_bits[0], L_bits[0], E_bits[0]);

    always @* begin
        if (E_bits[3] != 1) begin
            Greater_than = G_bits[3];
            Less_than = L_bits[3];
            Equal = E_bits[3];
        end else if (E_bits[2] != 1) begin
            Greater_than = G_bits[2];
            Less_than = L_bits[2];
            Equal = E_bits[2];
        end else if (E_bits[1] != 1) begin
            Greater_than = G_bits[1];
            Less_than = L_bits[1];
            Equal = E_bits[1];
        end else if (E_bits[0] != 1) begin
            Greater_than = G_bits[0];
            Less_than = L_bits[0];
            Equal = E_bits[0];
        end else begin
            Greater_than = 1'b0;
            Less_than = 1'b0;               //this makes sure that the equality condition is
            Equal = 1'b1;                   //also satisfied
        end
    end
endmodule



module comparator_one_bit(
    input A,
    input B,
    output G,
    output L,
    output E);

    wire nA, nB, and1_out, and2_out, or1_out;

    //inverters
    not (nA, A);
    not (nB, B);

    //AND gates
    and (and1_out, A, nB);                 //means A greater than B and only then equals 1
    and (and2_out, nA, B);                 //means A less than B and only then equals 1

    //OR gate
    or (or1_out, and1_out, and2_out);      //means there is an inequality existing, either A greater
                                           //than or less than B

    //final outputs
    assign G = and1_out;
    assign L = and2_out;
    assign E = ~or1_out;                   //means there is no inequality existing

endmodule



