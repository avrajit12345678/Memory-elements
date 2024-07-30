module ram #(parameter Width=8,Depth=16)(
input clk,
input wrEn,
input[$clog2(Depth)-1:0] wrAddr,
input[Width-1:0] wrData,
input[$clog2(Depth)-1:0] rdAddr,
output reg [Width-1:0]  rdData);

//Writing to memory logic
reg [Width-1:0]mem[Depth-1:0];
always@(posedge clk)
begin
	if(wrEn)
		begin
		mem[wrAddr]=wrData;
			
		end
end
//Read logic
always@(posedge clk)
	rdData=mem[rdAddr];

endmodule  