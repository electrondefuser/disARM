.global main
.func main

.section .text

main:
  ldr r0, =filename
  ldr r1, =filemode
  bl fopen

  mov r4, r0

  ldr r0, =msg
  mov r1, r4
  bl printf

  mov r0, r4
  bl fclose

  ldr r0, =cls
  bl printf

exit:
  mov r7, #0x1
  mov r0, #65
  swi 0

.section .data
filename: .string "/home/electrondefuser/file.txt"
filemode: .string "a"

msg: .asciz "fopen() was successful!\nFILE* handle at:= %p\n"
cls: .asciz "closed handle\n"
