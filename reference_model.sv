class reference_model;
 
 transaction data_1;
 transaction data_2;
 
 
 mailbox #(transaction) wr_monitor_ref_model;
 mailbox #(transaction) rd_monitor_ref_model;
 mailbox#(transaction) ref_model_sb;
 
 logic[31:0] ref_data [int]; //assosative
 
 function new(mailbox #(transaction) wr_monitor_ref_model,mailbox#(transaction) rd_monitor_to_ref_model,mailbox#(transaction) ref_model_sb);
 
 this.wr_monitor_ref_model = wr_monitor_ref_model;
 this.rd_monitor_ref_model = rd_monitor_ref_model;
 this.ref_model_sb = ref_model_sb;
 
 
 endfunction
 
 task mem_write(transaction data_1);
 
 ref_data[data_1.wr_address] = data_1.data_in;
 
 
 endtask
 
 
 task mem_read(transaction data_2)
 
 data_2.data_out = ref_data[rd_address];
 
 
 endtask
 
 task mem_main_write(transaction data_1);
 
 if(data_1.wr_en)
 mem_write(data_1);
 
 
 
 endtask
 
 
 task mem_main_read(transaction data_2);
 if(data_2.rd_enable)
 mem_read(data_2);
 
 
 
 endtask
 
 
 task start();
 
 fork 
 
 begin
 forever
 begin
 wr_monitor_ref_model.get(data_1);
 mem_main_write(data_1);
 
 
 end
 
 
 forever
 begin
 rd_monitor_ref_model.get(data_2);
 mem_main_read(data_2);
 ref_model_sb.put(data_2);
 
 
 
 end
 join
 endtask
 endclass
