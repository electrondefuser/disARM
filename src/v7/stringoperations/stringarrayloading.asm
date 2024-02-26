.global main
.func main

.section .text

main:
    mov r6, #0
    mov r7, #0
    mov r8, #0

loop:
  cmp r7, #10
  beq exit

  ldr r3, =arr
  mov r0, #0

  readarraymemory:
    ldrb r4, [r3, r6]
    cmp r4, #0x0 
    beq printdata

    ldr r5, =tmp
    strb r4, [r5, r0]

    add r6, r6, #1
    add r0, r0, #1

    b readarraymemory

  printdata:
    ldr r0, =msg
    ldr r2, =tmp
    mov r1, r8

    bl printf
    
    add r7, r7, #2
    add r6, r6, #1

    add r8, r8, #1
    b loop

exit:
    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
msg: .string "Value at index %i:= %s\n"
arr: .string "AB", "CD", "EF", "GH", "IJ"
tmp: .string ""
