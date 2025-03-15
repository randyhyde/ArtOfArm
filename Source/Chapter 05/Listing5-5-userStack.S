// Listing 5-5
//
// Demonstrating a software stack

#include "aoaa.inc"

#define usp X28     // Program-defined stack pointer

stackSpace  =           64
saveLRUSP   =           48

            .section    .rodata, ""
ttlStr:     .asciz      "Listing 5-5"
space:      .asciz      " "
asterisk:   .asciz      "*, %d\n"

            .data
loopIndex:  .dword       .-.     // Used to print loop index value.

// Here's the software-based stack this program will use
// to store return addresses and the like.

            .align      4
smallStk:   .space       256, .-.
endSmallStk:

            .code
            .extern     printf

// Return program title to C++ program:

            proc    getTitle, public
            lea     x0, ttlStr
            ret
            endp    getTitle



// print40Spaces-
//
//  Prints out a sequence of 40 spaces
// to the console display.

            proc    print40Spaces
            stp     lr, x19, [usp, #-16]! // Preserve LR and X19

            mov     w19, #40
printLoop:  lea     x0, space
            bl      printf
            subs    w19, w19, #1
            bne     printLoop //Until w19==0
            
            ldp     lr, x19, [usp], #16 // Restore LR and X19
            ret
            endp    print40Spaces


// Here is the "asmMain" function.

            proc    asmMain, public
            sub     sp, sp, #stackSpace         // Alloc stack space
            stp     lr, usp, [sp, #saveLRUSP]   // Save on HW stack

            lea     usp, endSmallStk    // Initialize USP
            str     x19, [usp, #-16]!   // Save X19 on software stack
            

            mov     x19, #20
astLp:      bl      print40Spaces
            lea     x0, loopIndex
            str     x19, [x0]
            lea     x0, asterisk
            vparm2  loopIndex
            bl      printf
            subs    x19, x19, #1
            bne     astLp

            ldr     x19, [usp], #16     // Restore  from soft stack
            ldp     lr, usp, [sp, #saveLRUSP]
            add     sp, sp, #stackSpace
            ret     //Returns to caller
            endp    asmMain

