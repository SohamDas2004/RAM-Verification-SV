class scoreboard;
 
 
 int data_count_ref_model;
 int data_count_monitor;
 
 
 transaction ref_model_data;
 transaction recieved_data;
 
 mailbox#(transaction) ref_to_sb_data;
 mailbox#(transaction) mon_to_sb_data;
 
 function new(mailbox #(transaction) ref_to_sb_data,mailbox#(transaction) mon_to_sb_data);
 
 this.ref_to_sb_data = ref_to_sb_data;
 this.mon_to_sb_data = mon_to_sb_data;
 
 endfunction
 
 task checking (transaction rcvd_data);
 
 string difference;
 
 if(rcvd_data.rd_enable == 1'b1)
 begin
 if(rcvd_data.data_out == 0)
 $display("scoreboard : random stimulus not generated");
 
 else if(!rcvd_data.rd_enable == 1 && rcvd.data_out != 0)
 
 begin
 if(!ref_model_data.compare(rcvd_data,difference))
 
 rcvd_data.display("scoreboard: recieved_data");
 
 end
 
 end
 
 endtask
 
 
 
 
 
 task start();
 fork
 while(1)
 begin
 ref_to_sb_data.get(ref_model_data);
 data_count_ref_model ++;
 
 mon_to_sb_data.get(recieved_data);
 data_count_monitor ++;
 
 checking(recieved_data);
 
 end
 join
 endtask
