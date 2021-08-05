somamain: somamain.c
	riscv64-linux-gnu-gcc  -c somamain.c
soma: soma.s
	riscv64-linux-gnu-objdump -d somamain.o
a.out: somamain.o
	riscv64-linux-gnu-gcc -static -save-temps somamain.c soma.s
clean:
	rm -f somamain.o
	rm -f soma.o
	rm - f a.out
run: a.out
	/usr/bin/riscv64-linux-gnu/bin/spike -m128 /usr/bin/riscv64-linux-gnu/bin/pk a.out
getcow: 
	wget https://raw.githubusercontent.com/Virviil/cow.rs/master/test/hello_world.cow