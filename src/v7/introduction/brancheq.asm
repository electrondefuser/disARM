.global main
.func main

.section .text

main:
    mov r0, #1
    
    cmp r0, #1
    beq fun1

    cmp r0, #2
    beq fun2

fun1:
    ldr r0, =msg
    mov r1, #1
    bl printf
    
    b exit

fun2:
    ldr r0, =msg
    mov r1, #2
    bl printf

    b exit

exit:
    mov r7, #0x1
    mov r1, #65
    swi 0


.section .data
msg: .asciz "Branched to #%i\n"
