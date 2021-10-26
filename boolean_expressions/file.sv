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
  $dumpfile("boolean_assertions.vcd");
end
  
  
endmodule
