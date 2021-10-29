//--------------------------------------------------------------------------------------------
// throughout
//--------------------------------------------------------------------------------------------
module top;
  
  bit trdy,irdy,burst_mode, m_clk;
            	
  //clock generation
  initial begin
    m_clk = 1'b0;
    forever #5 m_clk=!m_clk;
  end
 
  //generating signals trdy ,irdy,burst_mode
  initial begin
    trdy=0;irdy=0;burst_mode=1; 
    #2 trdy=0;irdy=1;burst_mode=0;
    #2 trdy=0;irdy=0;burst_mode=0;
    #10 trdy=0;irdy=0;burst_mode=0;
    #20 trdy=1;irdy=0;burst_mode=1;
  end
 
  //writing assertion condition in sequence
  sequence burst_rule1;
    @(posedge m_clk) $fell(burst_mode) ##0
    ((!burst_mode) throughout (##2 ((trdy==0)&&(irdy==0)) [*7]));
  endsequence


  //checking assertion 
  assert property(burst_rule1)
    $info("assertion passed");
  else
    $error("out");

  initial begin
    $monitor("%t:trdy=%d,irdy=%d,burst_mode=%d,m_clk=%d",$time,trdy,irdy,burst_mode,m_clk);
    #100 $finish;
  end

  initial begin
    $dumpvars();
    $dumpfile("module.vcd");
  end

endmodule: top
