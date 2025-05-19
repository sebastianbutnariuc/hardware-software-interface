CFLAGS = -fno-PIC -m32 -g --entry=my_main
LDFLAGS = -no-pie -m32
AS = nasm
ASFLAGS = -f elf32

.DEFAULT_GOAL: all

.PHONY: all clean

all: hello

hello: hello.o start.o
	ld -static -m elf_i386 -L/usr/lib/gcc/x86_64-linux-gnu/13/32/ -L/usr/lib/gcc/x86_64-linux-gnu/7/x32/ -o $@ $^ /usr/lib32/crti.o --start-group -lc -lgcc_s -lgcc_eh --end-group /usr/lib32/crtn.o

hello.o: hello.c

start.o: start.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	-rm -f hello *.o
	-rm -f *~
