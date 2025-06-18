class transaction;
 
 rand rd_enable;
 
 rand logic wr_en;
 
 rand logic [3:0] wr_address;
 
 rand logic [3:0] rd_address;
 
 rand logic [31:0] data_in;
 
 logic [31:0] data_out;
 
 
 static int read_transaction_number;
 
 static int write_transaction_number;
 
 static int transaction_id;
 
 
 //constraints when we apply randomization
 
 constraint valid_address {wr_address == rd_address;}
 
 constraint valid_control {{rd_enable,wr_enable} != 2'b00;}
 
 constraint data_valid {data_in inside {[0 : 100]};}
 
 
//////////////////////////////////////////////////////////////////
 
 function void display(input string message);
 
 $display("%s",message);
 
 $display("transaction number is %d",trasaction_id);
 
 $display("read_transaction_number is %d",read_transaction_number);
 
 $display("write_transaction_number is %d",write_transaction_number);
 
 $display("read address : %0d and write address : %0d",read_address,write_address);
 
 $display("input data is %d and output data is %d",data_in,data_out);
 
 endfunction

/////////////////////////////////////////////////////////////////////
  
function bit compare (input transaction tr_h,output string message);
 compare = 0;
 
 begin
 
 if(this.rd_address != tr_h.rd_address)
 begin
 message = "MISMATCH IN ADDRESS";
 return 0;
 end
 
 if(this.data_out != tr_h.data_out)
 begin 
 message = "MISMATCH IN DATA";
 return 0;
 end
 end
 
 begin
 message = "COMPARISION SUCESSFULL"; 
 return 1;
 end
 
 endfunction
 
///////////////////////////////////////////////////////////////////

function void post_randomize(); //optional function and will be called when we call randomize function
 
 if(this.rd_enable == 1'b1 && this.wr_en == 1'b0)
 
 read_transaction_number ++;
 
 else if(this.rd_enable == 1'b0 && this.wr_en == 1'b1)
 
 write_transaction_number++;
 
endfunction
 
 endclass
