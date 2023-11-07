module alu_block(
    input [1:0]S,           //control bits S1 and S0
    output [3:0]result);

    not(not_S0, S[0]);
    not(not_S1, S[1]);
    
    //assigning the result bits as the outputs of the 2x4 Decoder
    and(result[0], not_S0, not_S1);
    and(result[1], S[0], not_S1);
    and(result[2], not_S0, S[1]);
    and(result[3], S[0], S[1]);

    

endmodule
