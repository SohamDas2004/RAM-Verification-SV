interface ram_interface(input bit clk)
 
 logic rd_enable; //read signal 
 
 logic wr_enable;//write signal
 
 logic[3:0] wr_addr; //write signal
 
 logic[3:0] rd_addr; //read signal 
 
 logic[31:0] data_in; //write signal
 
 logic[31:0] data_out;
 
 //clocking block declarion for write driver
 
 clocking wr_driver_cb @(posedge clk);
 default input #1 output #2;
 
 output data_in;
 
 output wr_addr;
 
 output wr_enable;
 
 endclocking
 
 //clocking block for read driver
 
 clocking rd_driver_cb@(posedge clk);
 default input #1 output #2;
 
 output rd_addr;
 
 output rd_enable;
 
 endclocking
 
 //clocking block for monitor
 
 clocking wr_monitor_cb@(posedge clk);
 
 default input #1 output #2;
 
 
 input data_in;
 
 input wr_addr;
 
 input wr_enable;
 
 endclocking
 
 //clocking block for read monitor
 
 clocking rd_monitor_cb@(posedge clk);
 
 default inpout #1 output #2;
 
 input rd_addr;
 
 input rd_enable;
 
 input data_out;
 
 endclocking
 
 modport WR_DRV_MP (clocking wr_driver_cb);
 modport RD_DRV_MP (clocking rd_driver_cb);
 modport WR_MON_MP(clocking wr_monitor_cb);
 modport RD_MON_MP(clocking rd_monitor_cb);
 
 endinterface
