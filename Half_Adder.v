//Design
module ha(sum,carry,a,b); 
input a,b; 
output sum,carry; 
xor x1(sum,a,b); 
and a1(carry,a,b); 
endmodule 
//Test Bench 
module ha_tb; 
reg a,b; 
wire sum,carry; 
initial 
begin 
a=1'b0;  b=1'b0; 
#10; 
b=1'b1; 
#10; 
a=1'b1;  b=1'b0; 
#10; 
b=1'b1; 
end 
ha h1(sum,carry,a,b); 
endmodule 
