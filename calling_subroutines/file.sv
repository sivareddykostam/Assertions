//--------------------------------------------------------------------------------------------
// Calling_subroutines
//--------------------------------------------------------------------------------------------
module top;

  bit  clk,a,b,e,f;
  
  //clock generation
  initial begin
    clk = 1'b0;
    forever #1 clk=!clk;
  end 
  
  //generating signals
  initial begin
    repeat(2)
    forever
  begin
    a=1;b=1;e=1;f=1;
    #2 a=1;b=1;e=0;f=1;
    #2 a=1;b=1;e=1;f=0;
    #2 a=1;b=0;e=0;f=1;
    #2 a=1;b=1;e=1;f=0;
  end
end
  
  //calling subroutine in sequence
  sequence s1;
    logic v, w;
    @(posedge clk) (a, v = e) ##(b[->1], w = f, $display("b after a with v = %h, w = %h\n", v, w));
    (b[->1], w = f, $display("b after a with v = %h, w = %h\n", v, w));
  endsequence

  assert property(s1)
  else
    $error("out"); 
    
  initial begin
    $monitor("%t:a=%d,b=%d,e=%d,f=%d",$time,a,b,e,f);
    #50 $finish;
  end
  
  initial begin
    $dumpvars();
    $dumpfile("top.vcd");
  end
   
   
endmodule

