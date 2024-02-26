.global main
.func main

.section .text

main:
	mov r7, #0x4
	mov r0, #1
	ldr r1, =msg
	mov r2, #14 
	swi 0

exit:
	mov r7, #0x1
	mov r0, #65
	swi 0

.section .data
msg: .asciz "Hello, World!\n"
