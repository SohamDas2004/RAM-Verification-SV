class write_monitor;
 
 virtual ram_interface.WR_MON_MP wr_monitor_if;
 
 transaction data_to_ref_model;
 
 transaction cov_data;
 
 mailbox #(transaction) monitor_to_ref_model;
 
 covergroup mem_coverage;
 
 wr_addr : coverpoint cov_data.wr_address {
 bins ZERO = {0};
 bins LOW_RANGE = {[1:3]};
 bins MID_RANGE = {[4:5]};
 bins HIGH_RANGE = {[7:8]};
 
 }
 
 
 
 data : coverpoint cov_data.data_in {
 bins ZERO = {0};
 bins RANGE = {[1:100]};
 
 }
 
 
 
 wr_enable : coverpoint cov_data.wr_enable{
 bins WRITE = {[0:1]};}
 
 
 endgroup
 
 
 function new(virtual ram_interface.WR_MON_MP wr_monitor_if,mailbox#(transaction) monitor_to_ref_model);
 
 this.wr_monitor_if = wr_monitor_if;
 this.monitor_to_ref_model = monitor_to_ref_model;
 
 data_to_ref_model = new();
 
 mem_coverage = new();
 
 
 endfunction
 
 
 task monitor();
 
 @(wr_monitor_if.wr_monitor_cb);
 wait(wr_monitor_if.wr_monitor_cb.wr_enable == 1'b1)
 
 data_to_ref_model.wr_en = wr_monitor_if.wr_monitor_cb.wr_enable;
 data_to_ref_model.wr_address = wr_monitor_if.wr_monitor_cb.wr_address;
 data_to_ref_model.data_in = wr_monitor_if.wr_monitor_cb.data_in;
 
 endtask
 
 
 
 task start();
 fork
 forever
 begin
 monitor();
 
 cov_data = data_to_ref_model;
 
 mem_coverage.sample();
 
 
 monitor_to_ref_model.put(data_to_ref_model);
 
 end
 join 
 endtask
endclass
