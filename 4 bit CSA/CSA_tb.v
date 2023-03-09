`timescale 1ns / 1ps

module CSA_tb();
reg [3:0]x,y;
reg cin;
wire [3:0]s;
wire cout;
integer i = 0;

CSA dut(s,cout,x,y,cin);

initial begin
    for(i=0; i<20; i=i+1)
        begin
        x = $urandom_range(0,8);
        y = $urandom_range(0,8);
        cin = $urandom_range(0,1);
        #20;
        end
end

endmodule