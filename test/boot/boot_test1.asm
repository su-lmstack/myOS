;-----------------------
;测试boot直接加载loader程序；
;boot和loader同时位于第一扇区中；
;-----------------------

org 0x7c02

Label_Start:
    mov ax, cs
    mov ax, cs
    mov ax, cs
    mov ax, cs
    mov bp, StartBootMessage


StartBootMessage: db "Start Boot"