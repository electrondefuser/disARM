.global main
.func main

.section .text

main:
    mov r4, #70
    mov r5, #15

    bl func
    bl exit

func:
    stmdb sp!, {r4-r11, lr}
    mov fp, sp

    ldr r8, [fp]
    ldr r9, [fp, #4]
    
    ldr r0, =outmessage
    mov r1, r8
    mov r2, r9
    bl printf

    mul r3, r8, r9

    ldr r0, =outval
    mov r1, r3
    bl printf

    mov sp, fp
    ldmia sp!, {r4-r11, pc}

exit:
    push {fp, lr}

    mov r7, #0x1
    mov r0, #65
    swi 0

    pop {fp, pc}

.section .data
outmessage: .asciz "Value at R4=%i, R5=%i\n"
outval: .asciz "R4 x R5= %i\n"
