//--------------------------------------------------------------------------------------------
// Module:      Top
// Description: Example for first_match operator
//--------------------------------------------------------------------------------------------

module top;	

  logic clk;
	logic a;
	logic b;
	logic c;
	logic d;
	logic e;

	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end
	
	initial begin
		repeat (5) 
		forever begin
			#1;
			{a,b,c,d,e}=$urandom;
		end
	end

	sequence s1;
		(a ##[1:5] b) first_match (c ##1 d ##1 e);
	endsequence : s1

	S1: assert property (@(edge clk) s1)
      else $error ("Assertion failed");
	
	initial begin
	  $monitor ($time, "clk = %0d, a = %0d, b = %0d, c = %0d, d = %0d, e = %0d", clk, a, b, c, d, e);
	  #40 $finish;
	end
	
  /*
	initial begin
	  $dumpvars();
	  $dumpfile("top.vcd");
	end
  */
	
endmodule : top
