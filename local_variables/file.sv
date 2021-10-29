//--------------------------------------------------------------------------------------------
// Local_variables
//--------------------------------------------------------------------------------------------
module top;
  
  bit clk,a,b,c,e,f;
 
  //clock generation
  initial begin
    clk = 1'b0;
    forever #1 clk=!clk;
  end 
  
  //generating signals a,b,c,e,f
  initial begin
    repeat(2)
    forever
  begin
    a=1;b=1;c=1;e=1;f=1;
    #1 a=1;b=1;c=0;e=0;f=1;
    #1 a=0;b=1;c=0;e=1;f=0;
    #1 a=1;b=0;c=1;e=0;f=1;
    #1 a=1;b=1;c=1;e=1;f=1;
  end
end

//assigning local variable in the property
  property data;
    bit x,y;
    @(posedge clk) (a ##1 b, x = e, y = x && f) ##1 c[*2];
  endproperty 

//checking assertion  
  assert property(data)
  else
    $error("out"); 

  initial begin
    $monitor("%t:a=%d,b=%d,c=%d,e=%d,f=%d",$time,a,b,c,e,f);
    #50 $finish;
  end
  
  initial begin
    $dumpvars();
    $dumpfile("top.vcd");
  end
  
endmodule

