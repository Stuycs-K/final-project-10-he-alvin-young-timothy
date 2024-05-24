default: runme
	@./runme
runme:  main.o
	@gcc -o runme main.o
main.o: main.c
	@gcc -c main.c
hexdump: runme
	@./runme hexdump $(ARGS)
encode: runme
	@./runme encode $(ARGS)
decode: runme
	@./runme decode $(ARGS)
clean:
	rm *.o
	rm runme