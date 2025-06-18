class read_driver;
 
 virtual ram_interface.RD_DRV_MP rd_inf;
 
 transaction data_to_duv;
 
 mailbox #(transaction) gen_to_rd_driver;
 
 function new(virtual ram_interface.RD_DRV_MP rd_inf,mailbox #(transaction) gen_to_rd_driver);
 
 this.rd_inf = rd_inf;
 this.gen_to_rd_driver = gen_to_rd_driver;
 
 endfunction
 
 task start();
 
 fork 
 forever
 begin
 gen_to_rd_driver.get(data_to_duv);
 drive();
 end
 join
 endtask
 
 task drive();
 @(rd_inf.rd_driver_cb);
 rd_inf.rd_driver_cb.rd_address <= data_to_duv.rd_address;
 rd_inf.rd_driver_cb.rd_enable <= data_to_duv.rd_enable;
 
 repeat(3)
 @(rd_inf.rd_driver_cb)
 rd_inf.rd_driver_cb.rd_enable = 'b0;
 endtask
 
endclass
