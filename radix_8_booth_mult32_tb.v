module radix_8_booth_mult32_tb ();
    reg clk,rstn;
    reg signed [31:0]a,x;
    wire signed [63:0]product;

    radix_8_booth_mult32 R1 (.*);
    initial begin
        clk=0;
        #10;
        forever #5 clk=~clk;
    end
    initial begin
a=100;x=100;rstn=0; 
#10 rstn=1;
#120
$display("a=%d x=%d result=%d",a,x,product);
a=-9;x=8;rstn=0;
#10 rstn=1;
#120
$display("a=%d x=%d result=%d",a,x,product);
a=-976;x=-654;rstn=0;
#10 rstn=1;
#120
$display("a=%d x=%d result=%d",a,x,product);
a=698;x=0;rstn=0;
#10 rstn=1;
#120
$display("a=%d x=%d result=%d",a,x,product);
a=0;x=678;rstn=0;
#10 rstn=1;
#120
$display("a=%d x=%d result=%d",a,x,product);
a=5;x=-5;rstn=0;
#10 rstn=1;
#120
$display("a=%d x=%d result=%d",a,x,product);
#5;
$stop;
end
endmodule