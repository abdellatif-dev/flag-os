build:
	nasm -f elf32 src/kernel.asm -o bin/flagasm.o
	gcc -m32 -c src/kernel.c -o bin/kernelc.o --freestanding
	ld -m elf_i386 -T link.ld bin/flagasm.o bin/kernelc.o -o os/flagos.bin
run:
	make clean
	make build
	qemu-system-x86_64 -kernel os/flagos.bin

isofile:
	make clean	
	make 
	cp os/flagos.bin iso/boot/
	grub-mkrescue -o flagos.iso iso/
	cp flagos.iso /home/flagmate/.local/share/libvirt/images/flagos.iso

clean:
	rm bin/* *.iso os/* iso/boot/flagos.bin /home/flagmate/.local/share/libvirt/images/flagos.iso -f
