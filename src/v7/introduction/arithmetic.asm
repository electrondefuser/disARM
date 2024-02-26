.global main
.func main

.section .text

main:
    mov r0, #20
    mov r1, #10

    add r3, r0, r1
    sub r4, r0, r1
    mul r5, r0, r1

    ldr r0, =addmsg
    mov r1, r3
    bl printf

    ldr r0, =submsg
    mov r1, r4
    bl printf

    ldr r0, =mulmsg
    mov r1, r5
    bl printf

exit:
    mov r7, #0x1
    mov r0, #65
    swi 0


.section .data
addmsg: .asciz "ADD, R0 + R1 = %i\n"
submsg: .asciz "SUB, R0 - R1 = %i\n"
mulmsg: .asciz "MUL, R0 * R1 = %i\n"
