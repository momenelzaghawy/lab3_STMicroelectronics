module booth_recoading (in_1,in_2,out);
    parameter N=32;
    input [3:0] in_1;
    input signed [N-1:0]in_2;
    output reg signed [N+1:0]out;
    always @(*) begin
        case (in_1)
            4'd0 :out=0 ;
            4'd1 :out= in_2 ;
            4'd2  :out= in_2 ;
            4'd3  :out= in_2*2 ;
            4'd4  :out= in_2*2 ;
            4'd5  :out= in_2*3 ;
            4'd6  :out= in_2*3 ;
            4'd7  :out= in_2*4 ;
            4'd8  :out= in_2*-4 ;
            4'd9  :out= in_2*-3 ;
            4'd10  :out= in_2*-3 ;
            4'd11  :out= in_2*-2 ;
            4'd12  :out= in_2*-2 ;
            4'd13  :out= in_2*-1 ; 
            4'd14  :out= in_2*-1 ;
            default: out= 0;
        endcase
    end
endmodule