import ram_pkg::*;

 class test;

 virtual ram_interface.WR_DRV_MP wr_drv_if;
 virtual ram_interface.RD_DRV_MP rd_drv_if;
 virtual ram_interface.WR_MON_MP wr_mon_if;
 virtual ram_interface.RD_MON_MP rd_mon_if;
 
 ram_env env_h;

 function new(virtual ram_interface.WR_DRV_MP wr_drv_if,
 virtual ram_interface.RD_DRV_MP rd_drv_if,
 virtual ram_interface.WR_MON_MP wr_mon_if,
 virtual ram_interface.RD_MON_MP rd_mon_if);

 this.wr_drv_if = wr_drv_if;
 this.rd_drv_if = rd_drv_if;
 this.wr_mon_if = wr_mon_if;
 this.rd_mon_if = rd_mon_if;

 
 env_h = new(wr_drv_if,rd_drv_if,wr_mon_if,rd_mon_if);

 endfunction

 task build_and_run();
 begin
 number_of_transaction = 4;
 env_h.build();
 env_h.run();
 #100 $finish;
 end
 endtask

 endclass
