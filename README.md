# csci-241-ch08-7
Recursive_Greatest_Common_Divisor

Write a recursive implementation of Euclid's algorithm for finding the greatest common divisor (GCD) of two integers (see Chapter 7, Pr 6 for algorithm description). For simplicity, only test this procedure with unsigned integers. So an array can be defined as
array DWORD 5,20, 10,24, 24,18, 11,7, 438,226, 26,13
Call your recursive GCD procedure six times by receiving two integers in pairs and get the result back in EAX. The output will be
GCD of 5 and 20 is 5
GCD of 10 and 24 is 2
GCD of 24 and 18 is 6
GCD of 11 and 7 is 1
GCD of 438 and 226 is 2
GCD of 26 and 13 is 13
Press any key to continue . . .
To do this, you may write the following two procedures and invoke them multiple times:
;---------------------------------------------------
CalcGcd PROTO, int1:DWORD, int2:DWORD
; Calculate the greatest common divisor, of
;     two nonnegative integers in recursion.
; Receives: int1, int2
; Returns:  EAX = Greatest common divisor
;---------------------------------------------------

;---------------------------------------------------
ShowResult PROTO, int1:DWORD, int2:DWORD, gcd:DWORD
; Show calculated GCD result as
;      "GCD of 5 and 20 is 5"
; Receives: int1, int2, gcd
;---------------------------------------------------
Understand that to make CalcGcd reusable, it should only perform one task of generating GCD without others. So in main, construct a loop to do the following in each iteration:
Invoke CalcGcd with a pair of values passed as two arguments
Invoke ShowResult with a pair of values and their GCD passed as three arguments
Update memory location to next value pair
Also, pay attention to
You must always use INVOKE for a PROC with a parameter list. This is the same as a recursive call within the PROC
Since the stack memory is created such as int1 and int2 in each recursive call, you can directly use int1 and int2 in CalcGcd
Do not use PUSH/POP in a recursive PROC. If really want to protect registers, simply use the USES operator
