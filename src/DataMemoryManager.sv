module DataMemoryManager(address_i, CLK, data_i, wren_i,byte_mode_i, data_o );
input logic [31:0] address_i, data_i,byte_mode_i;
input logic  CLK, wren_i;
output logic [31:0] data_o;

logic [1:0] sel;
logic [3:0] wren;
logic [31:0] data [3:0];
logic RST=0;

assign sel = address_i[19:18];


assign wren[0] = (sel==2'b00)? wren_i:0;
assign wren[1] = (sel==2'b01)? wren_i:0;
assign wren[2] = (sel==2'b10)? wren_i:0;
assign wren[3] = (sel==2'b11)? wren_i:0;
assign data_o = sel[1]? (sel[0]?data[3]:data[2]):(sel[0]?data[1]:data[0]);

Ram  #(.G(10), .mif_filename("mem_data/in_ram.txt")) ram0 (	.address_i(address_i), 
							.CLK(CLK), 
							.RST(RST), 
							.data_i(data_i), 
							.EN(wren[0]), 
							.data_o(data[0]), 
							.ByteMode_i(byte_mode_i));

Ram  #(.G(10),.mif_filename("mem_data/in_ram.txt")) ram1 (	.address_i(address_i), 
							.CLK(CLK), 
							.RST(RST), 
							.data_i(data_i), 
							.EN(wren[1]), 
							.data_o(data[1]), 
							.ByteMode_i(byte_mode_i));
							
Ram  #(.G(10),.mif_filename("mem_data/in_ram.txt")) ram2 (	.address_i(address_i), 
							.CLK(CLK), 
							.RST(RST), 
							.data_i(data_i), 
							.EN(wren[2]), 
							.data_o(data[2]), 
							.ByteMode_i(byte_mode_i));
							
Ram  #(.G(10),.mif_filename("mem_data/in_ram.txt")) ram3 (	.address_i(address_i), 
							.CLK(CLK), 
							.RST(RST), 
							.data_i(data_i), 
							.EN(wren[3]), 
							.data_o(data[3]), 
							.ByteMode_i(byte_mode_i));

//DataMemSection datamem_0(
//	.address(address_i[15:0]),
//	.clock(CLK),
//	.data(data_i),
//	.wren(wren[0]),
//	.q(data[0]));
//
//DataMemSection datamem_1(
//	.address(address_i[15:0]),
//	.clock(CLK),
//	.data(data_i),
//	.wren(wren[1]),
//	.q(data[1]));
//
//DataMemSection datamem_2(
//	.address(address_i[15:0]),
//	.clock(CLK),
//	.data(data_i),
//	.wren(wren[2]),
//	.q(data[2]));
//	
//	
	
endmodule





