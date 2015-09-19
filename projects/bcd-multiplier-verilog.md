---
title: BCD Multiplier | Projects | Sami Suteria
layout: default
---

# BCD Multiplier

Completed: July 4th, 2014

##System Requirements

* Input is two 3 digit binary numbers (10 bits each)
* Output is a 6 digit BCD number (4 bits for each digit)



## Verilog Modules

The code was split into three modules. A Binary to BCD converter module, a BCD multiplication module, and a main module for connecting the two others together. 

### Binary to BCD Converter 

This module has an input of a 10 bit binary number and outputs 3 BCD digits that are 4 bits each. The algorithm for converting binary to BCD is the following: 

* If a BCD digit is >= 5, add 3 to it
* Shift Left
* If no more shifts remain in the binary number – done. 

{% highlight verilog %}
module binaryToBCD(
    input [9:0] binary,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones,
	 output reg overflowFlag
    );

integer i;

always@(binary)
begin
hundreds = 4'b0000;
	tens = 4'b0000;
	ones = 4'b0000;
	overflowFlag = 0;

	if(binary > 999)
	begin
		overflowFlag = 1;
	end else begin
		for(i=9; i>=0; i=i-1)
		begin
			//if >=5 add 3
			if(hundreds >= 5)
				hundreds = hundreds + 3;
			if(tens >= 5)
				tens = tens + 3;
			if(ones >= 5)
				ones = ones + 3;
				
			//shift left
			hundreds = hundreds << 1;
			hundreds[0] = tens[3];
			tens = tens << 1;
			tens[0] = ones[3];
			ones = ones << 1;
			ones[0] = binary[i];
		end
	end
end
endmodule
{% endhighlight %}

Example for 156 in binary

| Hundreds 	| Tens 	| Ones 	| Binary 	| Instruction 	|
|----------:|------:|------:|----------:|--------------:|
|			|		|		| 10011100	|	Initial		|
|			|		| 1		|  0011100	|	Shift		|
|			|		| 10	|   011100	|	Shift		|
|			|		| 100	|    11100	|	Shift		|
|			|		| 1001	| 	  1100	|	Shift		|
|			|		| 1100	| 	  1100	|	Add 3		|
|			| 1		| 1001	| 	  100	|	Shift		|
|			| 1		| 1100	| 	  100	|	Add 3		|
|			| 11	| 1001	| 	   00	|	Shift		|
|			| 11	| 1100	| 	   00	|	Add 3		|
|			| 111	| 1000	| 	   0	|	Shift		|
|			| 1010	| 1011	| 	   0	|	Add 3		|
|	1		| 0101	| 0110	| 	    	|	Shift		|
{: class="table table-striped table-bordered"}

### BCD Multiplication

Multiplication is based on array multiplication with an “A*B + C + D” module.

As seen in the code, the algorithm for the module is

* Initially set all output registers to 0
* Add B to output A times (effectively doing A*B)
	* After each addition do BCD correction
* Add C
	* Do BCD correction
* Add D
 	* Do BCD correction


{% highlight verilog %}
module BCDMultiplier(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    output reg [3:0] Result,
    output reg [3:0] Carry
    );

reg [7:0] calc;
reg [4:0] temp;
integer i;

initial begin
	i=0;
	calc = 0;
	temp = 0;
end

always@(A or B or C or D) 
begin
	calc = 8'b00000000;

	//AxB
	for(i=0; i<A; i=i+1)
	begin
		temp=calc[3:0];
		temp=temp+B;
		
		if(temp>9) temp=temp+6;
		
		calc[3:0] = temp[3:0];
		calc[7:4] = calc[7:4] + temp[4];
	end
	
	//+C
	temp=calc[3:0];
	temp=temp+C;
	if(temp>9) temp=temp+6;
	calc[3:0] = temp[3:0];
	calc[7:4] = calc[7:4] + temp[4];
	
	//+D
	temp=calc[3:0];
	temp=temp+D;
	if(temp>9) temp=temp+6;
	calc[3:0] = temp[3:0];
	calc[7:4] = calc[7:4] + temp[4];

	Result = calc[3:0];
	Carry = calc[7:4];
end
endmodule
{% endhighlight %}

### Main Module

After both modules were made, the they were connected together in the main module.

{% highlight verilog %}
module Main(
    input [9:0] InputA,
    input [9:0] InputB,
    output [3:0] Result5,
    output [3:0] Result4,
    output [3:0] Result3,
    output [3:0] Result2,
    output [3:0] Result1,
    output [3:0] Result0
    );

wire [3:0] a2,a1,a0,b2,b1,b0;

binaryToBCD converter1(
.binary		(InputA),
.hundreds	(a2),
.tens		(a1),			
.ones		(a0),
.overflowFlag	()
);
binaryToBCD converter2(
.binary		(InputB),
.hundreds	(b2),
.tens		(b1),			
.ones		(b0),
.overflowFlag	()
);

wire [3:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11;

BCDMultiplier mult00(
.A		(a0),
.B		(b0),
.C		(0),
.D		(0),
.Result		(Result0),
.Carry		(x0)
);
BCDMultiplier mult01(
.A		(a1),
.B		(b0),
.C		(0),
.D		(x0),
.Result		(x3),
.Carry		(x1)
);
BCDMultiplier mult02(
.A		(a2),
.B		(b0),
.C		(0),
.D		(x1),
.Result		(x4),
.Carry		(x2)
);
BCDMultiplier mult10(
.A		(a0),
.B		(b1),
.C		(x3),
.D		(0),
.Result		(Result1),
.Carry		(x5)
);
BCDMultiplier mult11(
.A		(a1),
.B		(b1),
.C		(x4),
.D		(x5),
.Result		(x7),
.Carry		(x6)
);
BCDMultiplier mult12(
.A		(a2),
.B		(b1),
.C		(x2),
.D		(x6),
.Result		(x8),
.Carry		(x9)
);
BCDMultiplier mult20(
.A		(a0),
.B		(b2),
.C		(x7),
.D		(0),
.Result		(Result2),
.Carry		(x10)
);
BCDMultiplier mult21(
.A		(a1),
.B		(b2),
.C		(x8),
.D		(x10),
.Result		(Result3),
.Carry		(x11)
);
BCDMultiplier mult22(
.A		(a2),
.B		(b2),
.C		(x9),
.D		(x11),
.Result		(Result4),
.Carry		(Result5)
);

endmodule
{% endhighlight %}


## Testing

As for the testing bench for this module, the following code was used:

{% highlight verilog %}
module MainTest2;

	// Inputs
	reg [9:0] InputA;
	reg [9:0] InputB;

	// Outputs
	wire [3:0] Result5;
	wire [3:0] Result4;
	wire [3:0] Result3;
	wire [3:0] Result2;
	wire [3:0] Result1;
	wire [3:0] Result0;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.InputA(InputA), 
		.InputB(InputB), 
		.Result5(Result5), 
		.Result4(Result4), 
		.Result3(Result3), 
		.Result2(Result2), 
		.Result1(Result1), 
		.Result0(Result0)
	);

	initial begin
		// Initialize Inputs
		InputA = 0;
		InputB = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		InputA = 015;
		InputB = 012;
		#10;
		$display("------------------------");
		$display("%d x %d", InputA, InputB);
		$display("Results: %d %d %d %d %d %d",Result5,Result4,Result3,Result2,Result1,Result0);		
	end
      
endmodule

{% endhighlight %}








