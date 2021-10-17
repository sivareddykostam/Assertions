//--------------------------------------------------------------------------------------------
// Module:      Top
// Description: Example for Typed Formal Arguments
//--------------------------------------------------------------------------------------------

module top;

  logic clk;
  logic a;
  logic b;
  logic c;
  logic e;

  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end
    
  initial begin
    repeat (5) 
    forever begin
      #1;
      {a,b,c,e}=$urandom;
    end
  end

  sequence s1(a,b,bit c);
    a ##1 b ##[2:10]c;
  endsequence : s1
    
  sequence s2(event e);
    @(e) a ##1 b;
  endsequence : s2

  S1: assert property (@(edge clk) s1(a,b,c))
      else $error ("Assertion failed for sequence-1");   

  S2: assert property (s2(edge clk))
      else $error ("Assertion failed for sequence-2");   
      
  initial begin
    $monitor ($time, "clk = %0d, a = %0d, b = 0%d c = %0d, e = %0d", clk, a, b, c, e);
    #40 $finish;
  end
    
endmodule : top
