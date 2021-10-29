//--------------------------------------------------------------------------------------------
// Module:      Top
// Description: Example for Goto Repitition  
//--------------------------------------------------------------------------------------------

module top;

  logic clk;
  logic a;
  logic b;
  logic c;
  
  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    repeat (5) 
    forever begin
      #1;
      {a,b,c}=$urandom;
    end
  end
  
  sequence s1;
    a ##1 b[->3:6] ##1 c;
  endsequence : s1
  
  S1: assert property (@(edge clk) s1)
      else $error ("Assertion failed");
  
  initial begin
    $monitor ($time, "clk = %0d, a = %0d, b = %0d c = %0d", clk, a, b, c);
    #40 $finish;
  end
  
  /*
  initial begin
      $dumpvars();
        $dumpfile("top.vcd");
  end
  */
  
endmodule : top
