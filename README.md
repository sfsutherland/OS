Just some playing around with RISC-V using the qemu RISCV64 virt machine...

kernel.S uses OpenSBI to print "Hello world" to the UART console.

linker.ld places the binary at 0x80200000

## Debugging:

Compile/assemble with symbols (`-g`) and don't pass `-s` to the linker.
`make debug` will start the QEMU instance and pause, waiting for a gdb connection

In another terminal:
`gdb-multiarch build/kernel` will start the debugging session. Run the following to start debugging:

```
set architecture riscv:rv64
set target remote :1234
```
