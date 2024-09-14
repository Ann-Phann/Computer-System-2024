// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// @R0 //initialise with R0 = 0 (result = 0)
// M=0

// @R2 //get the value of R2
// D=M

// @END 
// D;JEQ

// (LOOP)
// @R1
// D=M

// @R0
// M=M+D

// @R2
// M=M-1
// @R2
// D=M

// @END
// D;JEQ

// @LOOP
// 0;JMP

// (END)
// @END
// 0;JMP





// @R0
// M=0
// @i
// M=0

// (LOOP)
// @i
// D=M

// @R1
// D=D-M
// @END
// D;JGE

// @R2
// D=M

// @R0
// M=D+M

// @i
// M=M+1
// @LOOP
// 0;JMP

// (END)
// @END
// 0;JMP





// // Multiplies R1 and R2 and stores the result in R0.
// // (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// // Initialize result in R0 to 0
// @R0
// M=0

// // Initialize sign to 0 (positive)
// @sign
// M=0

// // Check if R1 is negative
// @R1
// D=M
// @CHECK_R2
// D;JGE // If R1 >= 0, skip to CHECK_R2
// @sign
// M=1 // Mark sign as negative
// @R1
// M=-M // Take absolute value of R1

// // Check if R2 is negative
// (CHECK_R2)
// @R2
// D=M
// @ENTRY
// D;JGE // If R2 >= 0, skip to ENTRY
// @sign
// M=M+1 // Flip the sign (if sign = 1, result is negative)
// @R2
// M=-M // Take absolute value of R2

// // Main loop
// (ENTRY)
// @R2
// D=M
// @END
// D;JEQ // If R2 == 0, we're done

// // Loop to add R1 to R0, R2 times
// (LOOP)
// @R1
// D=M
// @R0
// M=M+D // R0 = R0 + R1
// @R2
// MD=M-1 // Decrease R2 by 1
// @LOOP
// D;JGT // Repeat while R2 > 0

// // Check if the result should be negative
// (CHECK_SIGN)
// @sign
// D=M
// @END
// D;JEQ // If sign == 0, skip negation (result is positive)
// @R0
// M=-M // Negate the result

// // End of the program
// (END)
// @END
// 0;JMP





// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Initialize sign to 0
    @sign
    M=0

// Check the sign of R1
(CHECK_R1)
    @R1
    D=M
    @ABS_R1
    D;JLT

// Check the sign of R2
(CHECK_R2)
    @R2
    D=M
    @ABS_R2
    D;JLT

// Entry point
(ENTRY)
    @R1
    D=M
    @R2
    D=D-M
    @SWAP_R1R2
    D;JLT

// Loop
(LOOP)
    @R2
    MD=M-1
    @CHECK_SIGN
    D;JLT
    @R1
    D=M
    @R0
    M=M+D
    @LOOP
    0;JMP

// Check sign for negation
(CHECK_SIGN)
    @sign
    D=M
    @END
    D;JEQ
    @R0
    M=-M
    @END
    0;JMP

// End of program
(END)
    @END
    0;JMP

// Absolute value of R2
(ABS_R2)
    @sign
    M=!M
    @R2
    M=-M
    @ENTRY
    0;JMP

// Absolute value of R1
(ABS_R1)
    @sign
    M=!M
    @R1
    M=-M
    @CHECK_R2
    0;JMP

// Swap R1 and R2
(SWAP_R1R2)
    @R1
    D=M
    @temp
    M=D
    @R2
    D=M
    @R1
    M=D
    @temp
    D=M
    @R2
    M=D
    @LOOP
    0;JMP

// Temporary storage
(temp)
    0