
#include <stdio.h>

#include "asm.h"

#define BIT_PF_FLAG 2
#define BIT_IF_FLAG 9

void cmain()
{
    long rflags;

    rflags = reg_rflags();

    if ( test_bit( rflags, BIT_IF_FLAG ) )
    {
        printf( "hardware interrupts enabled\n" );
    }
    if ( test_bit( rflags, BIT_PF_FLAG ) )
    {
        printf( "PF flag set\n" );
    }
}

