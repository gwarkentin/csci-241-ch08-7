; Program: Recursive_Greatest_Common_Divisor (Chapter 8, Pr 7)
; Description: Recursively calculates GCD with Euclid's algorithm
; Student:     Gabriel Warkentin
; Date:        04/09/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

INCLUDE Irvine32.inc

.data
array DWORD 5,20, 10,24, 24,18, 11,7, 438,226, 26,13
count = lengthof array / 2
msg1 BYTE "GCD of ",0
msg2 BYTE " and ",0
msg3 BYTE " is ",0

.code
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

main12 PROC
	mov esi, OFFSET array
	mov ecx, count
L1:
	INVOKE CalcGCD, [esi], [esi+4]
	INVOKE ShowResult, [esi], [esi+4], eax
	add esi, 8
	dec ecx
	jnz L1

	call WaitMsg
	call CrLf
	exit
main12 ENDP

;---------------------------------------------------
CalcGcd PROC, int1:DWORD, int2:DWORD
; Calculate the greatest common divisor, of
;     two nonnegative integers in recursion.
; Receives: int1, int2
; Returns:  EAX = Greatest common divisor
;---------------------------------------------------
	mov eax, int1
	mov ebx, int2
	test ebx, ebx
	jz L0
	mov edx, 0
	div ebx
	INVOKE CalcGCD, ebx, edx
L0:
	ret
CalcGcd ENDP

;---------------------------------------------------
ShowResult PROC, int1:DWORD, int2:DWORD, gcd:DWORD
; Show calculated GCD result as
;      "GCD of 5 and 20 is 5"
; Receives: int1, int2, gcd
;---------------------------------------------------
	mov edx, OFFSET msg1
	call WriteString
	mov eax, int1
	call WriteDec
	mov edx, OFFSET msg2
	call WriteString
	mov eax, int2
	call WriteDec
	mov edx, OFFSET msg3
	call WriteString
	mov eax, gcd
	call WriteDec
	call CrLf
	ret
ShowResult ENDP

END; main12



COMMENT !
;------------------------------------------------------------
CalcGcd1 PROC USES ebx
; Finds greatest common denominator for two unsigned ints
; Converts to unsigned
; Receives: eax, ebx = two unsigned 32 bit ints
; Returns: eax = GCD
;------------------------------------------------------------
L0:
	mov edx, 0
	div ebx
	mov eax, ebx
	mov ebx, edx
	test ebx, ebx
	jnz L0
	ret
CalcGcd1 ENDP
!