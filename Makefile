CROSS_COMPILE=riscv64-linux-gnu-
BUILD_DIR=build
BIN_NAME=kernel
LINKER_NAME=linker.ld
LINK_OPTIONS=--no-dynamic-linker -m elf64lriscv -static -nostdlib -s
ASSEMBLER_OPTIONS=-march=rv64i -mabi=lp64

$(BUILD_DIR)/$(BIN_NAME): $(BUILD_DIR)/$(BIN_NAME).o $(LINKER_NAME)
	${CROSS_COMPILE}ld -T $(LINKER_NAME) $(LINK_OPTIONS) -o $@ $<

$(BUILD_DIR)/$(BIN_NAME).o: $(BIN_NAME).S build
	${CROSS_COMPILE}as $(ASSEMBLER_OPTIONS) -o $@ -c $<

build:
	mkdir -p $(BUILD_DIR)

run:
	qemu-system-riscv64 -machine virt -kernel $(BUILD_DIR)/$(BIN_NAME)

clean:
	rm -rf $(BUILD_DIR)