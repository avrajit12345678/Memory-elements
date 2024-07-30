module rom #(parameter Width=16,Depth=1024)(
input clk,

input[$clog2(Depth)-1:0] rdAddr,
output reg [Width-1:0]  rdData);

//Writing to memory logic
reg [Width-1:0]mem[Depth-1:0];
integer i;
initial begin
    
    for (i = 0; i < Depth; i = i + 1) begin
        mem[i] = i; // Example: Initialize with address value or load from file
    end
    // Alternatively, load from a file using $readmemh or $readmemb
    // $readmemh("rom_data.hex", mem);
end


//Read logic
always@(posedge clk)
	rdData=mem[rdAddr];

endmodule  