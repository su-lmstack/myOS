;-----------------------
;测试boot直接加载loader程序；
;boot和loader同时位于第一扇区中；
;打印完 start boot 后 打印 start loader;
;-----------------------
org 0x7c00
BaseOfStack equ 0x7c00
Boot_Start:
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, BaseOfStack

    mov ax, 0600h
    mov bx, 0700h
    mov cx, 0
    mov dx, 0184fh
    int 10h

    mov ax, 0200h
    mov bx, 0000h
    mov dx, 0000h
    int 10h

    mov ax, 1301h
    mov bx, 000fh
    mov dx, 0000h
    mov cx, 10
    push ax,
    mov ax, ds
    mov es, ax
    pop ax
    mov bp, StartBootMessage
    int 10h

    xor ah, ah
    xor dl, dl
    int 13h
    jmp Loader_Start


Loader_Start:
    mov ax, 1301h
    mov bx, 000fh
    mov dx, 001bh
    mov cx, 13
    push ax,
    mov ax, ds
    mov es, ax
    pop ax
    mov bp, StartLoaderMessage
    int 10h

    xor ah, ah
    xor dl, dl
    int 13h
    jmp $

StartBootMessage: db "Start Boot"
StartLoaderMessage: db "Start Loader"
times 510 - ($ - $$) db 0
dw 0xaa55


