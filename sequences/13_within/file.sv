//--------------------------------------------------------------------------------------------
// within
//--------------------------------------------------------------------------------------------
module top;

  bit a,b, m_clk;
 
  //clock generation
  initial begin
    m_clk = 1'b0;
    forever #5 m_clk=!m_clk;
  end
 
  //generating signals trdy ,irdy
  initial begin
    a=1;b=1;
  	#5 a=1;b=0;
   	#5 a=0;b=1;
   	#5 a=1;b=1;
   	#1 a=0;b=1;
  end
 

  //writing assertion condition in sequence
  sequence data;
    @(posedge m_clk)  a within ## [1:2] b ;
  endsequence
 
  //checking assertion 
  assert property(data)
    $info("assertion passed");
  else
    $error("out");
  
  initial begin
    $monitor("%t:a=%d,b=%d,m_clk=%d",$time,a,b,m_clk);
    #30 $finish;
  end
 
  initial begin
    $dumpvars();
    $dumpfile("module.vcd");
  end


endmodule: top
