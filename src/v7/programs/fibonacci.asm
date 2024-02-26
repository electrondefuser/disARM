.global main
.func main

.section .text

main:
    mov r0, #0
    mov r1, #1

    mov r5, #10

loop:
    cmp r5, #0
    beq exit

    bl calc
    sub r5, r5, #1

    b loop

calc:
    push {r4-r11, lr}
    mov fp, sp

    sub sp, sp, #0x10

    str r0, [fp, #-0x4]
    str r1, [fp, #-0x8]

    add r6, r0, r1
    str r6, [fp, #-0x10]

    ldr r0, =out
    mov r1, r6
    bl printf
 
    ldr r0, [fp, #-0x8]
    ldr r1, [fp, #-0x10]

    mov sp, fp
    pop {r4-r11, pc}

exit:
    push {fp, lr}

    mov r7, #0x1
    mov r0, #65
    swi 0

    pop {fp, pc}

.section .data
msg: .asciz "Printing Fib(%i) Iteration:\n"
out: .asciz "%i\n"
inf: .asciz "%i\n"
val: .int 0
