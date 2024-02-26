.global main
.func main

.section .text

main:
    ldr r0, =msg_arm
    bl printf
    
    ldr r0, =fun1
    add r0, r0, #1
    bx r0

.thumb 
fun1:
    mov r2, #2
    mov r3, #7

    mul r3, r2, r3

    ldr r0, =msg_thumb01
    mov r1, r3
    bl printf

    ldr r0, =fun2
    add r0, r0, #1
    bx r0

.thumb
fun2:
    mov r0, #7
    mov r1, #9
    add r5, r0, r1

    ldr r0, =msg_thumb02
    mov r1, r5
    bl printf

    ldr r0, =exit
    bx r0

.arm
exit:
    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
msg_arm: .asciz "Hello, ARM Mode!\n"

msg_thumb01: .asciz "Thumb OP1 (MUL = 2x7): %i\n"
msg_thumb02: .asciz "Thumb OP2 (ADD = 7+9): %i\n"
