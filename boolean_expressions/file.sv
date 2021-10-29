//--------------------------------------------------------------------------------------------
// boolean_expressions
//--------------------------------------------------------------------------------------------
module top;  
  
  bit a;
  integer b;
  byte q[$]; 
  
  property p1;
    $rose(a) |-> q[0];
  endproperty

  property p2;
    integer l_b;
    ($rose(a), l_b = b) |-> ##[3:10] q[l_b];
  endproperty
  
  initial begin
    $monitor($time,"a=%d,b=%d",a,b);
    #20 $finish;
  end
  
  initial begin
    $dumpvars();
    $dumpfile("top");
  end
  
  
endmodule


/*module top;

  bit clk;
  bit a; 
  integer b; 
  byte q[$];

  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end

  initial begin
    repeat(2)
    a = $urandom();
    b = $urandom();
    q[$] = $urandom();
  end

  property p1; 
    $rose(a) |-> q[0]; 
  endproperty 
  
  property p2; 
    integer l_b; 
    ($rose(a), l_b = b) |-> ##[3:10] q[l_b]; 
  endproperty


  initial begin
    $monitor ($time, "clk = %0d, a = %0d, b = %0d,q[$] = %0d", clk, a, b,q[$]);
    #40 $finish;
  end

endmodule*/


