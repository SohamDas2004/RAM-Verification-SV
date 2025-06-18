class write_driver;
 
 virtual ram_interace.WR_DRV_MP write_driver_if;
 
 transaction data_to_duv;
 
 mailbox #(transaction) gen_to_wr_driver;
 
 function new(virtual ram_interface.WR_DRV_MP write_driver_if,mailbox #(transaction) gen_to_wr_driver);
 
 	this.write_driver_if = write_driver_if;
 	this.gen_to_wr_driver = gen_to_wr_driver;
 
 endfunction
 
 task start();
 
 fork
 	forever
 		begin
 			gen_to_wr_driver.get(data_to_duv);
 
 			drive();
 
 
 		end
 join
 endtask
 
 
 task drive();
 
 @(write_driver_if.wr_driver_cb)
 
 	write_driver_if.wr_driver_cb.data_in <= data_to_duv.data_in;
 
 	write_driver_if.wr_driver_cb.wr_address <= data_to_duv.wr_address;
 
 	write_drvier_if.wr_driver_cb.wr_enable <= data_to_duv.wr_en;
 
 repeat(3)
 
 @(write_driver_if.wr_driver_cb)
 
 	write_driver_if.write_driver_cb.wr_enable <= 'b0;
 
 endtask
endclass
