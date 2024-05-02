// kernel.c

void putchar(char c) {
    __asm__ __volatile__ (
        "int $0x10" : : "a"(0x0e00 | c), "b"(0x0007)
    );
}

void puts(const char* str) {
    while (*str) {
        putchar(*str++);
    }
}

void kmain() {
    puts("Hello, World!\n");
    while(1) {}
}