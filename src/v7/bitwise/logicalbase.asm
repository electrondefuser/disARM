.global main
.func main

.section .text

main:
    mov r0, #6
    mov r1, #4

    AND r3, r0, r1

    ldr r0, =and
    mov r1, r3
    bl printf

    mov r0, #6
    mov r1, #4

    orr r3, r0, r1

    ldr r0, =orr
    mov r1, r3
    bl printf
    
    mov r0, #6
    mov r1, #4

    eor r3, r0, r1

    ldr r0, =eor
    mov r1, r3
    bl printf

exit:
    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
and: .string "Bitwise (AND): R0 & R1: %i\n"
orr: .string "Bitwise (ORR): R0 | R1: %i\n"
eor: .string "Bitwise (EOR): R0 ^ R1: %i\n"
