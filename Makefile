all:
	gcc -S test.c -o test.s
	gcc test.c -o test.o
	./test.o
