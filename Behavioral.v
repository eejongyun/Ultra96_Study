/*
Behavioral(행위) Statement (서술)
- inital, always 로 시작
- initial로 시작되는 behavioral statement는 1번만 수행됨 
- always로 시작되는 behavioral statement는 반복 수행됨 
- 모든 behavioral statement는 각각 병렬로 수행됨 
- behavioral statement 내부의 begin … end사이에서는 순차적으로 수행됨

 * 인간적 사고에 가장 근접한 표현



C언어와 비슷하다
begin end = {} 와 같고 
한줄이면 생략가능

reg out;
always @(sel or a or b)
 out = sel ? a:b;


//IEEE1364-2005 Standard for Verilog부터 Event관련 아래 용법이 허용범
● "or" 대신에 콤마(",")로 사용이 가능
● 모든 Event를 명시하지 못하는 실수가 많아 "@*"또는 "@(*)" 사용이 가능

reg out;
always @(sel, a, b)
 out = sel ? a:b;
*/


■ 1. IF
※ 모든 branch에 대해 정의해야됨
always @ (a or b or c or d)
begin
  if(a)
    begin
      e<=c;
      f<=d;
    end;
   else if(b)
      begin
        g<=c;
        h<=d;
      end
  else
    i<=c;    //한문장이라 begin end가 필요업음 굳이..써도됨.
end


■ 2.CASE
/*
각 비트가 0 1 X Z를 포함한 정확히 같은 경우에만 일치로 판단
모든경우들에 대해여 일치되는 항이 없을경우 default 문장이 실행
default 항이 없으면 변수는 이전에 할당받은 값을 유지
하나의 case문에 여러개의 default를 사용하지 않는것을 허용되지 않음
*/
case(조건)
  경우1 : 문장1;
  경우2 : 문장2;
  경우3 : 문장3;
 ...
 default : 문장default;
endcase;

// 경우1..2.3..나열된 순서로 비교함.
// 만족하는 경우가 X ->default
// Default없을시 기존값 유지
// C언어 Switch문은 경우1이 맞고 경우2가 맞다면 1.2 둘다 실행된다. 
// 그걸 방지 하기위해서 switch문에서는 Break문을 써서 나감

switch (/* 변수 */) {
  case /* 값1 */:
    // 명령들;
    break;
  case /* 값2 */:
    // 명령들;
    break;
    //.. (생략) ..
}
   
////////////////////////
//■ CASE 일반적인 경우
///////////////////////
reg a;
case (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase
//a가 0,1,x,z 해당하는걸로 출력
   
////////////////////////
//■ CASE 예제1
///////////////////////
reg [1:0] address;
case (address)
  2'b00 : statement1;
  2'b01, 2'b10 : statement2;
  default : statement3;
endcase
//address : 00 statement1
//address : 01이나 10이면 statement2
//address : 그외 statement3
   
////////////////////////
//■ CASE 예제2
///////////////////////
reg a;
case (1'b1)
  a : statement1;
endcase
a가 1'b1일때만 "statement1" 가 실행됨.

////////////////////////
//■ CASEX 예제
///////////////////////
reg a;
casex (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase

//a가 0,1이면 해당하는거
//x,z면 don't care로 첫번째 조건실행(" 1'b0 : statement1;") 
   
////////////////////////
//■ CASEZ 예제
///////////////////////
reg a;
casez (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase
//a가 0,1,x 이면 해당하는거
//z면 don't care로 첫번째 조건실행(" 1'b0 : statement1;")
   
//★★★★★★★★★★★★
//■ Loop Loop Loop Loop
//★★★★★★★★★★★★
   
////////////////////////
//■ forever 문
///////////////////////
Forever executes one or more statements in an indefinite loop.

initial
begin : Clock
  Clk = 0;
  forever 
    #50 Clk = !Clk;
end
// 50ns마다 Clk이 반전 
//(timescale 왼쪽 값에 해당 `timescale 1ns/ns 일때)
   
////////////////////////
//■ repeat 문
///////////////////////
initial begin
  repeat (10) a = a + ~b;
end

   //주어진 고정된 값(10번) 만큼 실행됨
   //a=1, b=0일경우
   //[1] : x = 1 + ~(0)
   //      2 = 1 + 1
   //[2]     = 2 + 1
   //[3]     = 3 + 1
   //[4]     = 4 + 1
   //[5]     = 5 + 1
   //[6]     = 6 + 1
   //[7]     = 7 + 1
   //[8]     = 8 + 1
   //[9]     = 9 + 1
   //[10] 11 =10 + 1
   // a = 11
   

////////////////////////
//■ while 문
///////////////////////
module test;
parameter MSB = 8;
reg [MSB-1:0] Vector;
integer t;
initial

begin
  t = 0;
  while (t < MSB)
    begin
      //Initializes vector elelments
      Vector[t] = 1'b0;
      t = t + 1;
    end
end
endmodule
// t = 0, Vector[0] = 0
// t = 1, Vector[1] = 0
// t = 2, Vector[2] = 0
// t = 3, Vector[3] = 0
// t = 4, Vector[4] = 0
// t = 5, Vector[5] = 0
// t = 6, Vector[6] = 0
// t = 7, Vector[7] = 0
// t = 8, while(8<8) = false로 Break
   
//while 문이 true시 while문 실행되고, False시 While문을 나감
   
////////////////////////
//■ for문
///////////////////////
initial begin
  for (index=0; index < 10; index = index + 2)
  mem[index] = index;
end
   //index = 0 일때 mem[0] =  0
   //index = 2 일때 mem[0] =  2
   //index = 4 일때 mem[0] =  4
   //index = 6 일때 mem[0] =  6
   //index = 8 일때 mem[0] =  8
