//This is the RTL file where the RAM design is made
module ram_rtl(input clk,rst,rd_enb,wr_enb,
 
 				input [3:0] wr_addr,rd_addr,
 
 				input [31:0] data_in,
 
 				output reg [31:0] data_out);
 
 
 reg [31:0] mem [7:0]; //total location : 8,each location width = 32;
 
 //write operation
 
 always@(posedge clk) 
 begin
 if(wr_enb)
 mem[wr_addr] <= data_in;
 
 end
 
 always@(posedge clk)
 begin
 if(rd_enb)
 data_out <= mem[rd_addr];
 end
endmodule
