#!/bin/bash

qemu-img create -f raw /home/lmstack/study/operating_system/project/myOS/image/img.raw 1G
(cat /home/lmstack/study/operating_system/project/myOS/bootloader/boot.bin;
 cat /home/lmstack/study/operating_system/project/myOS/src/a.out;
 ) > /home/lmstack/study/operating_system/project/myOS/image/img.raw

