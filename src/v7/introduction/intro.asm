.global main
.func main

.section .text

main:
	mov r7, #0x01
	mov r0, #65
	swi 0
