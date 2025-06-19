class rd_monitor;
 
 virtual ram_interface.RD_MON_MP rd_mon_if;
 
 transaction data_to_ref_model;
 
 transaction data_to_scoreboard;
 
 
 mailbox#(transaction) monitor_to_ref_model;
 
 
 mailbox#(transaction) monitor_to_scoreboard;
 
 function new(virtual ram_interface.RD_MON_MP,
 rd_mon_if,monitor_to_ref_model,monitor_to_scoreboard);
 
 this.rd_mon_if = rd_mon_if;
 this.monitor_to_ref_model = monitor_to_ref_model;
 this.monitor_to_scoreboard = monitor_to_scoreboard;
 
 data_to_ref_model = new();
 
 endfunction
 
 task monitor();
 
 @(rd_monitor_if.rd_monitor_cb);
 
 wait(rd_monitor_if.rd_monitor_cb.rd_enable == 1'b1)
 
 @(rd_monitor_if.rd_monitor_cb)
 
 begin
 
 data_to_ref_model.rd_enable =rd_monitor_if.rd_monitor_cb.rd_enable;
 
 data_to_ref_model.rd_address = rd_monitor_if.rd_monitor_cb.rd_address;
 
 
 
 data_to_ref_model.data_out = rd_monitor_if.rd_monitor_cb.data_out;
 
 
 data_to_ref_model.display("--------DATA MONITORED FROM READ MONITOR-------");
 
 task start();
 
 fork 
 forever
 begin
 monitor();
 
 monitor_to_ref_model.put(data_to_ref_model);
 
 monitor_to_scoreboard.put(data_to_ref_model);
 
 end
 join
 
 endtask
endclass 
