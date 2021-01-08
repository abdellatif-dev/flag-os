build:
	nasm -f elf32 src/kernel.asm -o bin/flagasm.o
	gcc -m32 -c src/kernel.c -o bin/kernelc.o
	ld -m elf_i386 -T link.ld bin/flagasm.o bin/kernelc.o -o os/flagos.bin
run:
	make clean
	make build
	qemu-system-x86_64 -kernel os/flagos.bin

clean:
	rm bin/*  os/* -f
