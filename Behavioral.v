mple 1

reg [1:0] address;
case (address)
  2'b00 : statement1;
  2'b01, 2'b10 : statement2;
  default : statement3;
endcase

If the address value is 2'b00 then statement1 will be executed. Statement2 is executed when address value equals 2'b01 or 2'b10. Otherwise statement3 is executed.

Example 2

reg a;
case (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase

In Example 2, the statements will be executed depending on the value of the 'a' variable (if a = 1'b0 then statement1 will be executed, etc). If we assign a question mark (?) to the 'a' variable, then statement4 will be executed because the syntax concerning numbers defines the question mark as equal to the z value.

Example 3

reg a;
casez (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase

If value of variable 'a' is 1'b0 or 1'b1 or 1'bx then statement1, statement2 or statement3 will be executed respectively. If 'a' equals 1'bz or 1'b? then statement1 will be executed because the casez statement treats z and ? as the don't-care values. Statement4 will never be executed because only the first case item, which matches with the case expression, is executed.

Example 4

reg a;
casex (a)
  1'b0 : statement1;
  1'b1 : statement2;
  1'bx : statement3;
  1'bz : statement4;
endcase

If variable 'a' is 1'b0 or 1'b1 then statement1 and statement2 will be executed respectively. If 'a' equals 1'bx or 1'bz or 1'b? then statement1 will be executed (x, z and ? are don't care values for the casex statement). Statement3 and statement4 will never be executed.

Example 5

reg a;
case (1'b1)
  a : statement1;
endcase
