.global main
.func main 

.section .text

main:
    mov r0, #20
    mov r1, #2

    lsl r3, r0, r1

    ldr r0, =outlsl
    mov r1, r3
    bl printf

    mov r0, #20
    mov r1, #2

    lsr r3, r0, r1

    ldr r0, =outlsr
    mov r1, r3
    bl printf

exit:
    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
outlsl: .string "Bitwise (Shift LT): R0 << R1: %i\n"
outlsr: .string "Bitwise (Shift RT): R0 >> R1: %i\n"
