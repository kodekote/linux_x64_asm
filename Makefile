
PROG_1 = main

$(PROG_1) : \
    $(PROG_1).o
	gcc -o $(PROG_1) $(PROG_1).o

$(PROG_1).o : \
    $(PROG_1).s
	as -o $(PROG_1).o $(PROG_1).s

clean :
	rm -f $(PROG_1)
	rm -f $(PROG_1).o

