module memory(clk_i,rst_i,addr_i,write_i,wr_rd_i,valid_i,ready_o,read_o);
//parameters
parameter W = 16;//width
parameter D = 511;//depth
parameter AD = 9;//address_width
//port declarations
input clk_i,rst_i;//synchronous
input [AD-1:0] addr_i;//index of memory we want to access.
input [W-1:0] write_i;//data port for writing to the memory
input wr_rd_i;//wr_rd = 1 => write to memory,wr_rd = 0 => read from memory
input valid_i;//handshaking for transaction to memory
output reg[W-1:0] read_o;//data port for reading data from the memory
output reg ready_o;//handshaking for memory is ready to respond to the transaction

reg[W-1:0] mem [D-1:0];//memory
integer i;
//logic
always @(posedge clk_i)
begin
	if(rst_i)begin
		ready_o <=0;
		read_o <= 0;
		for(i=0;i<D;i=i+1)
		begin
			mem[i] <= 0;
		end
	end
	else 
	begin
		if(valid_i)
		begin
			ready_o <= 1;
			if(wr_rd_i)mem[addr_i] <= write_i;
			else read_o <= mem[addr_i];
		end
		else
		begin
			ready_o<= 0;
		end
	end
end
endmodule

