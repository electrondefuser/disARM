.global main
.func main

.section .text

main:
    ldr r4, =byt
    ldr r4, [r4]

    ldr r1, =src
    mov r9, #0

func:
    ldrb r3, [r1, r9]
    cmp r4, #0
    beq exit

    ldr r2, =dst
    strb r3, [r2, r9]

    sub r4, r4, #1
    add r9, r9, #1

    b func

exit:
    ldr r0, =out
    ldr r1, =dst
    ldr r2, =byt
    ldr r2, [r2]

    bl printf

    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
byt: .int 13
dst: .string ""
src: .string "copymebuddyy!"
out: .string "Copied: %s\nTotal number of bytes copied: %i\n"