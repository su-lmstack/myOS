#!/bin/bash
set e
base_path=/home/lmstack/study/operating_system/project/myOS
sudo nasm ${base_path}/bootloader/boot.asm -o ${base_path}/bootloader/boot.bin 
if [[ $? -ne 0 ]]; then
    echo "command: nasm"
    exit 1
fi
g++ ${base_path}/src/*.cpp -o ${base_path}/src/a.out
if [[ $? -ne 0 ]]; then
    echo "command: g++"
    exit 1
fi
qemu-img create -f raw ${base_path}/image/img.raw 1G
if [[ $? -ne 0 ]]; then
    echo "command: qemu-img"
    exit 1
fi
(cat ${base_path}/bootloader/boot.bin;
 cat ${base_path}/src/a.out;
 ) > ${base_path}/image/img.raw
if [[ $? -ne 0 ]]; then
    echo "command: none"
    exit 1
fi
qemu-system-x86_64 ${base_path}/image/img.raw
if [[ $? -ne 0 ]]; then
    echo "command: qemu-system-x86_64"
    exit 1
fi
