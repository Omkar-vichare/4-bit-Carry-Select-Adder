`timescale 1ns / 1ps

module FA(s1,co,a1,b1,cin1);
input a1,b1,cin1;
output s1,co;
wire wire1,wire2,wire3;
xor xor1(s1,a1,b1,cin1);
and and1(wire1,a1,b1);
and and2(wire2,b1,cin1);
and and3(wire3,a1,cin1);
or or1(co,wire1,wire2,wire3);
endmodule

module mux(y,a2,b2,sel);
input a2,b2,sel;
output y;
assign y = (sel == 1'b0)?a2:b2; 
endmodule

module CSA(s,cout,x,y,cin);
input [3:0]x,y;
input cin;
output [3:0]s;
output cout;
wire [3:0]a,b,c1,c2;

FA FA1(a[0],c1[0],x[0],y[0],0);
FA FA2(a[1],c1[1],x[1],y[1],c1[0]);
FA FA3(a[2],c1[2],x[2],y[2],c1[1]);
FA FA4(a[3],c1[3],x[3],y[3],c1[2]);

FA FA5(b[0],c2[0],x[0],y[0],1);
FA FA6(b[1],c2[1],x[1],y[1],c2[0]);
FA FA7(b[2],c2[2],x[2],y[2],c2[1]);
FA FA8(b[3],c2[3],x[3],y[3],c2[2]);

mux mux1(s[0],a[0],b[0],cin);
mux mux2(s[1],a[1],b[1],cin);
mux mux3(s[2],a[2],b[2],cin);
mux mux4(s[3],a[3],b[3],cin);

mux mux5(cout,c1[3],c2[3],cin);

endmodule








