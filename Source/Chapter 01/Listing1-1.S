// Listing 1-1
//
// Comments consist of all text from a
// "//" sequence"  to the end of the line.
// The ".text" directive tells Gas that the
// statements following this directive go in
// the section of memory reserved for machine
// instructions (code).        

       .text
        
// Here is the "main" function.
// (This example assumes that the
// assembly language program is a
// stand-alone program with its own
// main function.)
//
// Under macOS, the main program
// must have the name "_main"
// beginning with an underscore.
// Linux systems generally don't
// require the underscore.
//
//  The ".global _main" statement
// makes the _main procedure's name
// visible outside this source file
// (needed by the linker to produce
// an executable). 

       .global _main, main
        
// The ".align 2" statement tells the
// assembler to align the following code
// on a 4-byte boundary (required by the
// ARM CPU). The "2" operand specifies
// two raised to this power (2), which
// is four.

       .align 2
        
// Here's the actual main program. It
// consists of a single ret (return)
// instruction that simply returns
// control to the operating system.

_main:
main:
       ret