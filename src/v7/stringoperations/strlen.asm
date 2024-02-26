.global main
.func main

.section .text

main:
    ldr r1, =ins
    mov r3, #0

loop:
    ldrb r4, [r1, r3]
    cmp r4, #0x0
    beq exit

    add r3, r3, #1
    b loop

exit:
    ldr r0, =out
    mov r1, r3
    bl printf

    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data

ins: .string "WeIRdStRinG!"
out: .string "Length of string: %i\n"
