#!/bin/bash
set -e

base_path=/home/lmstack/study/operating_system/project/myOS
if [ $1 != "-fs" ];then
	file_path=${base_path}/$1
	sudo nasm -O 0 ${file_path} -o ${file_path%/*}/boot.bin 
	if [[ $? -ne 0 ]]; then
	    echo "command: nasm"
	    exit 1
	fi
	#g++ ${base_path}/src/*.cpp -o ${base_path}/src/a.out
	#if [[ $? -ne 0 ]]; then
	#    echo "command: g++"
	#    exit 1
	#fi
	qemu-img create -f raw ${base_path}/image/img.raw 1G
	if [[ $? -ne 0 ]]; then
	    echo "command: qemu-img"
	    exit 1
	fi
	cat ${base_path}/bootloader/boot.bin > ${base_path}/image/img.raw
	 #cat ${base_path}/src/a.out;
	if [[ $? -ne 0 ]]; then
	    echo "command: none"
	    exit 1
	fi
	qemu-system-x86_64 ${base_path}/image/img.raw
	if [[ $? -ne 0 ]]; then
	    echo "command: qemu-system-x86_64"
	    exit 1
	fi
else
	file_path=${base_path}/$2
        sudo nasm -O 0 ${file_path} -o ${file_path%/*}/loader.bin 
        if [[ $? -ne 0 ]]; then
            echo "command: nasm"
            exit 1
        fi
        #g++ ${base_path}/src/*.cpp -o ${base_path}/src/a.out
        #if [[ $? -ne 0 ]]; then
        #    echo "command: g++"
        #    exit 1
        #fi
        if [[ $? -ne 0 ]]; then
            echo "command: qemu-img"
            exit 1
        fi
	sudo mount ${base_path}/image/img_withfs.image ${base_path}/media  
	sudo cp  ${file_path%/*}/loader.bin ${base_path}/media
	sudo sync
	sudo umount -f ${base_path}/media
        qemu-system-x86_64 -fda ${base_path}/image/img_withfs.image
        if [[ $? -ne 0 ]]; then
            echo "command: qemu-system-x86_64"
            exit 1
        fi

fi
