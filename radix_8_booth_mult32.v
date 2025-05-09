module radix_8_booth_mult32 (clk,rstn,a,x,product);
     input clk, rstn;
    input signed [31:0] a,x;
    output reg signed [63:0] product;
   wire [33:0]booth_out,CSA_Sout,CSA_Cout;
   reg [33:0]multiplier,sum,carry;
   reg [31:0]multiplicand;
   reg d_ff_Q;
   wire [3:0]add;
   wire [32:0] d_ff_sum;
   booth_recoading B1(.in_1(multiplier[3:0]),.in_2(multiplicand),.out(booth_out));

   CSA #(34) C1 (.A(booth_out),.B({{3{sum[33]}}, sum[33:3] }),.C({ {2{carry[33]}}, carry[33:2]}),.S(CSA_Sout),.carry(CSA_Cout));

   assign d_ff_sum={{3{sum[33]}},sum[33:3]}+{{2{carry[33]}},carry[33:2]}+d_ff_Q;

   assign add=sum[2:0]+{carry[1:0],d_ff_Q};
   always @(posedge clk,negedge rstn) begin
    if (!rstn) begin
        	multiplier <= {x[31],x,1'b0};
	        multiplicand <= a;
	        sum   <= 34'b0;
	        carry <= 34'b0;
	        d_ff_Q  <= 1'b0;
	        product<=64'b0;
    end
    else begin
        multiplier<=multiplier >>3;
		sum   <= CSA_Sout;
		carry  <= CSA_Cout;
		d_ff_Q      <=add[3];
		product <={d_ff_sum,add[2:0],product[32:3]};
    end
   end
endmodule