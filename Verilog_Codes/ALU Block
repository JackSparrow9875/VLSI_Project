module ALU_Block_as_2to4Decoder(S0,S1,enable,y);
    //input ports
    input S0,S1,enable;

    //using reg to store the output values
    output reg [3:0]y;

    always @(S0,S1,enable)
        begin
            //we want the block to work only when enable is not equal to 0. Thus, we can use an 'if'
            //block to execute the requirec code as follows
            if (enable!=0)
                //assing some value of y so that it performs a required mathematical operation
                begin
                    if(S0==1'b0 & S1==1'b0) y=4'b0001;
                    else if(S0==1'b0 & S1==1'b1) y=4'b0010;
                    else if(S0==1'b1 & S1==1'b0) y=4'b0100;
                    else y=4'b1000;
                end
            else
                y=4'b0000;                     
        end
endmodule
