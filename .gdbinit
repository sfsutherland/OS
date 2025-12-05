set architecture riscv:rv64
set disassemble-next-line on
set print pretty on
set print asm-demangle on
set pagination off
target remote localhost:1234
break _start
continue