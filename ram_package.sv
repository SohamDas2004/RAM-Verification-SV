package ram_package;

 int number_of_transactions = 2;

 `include "transaction.sv"
 `include "generator.sv"
 `include "wr_driver.sv"
 `include "rd_driver.sv"
 `include "wr_monitor.sv"
 `include "rd_monitor.sv"
 `include "reference.sv"
 `include "scoreboard.sv"
 `include "env.sv"

endpackage
