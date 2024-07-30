module fifo #(parameter FIFO_WIDTH=8, FIFO_DEPTH=8)(
input clk,
input reset,
input fifoWrEn,
input [FIFO_WIDTH-1:0] fifoWrData,
output fifoFull,
input fifoRdEn,
output [FIFO_WIDTH-1:0] fifoRdData,
output fifoEmpty,
output [$clog2(FIFO_DEPTH):0] fifoDataCount
);
reg wrEn;
reg [FIFO_WIDTH-1:0] fifoWrDatap;
reg [$clog2(FIFO_DEPTH):0]dataCounter;
reg [$clog2(FIFO_DEPTH)-1:0]wrPointer;
reg [$clog2(FIFO_DEPTH)-1:0]rdPointer;
//pipeline for aligning with ram wr en
assign validFifoWr=fifoWrEn & !fifoFull;
assign validFifoRd=fifoRdEn & !fifoEmpty;
assign fifoDataCount=dataCounter;
assign fifoFull=(dataCounter==FIFO_DEPTH)?1:0;
assign fifoEmpty=(dataCounter==0)?1:0;
always@(posedge clk)
begin
	fifoWrDatap<=fifoWrData;
end
always @(posedge clk)
begin
	if(reset)
	wrEn=1'b0;
   else if(fifoWrEn &!fifoFull)
   begin
   wrEn=1'b1;
   
   end
   else wrEn=1'b0;
end
always @(posedge clk)
begin
	if(reset)
	dataCounter=0;
   else if(validFifoWr & !validFifoRd)
   begin
   dataCounter=dataCounter+1'b1;
   
   end
   else if(validFifoRd & !validFifoWr)
   begin
   dataCounter=dataCounter-1'b1;
   end
end
always @(posedge clk) // depth power of two so 7+1=8 resets to zero
begin
	if(reset)
		wrPointer <=0 ;
	else if (wrEn)
		wrPointer<=wrPointer+1'b1;
end
always @(posedge clk) // depth power of two so 7+1=8 resets to zero
begin
	if(reset)
		rdPointer <=0 ;
	else if (validFifoRd)
		rdPointer<=rdPointer+1'b1;
end

ram #(.Width(FIFO_WIDTH),.Depth(FIFO_DEPTH)) rm(
.clk(clk),
.wrEn(wrEn),
.wrAddr(wrPointer),
.wrData(fifoWrDatap),
.rdAddr(rdPointer),
.rdData(fifoRdData));

endmodule