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
    mov r1, #10

    strd r0, r1, [sp], #8

    ldr r0, [sp, #-4]
    ldr r1, [sp, #-8]

    add r3, r0, r1

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
