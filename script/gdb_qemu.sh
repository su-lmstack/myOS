#!/bin/bash

qemu-system-x86_64 -s -S -serial none -machine accel=tcg -smp 4 -drive format=raw,file=/home/lmstack/study/operating_system/project/myOS/image/img.raw &
pid=$!
gdb \
    -ex "target remote localhost:1234"\
    -ex "set confirm off"\
    -ex "file /home/lmstack/study/operating_system/project/myOS/src/helloworld.o"
kill -9 $!
