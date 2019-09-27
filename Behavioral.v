/*
Behavioral(동작적) Statement (서술)
- inital, always 로 시작
- initial로 시작되는 behavioral statement는 1번만 수행됨 
- always로 시작되는 behavioral statement는 반복 수행됨 
- 모든 behavioral statement는 각각 병렬로 수행됨 
- behavioral statement 내부의 begin … end사이에서는 순차적으로 수행됨

 * 인간적 사고에 가장 근접한 표현



C언어와 비슷하다

begin end = {}

와 같이 한줄이면 생략가능



*IF
**if
**ifnone

 - &&(and) ||(or) 와 같은 논리 연산자를 사용한다.



*CASE

*CASEX

*CASEZ



*LOOP

 ** forever statement 
 : Forever executes one or more statements in an indefinite loop.

initial
begin : Clock
  Clk = 0;
  forever 
    #50 Clk = !Clk;
end


 ** repeat (expression) statement;

(횟수로 반복)

 ** while (expression) statement;

 ** for(assigshment; expression; aggignment) statement;


*/

exmple 1

reg [1:0] address;
case (address)
  2'b00 : statement1;
  2'b01, 2'b10 : statement2;
  default : statement3;
endcase

//If the address value is 2'b00 then statement1 will be executed. Statement2 is executed when address value equals 2'b01 or 2'b10. Otherwise statement3 is executed.

Example 2

reg a;
case (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase

//In Example 2, the statements will be executed depending on the value of the 'a' variable (if a = 1'b0 then statement1 will be executed, etc). If we assign a question mark (?) to the 'a' variable, then statement4 will be executed because the syntax concerning numbers defines the question mark as equal to the z value.

Example 3

reg a;
casez (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase

//If value of variable 'a' is 1'b0 or 1'b1 or 1'bx then statement1, statement2 or statement3 will be executed respectively. If 'a' equals 1'bz or 1'b? then statement1 will be executed because the casez statement treats z and ? as the don't-care values. Statement4 will never be executed because only the first case item, which matches with the case expression, is executed.

Example 4

reg a;
casex (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase

//If variable 'a' is 1'b0 or 1'b1 then statement1 and statement2 will be executed respectively. If 'a' equals 1'bx or 1'bz or 1'b? then statement1 will be executed (x, z and ? are don't care values for the casex statement). Statement3 and statement4 will never be executed.

Example 5

reg a;
case (1'b1)
  a : statement1;
endcase

// The case expression can be a constant expression. In Example 5, statement1 will be executed only if 'a' is equal to 1'b1
