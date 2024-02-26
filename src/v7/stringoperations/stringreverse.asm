.global main
.func main

.section .text

main:
  mov r4, #0
  mov r5, #0
  ldr r2, =strmain

loop:
  calcstringlen:
    ldrb r0, [r2, r4]
    cmp r0, #0x0
    beq writestringrv

    add r4, r4, #1
    b calcstringlen

  writestringrv:
    sub r4, r4, #1

    writeloop:
      ldrb r0, [r2, r4]
      cmp r0, #0x0
      beq exit

      ldr r1, =strrevr
      strb r0, [r1]

      sub r4, r4, #1
      b writeloop

exit:
  ldr r0, =msg
  ldr r1, =strrevr
  bl printf

  mov r7, #0x1
  mov r1, #65
  swi 0

.section .data
strmain: .asciz "YourStringHere!"
strrevr: .asciz ""
msg:     .asciz "%s\n"
