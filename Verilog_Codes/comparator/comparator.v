module comparator_4bit(G, E, L, a, b);
    //defining the inputs and outputs
    output G, E, L;
    input [3:0] a, b;

    //defining the necessary wires so that they store the necessary intermediate values
    wire gt_eq_lt_1, gt_eq_lt_2, gt_eq_lt_3, gt_eq_lt_4;    //each one is for the four bits of a and b
    wire G_1, G_2, G_3;
    wire E_1, E_2;
    wire L_1, L_2, L_3, L_4;

    //comparing the most significant digits of a and b
    wire msb_a, msb_b;
    assign msb_a = a[3];
    assign msb_b = b[3];

    xor x1(gt_eq_lt_1, msb_a, msb_b);
    and a1(G_1, msb_a, gt_eq_lt_1);
    and a2(G_2, gt_eq_lt_1, msb_b);

    // Stage 2 - Compare the Next Significant Bits
    wire nsb_a, nsb_b;
    assign nsb_a = a[2];
    assign nsb_b = b[2];

    xor x2(gt_eq_lt_2, nsb_a, nsb_b);
    and a3(G_3, nsb_a, gt_eq_lt_2);
    and a4(G_4, gt_eq_lt_2, nsb_b);

    // Stage 3 - Compare the Remaining Bits
    wire[1:0] rsb_a, rsb_b;
    assign rsb_a = a[1:0];
    assign rsb_b = b[1:0];

    xor x3(gt_eq_lt_3, rsb_a, rsb_b);
    and a5(E_1, G_1, gt_eq_lt_3);
    and a6(E_2, gt_eq_lt_3, L_1);

    // Generate 'Less Than' Signals for Stages 2 and 3
    xor x4(L_1, G_1, gt_eq_lt_2);
    xor x5(L_2, L_1, gt_eq_lt_3);
    xor x6(L_3, G_2, gt_eq_lt_3);
    xor x7(L_4, G_3, gt_eq_lt_3);

    // Combine Results
    or o1(G, G_1, G_2, G_3);
    or o2(E, E_1, E_2);
    or o3(L, L_1, L_2, L_3, L_4);
endmodule
