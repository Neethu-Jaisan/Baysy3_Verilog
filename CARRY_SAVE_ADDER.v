//Design 
`timescale 1ns / 1ns 
module fulladder ( input a, b, cin, output sum, carry); 
    assign sum = a ^ b ^ cin; 
    assign carry = (a & b) | (b & cin) | (a & cin); 
endmodule 
 
module carrysaveadder( 
    input [3:0] x, 
    input [3:0] y, 
    input [3:0] z, 
    output [4:0] s, 
    output cout 
); 
 
    wire [3:0] s1, c1; 
    wire [4:0] s2; 
    wire c2; 
 
    // First stage: full adders for each bit 
    fulladder fa0(x[0], y[0], z[0], s1[0], c1[0]); 
    fulladder fa1(x[1], y[1], z[1], s1[1], c1[1]); 
    fulladder fa2(x[2], y[2], z[2], s1[2], c1[2]); 
    fulladder fa3(x[3], y[3], z[3], s1[3], c1[3]); 
 
    // Second stage: add s1 + (c1 shifted left by 1) 
    ripple_carry_adder_5bit rca ( 
        .a({1'b0, s1}),       // extend s1 to 5 bits, MSB 0 
6 
        .b({c1, 1'b0}),       // shift c1 left by 1 bit 
        .cin(1'b0), 
        .sum(s2), 
        .cout(c2) 
    ); 
 
    assign s = s2; 
    assign cout = c2; 
 
endmodule 
 
// 5-bit ripple carry adder used in second stage 
module ripple_carry_adder_5bit( 
    input [4:0] a, 
    input [4:0] b, 
    input cin, 
    output [4:0] sum, 
    output cout 
); 
    wire [4:0] c; 
    fulladder fa0(a[0], b[0], cin, sum[0], c[0]); 
    fulladder fa1(a[1], b[1], c[0], sum[1], c[1]); 
    fulladder fa2(a[2], b[2], c[1], sum[2], c[2]); 
    fulladder fa3(a[3], b[3], c[2], sum[3], c[3]); 
    fulladder fa4(a[4], b[4], c[3], sum[4], c[4]); 
 
    assign cout = c[4]; 
endmodule 
 
 
 
//Test Bench 
`timescale 1ns / 1ns 
module carrysaveadder_tb; 
    reg [3:0] x, y, z; 
    wire [4:0] s; 
    wire cout; 
    integer i; 
    // Instantiate the CSA 
    carrysaveadder uut ( 
        .x(x), 
        .y(y), 
        .z(z), 
        .s(s), 
        .cout(cout) 
    ); 
 
    initial begin 
 
        for (i = 0; i < 10; i = i + 1) begin 
            x = $urandom_range(0, 15); 
            y = $urandom_range(0, 15); 
            z = $urandom_range(0, 15); 
            #10; 
        end 
    end 
 
endmodule
