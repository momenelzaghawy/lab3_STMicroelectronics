module mult32_1 (clk,rstn,a,x,product);
input clk,rstn;
input signed[31:0]a,x;
output reg signed[64:0]product;
reg signed[32:0]multiplicand_reg;
reg [5:0]count;
wire [32:0]add,subt;
    assign add = product[64:32]+multiplicand_reg;
    assign subt = product[64:32]-multiplicand_reg;
    always @(posedge clk,negedge rstn) begin
        if (!rstn) begin
            multiplicand_reg <= {a[31],a};
            product <= {33'b0,x};
            count <= 0;
        end
        else begin
		if(product[0]==1'b0)
		begin
			product <=product>>>1;
			count <=count+1;
		end
 		else begin
			if (count<31) begin
				product <= {add[32],add,product[31:1]};
				count <=count+1;
        		end
        		else 
            			product <= {subt[32],subt,product[31:1]};
		end
        end
    end

endmodule
