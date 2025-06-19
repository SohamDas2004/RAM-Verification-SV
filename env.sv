class env;
 
 virtual ram_interface.WR_DRV_MP wr_drv_if;
 virtual ram_interface.RD_DRV_MP rd_drv_if;
 virtual ram_interface.WR_MON_MP wr_mon_if;
 virtual ram_interface.RD_MON_MP rd_mon_if;
 
 mailbox #(transaction) gen_to_wr_driver = new();
 mailbox #(transaction) gen_to_rd_driver = new();
 mailbox#(transaction) wr_mon_to_ref_model = new();
 mailbox#(transaction) rd_mon_to_ref_model= new();
 mailbox#(transaction) rd_mon_to_sb= new();
 mailbox#(transaction) ref_model_sb= new();
 
 generator genh;
 read_driver rd_drv_h;
 write_driver wr_drv_h;
 write_monitor wr_mon_h;
 read_monitor rd_mon_h;
 
 reference_model ref_mod_h;
 
 scoreboard sb_h;
 
 
 function new(virtual ram_interface.WR_DRV_MP wr_drv_if,
 virtual ram_interface.RD_DRV_MP rd_drv_if,
 virtual ram_interface.WR_MON_MP wr_mon_if,
 virtual ram_interface.RD_MON_MP rd_mon_if);
 
 this.wr_drv_if = wr_drv_if;
 this.rd_drv_if = rd_drv_if;
 this.wr_mon_if = wr_mon_if;
 this.rd_mon_if = rd_mon_if;
 
 endfunction
 
 
 task build;
 
 genh = new(gen_to_wr_driver,gen_to_rd_driver);
 rd_drv_h = new(rd_drv_if,gen_to_rd_driver);
 wr_drv_h = new(wr_drv_if,gen_to_wr_driver);
 wr_mon_h = new(wr_mon_if,wr_mon_to_ref_model);
 rd_mon_h = new(rd_mon_if,rd_mon_to_ref_model);
 ref_mod_h = new(wr_mon_to_ref_model,rd_mon_to_ref_model,ref_model_sb);
 sb_h = new(ref_model_sb,rd_mon_to_sb);
 
 endtask
 
 
 task start();
 gen_h.start();
 wr_drv_h.start();
 rd_drv_h.start();
 rd_mon_h.start();
 ref_mod_h.start();
 sb_h.start();
 
 endtask
 
 task run();
 
 start();
 
 endtask
endclass
