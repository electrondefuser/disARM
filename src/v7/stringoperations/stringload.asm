.global main
.func main

.section .text

main:
    ldr r0, =string1
    bl printf

func:
    mov r7, #0x4
    mov r1, #1
    ldr r2, =string2
    mov r3, #14

    swi 0
  
exit:
    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
.string1: .string "Hello, String1"
.string2: .string "Hello, String2"


