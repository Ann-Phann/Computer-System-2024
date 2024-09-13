// Calculates the absolute value of R1 and stores the result in R0.
// (R0, R1 refer to RAM[0], and RAM[1], respectively.)

// Put your code here.

@R1
D=M

@POSITIVE // If R1 is positive, jump to POSITIVE.
D;JGE

@R1 //else R1 is negative
D = -M

@R0
M=D

@END
0;JMP

(POSITIVE) 
@R0
M=D
@END

(END)
@END
0;JMP


// @R1           // Load the value from R1
// D=M           // D = R1 (the number)

// @POSITIVE     // Check if the number is positive or zero
// D;JGE         // If D >= 0, jump to POSITIVE (D is already absolute)

// @R1           // Else, R1 is negative
// D=-M          // D = -R1 (negate the value)

// @R0           // Store the absolute value in R0
// M=D           // R0 = |R1|

// @END          // Jump to the end of the program
// 0;JMP         // End program

// (POSITIVE)    // If the number was positive or zero
// @R0           // Store the value of R1 in R0
// M=D           // R0 = R1

// (END)         // End of program
// @END
// 0;JMP         // Infinite loop to stop execution



// @R1
// D=M

// @R0
// M=D 

// @POSITIVE
// D;JGE

// @R0
// M=-M

// (END)
// @END
// 0;JMP

// (POSITIVE)