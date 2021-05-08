`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EIME
// Engineer: Elihu Izanami Montoya Estrada 
//	Correo:	 izanami49@gmail.com
// 
// Create Date:    19:06:54 05/07/2021 
// Design Name: 
// Module Name:    lcd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lcd(CLK,SF_E,LCD_E,LCD_RS,LCD_RW,SF_D,SF_C,SF_B,SF_A);
input CLK;				//C9
output reg SF_E;		//D16
output reg LCD_E;		//M18
output reg LCD_RS;	//L18
output reg LCD_RW;	//L17
output reg SF_D;		//M15
output reg SF_C;		//P17
output reg SF_B;		//R16
output reg SF_A;		//R15

reg [26:0] count=0;
reg [5:0] codigo;
reg valorparae;
always @(posedge CLK) begin
count <= count + 1;
case (count [26:21])
0: codigo <= 6'h03;
1: codigo <= 6'h03;
2: codigo <= 6'h03;
3: codigo <= 6'h02;
4: codigo <= 6'h02;
5: codigo <= 6'h08;
6: codigo <= 6'h00;
7: codigo <= 6'h06;
8: codigo <= 6'h00;
9: codigo <= 6'h0C;
10: codigo <= 6'h00;
11: codigo <= 6'h01;
12: codigo <= 6'b100100; //E
13: codigo <= 6'b100101;
14: codigo <= 6'b100110; //1
15: codigo <= 6'b100100;
16: codigo <= 6'b100010; // (espacio)
17: codigo <= 6'b100000;
18: codigo <= 6'b100110; // m
19: codigo <= 6'b100101;
20: codigo <= 6'b100111; // u
21: codigo <= 6'b100101;
22: codigo <= 6'b100110; // n
23: codigo <= 6'b100101;
24: codigo <= 6'b100100; // d
25: codigo <= 6'b100101;
26: codigo <= 6'b100110; // o
27: codigo <= 6'b101111;
28: codigo <= 6'b100010; // (espacio)
29: codigo <= 6'b100000;
30: codigo <= 6'b100110; //d
31: codigo <= 6'b100100;
32: codigo <= 6'b100110; //e
33: codigo <= 6'b100101;
34: codigo <= 6'b001100; //para correrlo
35: codigo <= 6'b000000;
36: codigo <= 6'b100110; //l
37: codigo <= 6'b101100;
38: codigo <= 6'b100110; //a
39: codigo <= 6'b100001;
40: codigo <= 6'b100111; //s
41: codigo <= 6'b100011;
42: codigo <= 6'b100010; //(espacio)
43: codigo <= 6'b100000;
44: codigo <= 6'b100100; //F
45: codigo <= 6'b100110;
46: codigo <= 6'b100101; //P
47: codigo <= 6'b100000;
48: codigo <= 6'b100100; //G
49: codigo <= 6'b100111;
50: codigo <= 6'b100100; //A
51: codigo <= 6'b100001;
52: codigo <= 6'b100100; //(espacio)
53: codigo <= 6'b100000;
54: codigo <= 6'b100011; //;
55: codigo <= 6'b101010;
56: codigo <= 6'b100010; //)
57: codigo <= 6'b101001;
default: codigo <= 6'h10;
endcase
valorparae <= count[20];
SF_E <=1;
{LCD_E, LCD_RS, LCD_RW, SF_D, SF_C, SF_B, SF_A} <= {valorparae, codigo};
end
endmodule
