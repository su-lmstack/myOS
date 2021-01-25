#!/bin/bash


qemu-system-i386 -s -S -serial none -nographic -machine accel=tcg -smp 4 -drive format=raw,file=/home/lmstack/study/operating_system/project/myOS/image/img.raw &
#qemu-system-x86_64 -s -S -fda /home/lmstack/study/operating_system/project/myOS/image/img.raw -boot a &
pid=$!
gdb \
    -ex "target remote localhost:1234"\
    -ex "set confirm off"\
    -ex 'break *0x7c00' \
    -ex "set architecture i8086"\
    -ex "set disassembly-flavor intel"\
    -ex "layout asm"
    -ex "file /home/lmstack/study/operating_system/project/myOS/src/helloworld.o"
kill -9 $!
