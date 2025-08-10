//Design 
module fa(ain, bin, cin, sum, carry); 
input ain, bin, cin; 
output sum, carry; 
wire s1,c1,c2; 
ha ha1(ain,bin, s1,c1); 
ha ha2(s1, cin, sum, c2); 
or or1 (carry, c1,c2); 
endmodule 
//Test Bench 
module fa_tb; 
reg ain,bin,cin; 
wire sum, carry; 
integer i = 0; 
initial begin 
repeat(8) 
begin 
ain = i[2]; 
bin = i[1]; 
cin = i[0]; 
i=i+1; 
#10; 
end 
end 
fa fa1(ain, bin, cin, sum, carry); 
endmodule
