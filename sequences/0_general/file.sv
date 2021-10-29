//--------------------------------------------------------------------------------------------
// Module:      Top
// Description: General sequence example
//--------------------------------------------------------------------------------------------
module top;

  logic clk;
  logic a;
  logic b;

  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end
                    
  initial begin
    repeat (2) 
    forever begin
      #1;
      {a,b}=$urandom;
    end
  end

  sequence s1 (a,b,min,max,delay);
    //-------------------------------------------------------
    // Example: a ##1 b[1:2]
    //-------------------------------------------------------
    a ##delay b[min:max];
  endsequence : s1
    
  S1: assert property (@(posedge clk) s1 (1,1,1,2,1))
      else $error ("Assertion failed");
    
  initial begin
    $monitor ($time, "clk = %0d, a = %0d, b = 0%d,", clk, a, b);
    #20 $finish;
  end
    
endmodule : top
