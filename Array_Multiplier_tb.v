module Array_Multiplier_tb;
    parameter n = 5;
    reg signed [n-1:0] a, x;
    wire signed [2*n:0] Result;

    Array_Multiplier #(n) A1 (.*);
    
    initial begin
        a = 5; x = 3;
        #10;
        $display("a = %d, x = %d, Result = %d", a, x, Result);
        
        a = -5; x = 3;
        #10;
        $display("a = %d, x = %d, Result = %d", a, x, Result);
        
        a = 0; x = 3;
        #10;
        $display("a = %d, x = %d, Result = %d", a, x, Result);
        
        a = 0; x = 0;
        #10;
        $display("a = %d, x = %d, Result = %d", a, x, Result);
          a = 9; x = 0;
        #10;
        $display("a = %d, x = %d, Result = %d", a, x, Result);
          a =-4 ; x = -4;
        #10;
        $display("a = %d, x = %d, Result = %d", a, x, Result);
          a = 4; x =-6 ;
        #10;
        $display("a = %d, x = %d, Result = %d", a, x, Result);
        #10;
        $stop;
    end
endmodule