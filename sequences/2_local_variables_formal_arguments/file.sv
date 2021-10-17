//--------------------------------------------------------------------------------------------
// Module:      Top
// Description: Example for Local Variable Formal Arguments  
//--------------------------------------------------------------------------------------------

module top;

  logic clk;
  logic a;
  logic x;
  
  initial begin
    clk =0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    repeat (5) 
    forever begin
      #1;
      {a,x}=$urandom;
    end
  end
  
  sequence s1(local logic p=a);
    ##1 x==p;
  endsequence : s1
  
  S1: assert property (@(edge clk) s1(a))
      else $error("Assertion failed");
  
  initial begin
    $monitor ($time, "clk = %0d, a = %0d, x = %0d", clk, a, x);
    #20 $finish;
  end

endmodule : top
