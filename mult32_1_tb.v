module mult32_1_tb ();
    reg clk, rstn;
    reg signed [31:0] a, x;
    wire signed [64:0] product;
    mult32_1 M1 (.clk(clk), .rstn(rstn), .a(a), .x(x), .product(product));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        a = 74; x = 90; rstn = 0;
        #2 rstn = 1;
	#320;
        $display("a=%d, x=%d ,product=%d", a, x,product);
	rstn = 0;a = 946738; x = 393746;
	#2 rstn = 1;
        #320;
	$display("a=%d, x=%d,product=%d", a, x,product);
        rstn = 0;a = -90876; x = 78;
        #2 rstn = 1;
	#320;
	$display("a=%d, x=%d,product=%d", a, x,product);
        rstn = 0;a = 8765; x = -345;
        #2 rstn = 1;
	#320;
	$display("a=%d, x=%d,product=%d", a, x,product);
        rstn = 0;a = -8773; x = -926;
        #2 rstn = 1;
	#320;
	$display("a=%d, x=%d,product=%d", a, x,product);
        rstn = 0;a = 9324; x = 0;
        #2 rstn = 1;
	#320;
	$display("a=%d, x=%d,product=%d", a, x,product);
        rstn = 0;a = 0; x = 6243;
        #2 rstn = 1;
	#320;
	$display("a=%d, x=%d,product=%d", a, x,product);
	$stop;
    end
endmodule