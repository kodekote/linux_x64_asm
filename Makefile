
.PHONY: clean

NAME_EXE = min_asm
PROG_S = asm
PROG_C = cmain

$(NAME_EXE) : \
    $(PROG_S).o \
    $(PROG_C).o
	gcc -o $(NAME_EXE) $(PROG_S).o $(PROG_C).o

$(PROG_S).o : \
    $(PROG_S).s
	as -o $(PROG_S).o $(PROG_S).s

$(PROG_C).o : \
    $(PROG_C).c 
	gcc -c $(PROG_C).c

clean :
	rm -f *.o
	rm -f $(NAME_EXE)

