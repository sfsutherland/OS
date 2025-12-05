.global _start
.section .text.kernel

_start: li a0, 12
        lla a1, debug_string
        li a2, 0
        call sbi_debug_console_write

loop:   j loop

sbi_debug_console_write:
        li a7, 0x4442434E
        li a6, 0x00
        ecall
        ret

.section .rodata
debug_string:
        .string "Hello world\n"