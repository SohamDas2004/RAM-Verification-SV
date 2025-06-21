module top;
 
 reg clk;
 reg rst;
 
 ram_interface rf(clk);
 
 test test_h;
 
 ram_rtl dut(clk,rst,rf.rd_enable,rf.wr_enable,rf.wr_address,rf.rd_address,rf.data_in,rf.data_out);
 
 
 initial
 begin
 test_h = new(rf,rf,rf,rf);
 
 test_h.build_and_run();
 
 end
 
 initial
 begin
 clk = 0;
 
 forever #10 clk = ~clk;
 
 end
 
 initial
 
 begin
 
 @(negedge clk)
 reset = 0;
 @(negedge clk)
 reset = 1;
 @(negedge clk)
 reset = 0;
 
 end
endmodule
