.global main
.func main

.section .text

main:
    bl func
    bl exit

func:
    push {r4-r11, lr}
    mov fp, sp

    sub sp, sp, #0x10

    mov r0, #40
    mov r1, #20

    strd r0, r1, [sp, #8]!
    
    ldr r0, [fp, #-0x4]
    ldr r1, [fp, #-0x8]

    sub r3, r1, r0

    ldr r0, =msg
    mov r1, r3
    bl printf

    mov sp, fp
    pop {r4-r11, pc}

exit:
    push {fp, lr}

    mov r7, #0x1
    mov r0, #65
    swi 0

    pop {fp, pc}

.section .data
msg: .asciz "Value: %i\n"
