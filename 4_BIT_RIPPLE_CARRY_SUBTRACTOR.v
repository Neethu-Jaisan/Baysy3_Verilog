//Design 
module rippleaddsub(a,b,addsub, sum,cout); 
input[3:0]a,b; 
input addsub; 
output[3:0]sum; 
output cout; 
wire [2:0]s_c; 
wire [3:0]s_b; 
xor x2(s_b[0],b[0], addsub); 
xor x3(s_b[1],b[1], addsub); 
xor x4(s_b[2],b[2], addsub); 
xor x5(s_b[3],b[3], addsub); 
fa fa0 (a[0], s_b[0], addsub, sum[0], s_c[0]); 
fa fa1 (a[1], s_b[1],s_c[0],sum[1],s_c[1]); 
fa fa2 (a[2], s_b[2],s_c[1],sum[2],s_c[2]); 
fa fa3 (a[3], s_b[3],s_c[2],sum[3],cout); 
endmodule 
//Test Bench 
module rippleaddsub_tb; 
reg [3:0]a,b; 
reg addsub; 
wire [3:0]sum; 
wire cout; 
initial begin 
repeat(100) 
begin 
a= $random(); 
b= $random(); 
addsub = $random(); 
#10; 
end 
end 
rippleaddsub r1(a,b,addsub, sum,cout); 
endmodule 
