/*
    equivalent to a C function prototype (not needed if compiled properly;
    linker will automatically resolve function names, a bijective operation,
    based on the link libraries being used)

.extern printf
*/

/*
    actually necessary for linker:
*/
.globl main
.globl reg_rflags
.globl test_bit


/*
    global variables
*/
.data
str1:
    .string "hello, world\n"
str_arg:
    .string "[%s]\n"


/*
    read-only section designated for program code
*/
.text
main:
    pushq %rbp
    movq %rsp,%rbp
    sub $32,%rsp

    movq %rdi, -24(%rbp)
    movq %rsi, -16(%rbp)

    leaq str1(%rip), %rdi
    call printf

    movq $0, -8(%rbp)
    jmp loop1_test
    /*
        a (for) loop that prints the command-line arguments
    */
loop1_body:
    leaq str_arg(%rip), %rdi
    movq -8(%rbp), %rax
    movq -16(%rbp), %rsi
    /*
        indexed addressing moves data located at the calculated address
        to the destination operand (dereferences a pointer);
        the follow is thus equivalent to: *(argv+j)
    */
    movq (%rsi, %rax, 8), %rsi
    call printf
    addq $1, -8(%rbp)
loop1_test:
    movq -8(%rbp), %rax
    cmpq -24(%rbp), %rax
    jl loop1_body

    call cmain

    xorq %rax, %rax
    /*
        LEAVE does 2 things:
        movq %rbp, %rsp
        popq %rbp
    */
    leaveq
    retq

/*
parameter types: (void)
return type: qword
*/
reg_rflags:
    pushfq
    popq %rax
    retq

/*
parameter types: (long qw_val, unsigned int n)
return type: int (a bool with either 0 or 1)

    registers are not stored in little-endian format as "byte" ordering
    only exists in memory (i.e., when each cell is a byte long)--registers
    are 64-bit dedicated circuits in x64 (no cells) that exist
    on the CPU die itself
*/
test_bit:
    movl %esi, %ecx
    shrq %ecx, %rdi
    andq $1, %rdi
    movl %edi, %eax
    retq


