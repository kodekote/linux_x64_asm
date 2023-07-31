.extern printf

.globl main


.data
str1:
    .string "hello, world\n"
str_arg:
    .string "[%s]\n"


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

    xorq %rax, %rax
    leave

