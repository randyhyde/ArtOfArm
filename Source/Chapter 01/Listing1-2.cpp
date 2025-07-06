// Listing1-2.cpp
//
// A simple C++ program that calls
// an assembly language function
//
// Need to include stdio.h so this
// program can call printf().

#include <stdio.h>

// extern "C" namespace prevents
// "name mangling" by the C++
// compiler.

extern "C"
{
    // Here's the external function,
    // written in assembly language,
    // that this program will call:

    void asmMain( void );
};

int main(void)
{
    printf( "Calling asmMain:\n" );
    asmMain();
    printf( "Returned from asmMain\n" );
}
