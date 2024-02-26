.global main
.func main

.section .text

main:
    bl func
    bl exit

func:
    push {r4-r11, lr}
    mov fp, sp

    sub sp, sp, #0x8

    mov r0, #10
    mov r1, #20

    strd r0, r1, [sp]

    ldr r0, [fp, #-0x8]
    ldr r1, [fp, #-0x4]

    mul r3, r0, r1
    
    ldr r0, =out1
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
out1: .asciz "Value: %i"
