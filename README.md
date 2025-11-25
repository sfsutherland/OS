Just some playing around with RISC-V using the qemu RISCV64 virt machine...

kernel.S uses OpenSBI to print "Hello world" to the UART console.

linker.ld places the binary at 0x80200000

Credit to Uros Popovic for this initial code: https://github.com/popovicu/risc-v-bare-metal-fake-bios