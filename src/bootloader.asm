; bootloader.asm
[ORG 0x7C00] ; This is the memory address BIOS loads the bootloader to

; Load the kernel
mov ax, 0x1000 ; 1KB into memory
mov es, ax
mov bx, 0
mov ah, 0x02 ; BIOS read sector function
mov al, 1 ; read one sector
mov ch, 0 ; track number
mov cl, 2 ; sector number
mov dh, 0 ; head number
mov dl, 0 ; drive number
int 0x13 ; call BIOS

; Jump to the kernel
jmp 0x1000:0x0000

; Fill the rest of the bootloader with zeros
times 510-($-$$) db 0
dw 0xAA55 ; This is the boot signature