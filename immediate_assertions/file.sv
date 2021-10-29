//--------------------------------------------------------------------------------------------
// immediate_assertions
//--------------------------------------------------------------------------------------------
module top;

  bit clk;
  bit [3:0]a,b,c;
  
  always #1 clk=!clk;
  
  always@(posedge clk)
    begin
      a=$random();
      b=$random();
      c=$random();
    end
    
    
  //Assert statement

  /*always@(posedge clk)
    begin
      if(a>5 || b>5)
        begin
          $info("Entering assert statement");
          assert(c<=9) 
            $info($time,"Pass");
          else
            $error($time,"Fail");
        end
    end*/
  

  //Assume Statement
    
  /*always@(posedge clk)
  
    begin
      if(a>5 || b>5)
        begin
          $info("Entering assert statement");
          assume(c<=9) 
            $info($time,"Pass");
          else
            $error($time,"Fail");
        end
    end*/
  
   
  //Cover statement
    always@(posedge clk) begin
      if(a>5 || b>5) begin
        $info("Entering assert statement");
        cover(c<=9) 
        $info($time,"Pass");
      end
    end
  
  initial 
    begin 
      $monitor($time,"a=%d,b=%d,c=%d",a,b,c);
      #20 $finish;
    end
  
  initial
    begin
      $dumpvars();
      $dumpfile("immediate_assertions.vcd");
    end
endmodule
