//--------------------------------------------------------------------------------------------
//Module:       Top
//Description:  Example for Sampled Value function
//--------------------------------------------------------------------------------------------

module top;

  logic clk;
  logic a;
  logic b;
  logic c;
  logic d;
  logic e;
  logic f;
  logic g;
  logic h;
  
  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    repeat (5) 
    forever begin
      #1;
      {a,b,c,d,e,f,g,h}=$urandom;
    end
  end
  
  // $sampled()
  assert property (@(clk) a==b)
  else $error ("$sampled -- different values obtained: a=%b, b=%b", $sampled(a), $sampled(b));
  
  // $rose()
  assert property (@(clk) c |-> $rose(d))
  else $error ("$rose assertion failed for d wrt c");
  
  // $fell()
  assert property (@(clk) !c |-> $fell(e))
  else $error ("$fell assertion failed for e wrt !c");
  
  // $stable()
  assert property (@(clk) c |-> $stable(f))
  else $error ("$stable assertion failed for f wrt c");
  
  // $past()
  assert property (@(clk) !c |-> $past(g))
  else $error ("$past assertion failed for g wrt !c");
  
  // $changed()
  assert property (@(clk) c |-> $changed(h))
  else $error ("$changed assertion failed for h wrt c");
  
  initial begin
    $monitor ($time, "clk = %d, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d", 
    clk, a, b, c, d, e, f, g, h);
    #40 $finish;
  end
  
  /*
  initial begin
    $dumpvars();
    $dumpfile("top.vcd");
  end
  */
  
endmodule : top
