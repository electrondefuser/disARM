.global main
.func main

.section .text

main:
    ldr r0, =msg
    ldr r1, =string1
    bl printf

    mov r3, #0

loop:
    cmp r3, #9
    beq exit
  
    bl func
  
    add r3, r3, #1
    b loop

func:
    push {r4-r11, lr}
    mov fp, sp
    sub sp, sp, #0x10

    ldr r4, =string1
    ldr r5, [r4, r3]

    mov r6, r3
    str r6, [fp, #-0x4]

    ldr r0, =out
    ldr r1, [fp, #-0x4]
    mov r2, r5
    bl printf

    ldr r3, [fp, #-0x4]

    mov sp, fp
    pop {r4-r11, pc}

exit:
    mov r7, #0x1
    mov r0, #65
    swi 0


.section .data
msg: .asciz "Printing Characters of String: %s\n"
out: .asciz "Char at %i: %c\n"

string1: .string "wEiRdSTrg"
string2: .string "aRmAsSeMbLyISaMaZing"
