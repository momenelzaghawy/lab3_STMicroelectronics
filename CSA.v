module CSA  (A,B,C,S,carry);
     parameter N=32;
     input [N-1:0] A,B,C;
    output [N-1:0] S;
    output [N-1:0] carry;
    assign S=A^B^C;  //sum generate
    genvar i;
    generate
        for (i =0 ;i<N ;i=i+1 ) begin   //carry generate
             assign carry[i] = (A[i] & B[i]) | (A[i] & C[i]) | (B[i] & C[i]);
        end
    endgenerate
endmodule