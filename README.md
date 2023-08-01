# linux_x64_asm
Intel x64 assembly code and build files for Linux / GNU as


Currently, there is one example with a minimal assembly program that showcases two things: the minimal directives, code, and labels needed to produce an executable file and how to interface with C libraries.

Most importantly, it shows how to use x64 assembly to produce code that is impossible in standard C. First, it gets the value of RFLAGS in C. Then, it performs a logical shift-right on a signed value (not possible in C) and it "ignores" endianess (not possible in C).

I will add more examples later.
