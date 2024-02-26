.global main
.func main

.section .text

main:
    ldr r4, =num
    ldr r4, [r4]

    mov r5, #1

loop:
    cmp r4, #1
    beq exit
  
    mul r5, r4, r5
    sub r4, r4, #1

    b loop

exit:
    ldr r3, =num
    ldr r3, [r3]

    ldr r0, =msg
    mov r1, r3
    mov r2, r5
    bl printf

    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
msg: .asciz "Factorial of %i is: %i\n"
num: .int 10
