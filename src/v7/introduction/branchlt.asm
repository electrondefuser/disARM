.global main
.func main

.section .text

main:
	mov r0, #10
	mov r1, #10
	add r3, r0, r1

	cmp r3, #15
	blt fun1

fun1:
	ldr r0, =outFun1
	bl printf

exit:
	mov r7, #0x1
	mov r0, #65
	swi 0

.section .data
outFun1: .asciz "Function #1 was called"
