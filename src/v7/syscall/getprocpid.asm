.global main
.func main

.section .text

main:
  mov r7, #0x14
  swi 0

  mov r2, r0
  
  ldr r0, =procmsg
  mov r1, r2
  bl printf

exit:
  mov r7, #0x1
  mov r0, #65
  swi 0

.section .data
procmsg: .asciz "Process ID: %i\n"
