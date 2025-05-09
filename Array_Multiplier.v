module Array_Multiplier (a, x, Result);
    parameter n = 5;
    input signed [n-1:0] a, x;
    output reg signed[2*n:0] Result;

    wire [n-1:0] multiplier, multiplicand;
    wire [n-2:0] c [0:n-2];
    wire [n-2:0] s [0:n-2];
    wire sign;
    wire [2*n-1:0] p;
    wire [n-2:0] carry;

    assign multiplier = x[n-1] ? -x : x;
    assign multiplicand = a[n-1] ? -a : a;
    assign p[0] = multiplicand[0] & multiplier[0];
    assign p[2*n-1] = carry[n-2];
    assign sign = x[n-1] ^ a[n-1];

    genvar i,j;
    generate
    for (i = 0; i < n-1; i = i + 1) begin : stage1
        full_adder I0 (
            .a(multiplicand[i+1] & multiplier[0]),
            .b(multiplicand[i] & multiplier[1]),
            .cin(1'b0),
            .sum(s[0][i]),
            .cout(c[0][i])
        );
    end
    endgenerate

    generate
    for (i = 0; i < n-2; i = i + 1) begin : stage2
        for (j = 0; j < n-2; j = j + 1) begin : stage2_inner
            full_adder I1 (
                .a(c[i][j]),
                .b(s[i][j+1]),
                .cin(multiplicand[j] & multiplier[i+2]),
                .sum(s[i+1][j]),
                .cout(c[i+1][j])
            );
        end
    end
    endgenerate

    generate
    for (i = 0; i < n-2; i = i + 1) begin : stage3
        full_adder I2 (
            .a(c[i][n-2]),
            .b(multiplicand[n-1] & multiplier[i+1]),
            .cin(multiplicand[n-2] & multiplier[i+2]),
            .sum(s[i+1][n-2]),
            .cout(c[i+1][n-2])
        );
    end
    endgenerate

    generate
    for (i = 0; i < n-1; i = i + 1) begin : stage4
        if (i == 0) begin
            full_adder I3 (
                .a(1'b0),
                .b(c[n-2][0]),
                .cin(s[n-2][1]),
                .sum(p[n]),
                .cout(carry[i])
            );
        end else if (i < n-2) begin
            full_adder I4 (
                .a(carry[i-1]),
                .b(c[n-2][i]),
                .cin(s[n-2][i+1]),
                .sum(p[n+i]),
                .cout(carry[i])
            );
        end else begin
            full_adder I5 (
                .a(carry[i-1]),
                .b(c[n-2][i]),
                .cin(multiplicand[n-1] & multiplier[n-1]),
                .sum(p[n+i]),
                .cout(carry[i])
            );
        end
    end
    endgenerate

    generate
    for (i = 0; i <= n-2; i = i + 1) begin : assign_p
        assign p[i+1] = s[i][0];
    end
    endgenerate

    always @(*) begin
        if (sign) 
            Result = {sign, -p};
        else 
            Result = {sign, p};
    end
endmodule
