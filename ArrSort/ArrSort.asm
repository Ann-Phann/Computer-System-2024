// // Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// // (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// // Put your code here.

// // Convert R2 to the last element
// @R1 
// D=M-1 
// @R2 
// M=M+D //R2 hold the address of the last element in the array.

// (OUTER_LOOP) // check f the sorting is complete
// (CHECK_END)
// @R1
// D=M
// @R2
// D=D-M //compare: the current index R1 with R2 --> R1>R2 (last element index) -->no out of bound
// @FINISH
// D;JGT
// @R1
// D=M
// @R3 // index for the inner loop
// M=D+1 


// (INNER_LOOP)
// (CHECK_INNER_LOOP)
// @R3
// D=M
// @R2
// D=D-M //if index of inner loop R3 > R2
// @INNER_END
// D;JGT

// // Access value in inner index
// @R3
// A=M
// D=M
// @POSITIVE
// D;JGE
// @NEGATIVE
// 0;JMP

// (SWAP)
// @R1
// A=M
// D=M
// @temp
// M=D
// @R3
// A=M
// D=M
// @R1
// A=M
// M=D
// @temp
// D=M
// @R3
// A=M
// M=D

// (SKIP)
// @R3
// M=M+1
// @INNER_LOOP
// 0;JMP

// (INNER_END)
// @R1
// M=M+1
// @OUTER_LOOP
// 0;JMP

// (FINISH)
// @R0
// M=-1
// (END)
// @END
// 0;JMP


// (REF_UPDATE)
// @R3
// A=M
// D=M
// @R1
// A=M
// D=D-M
// @SKIP
// D;JGE
// @SWAP
// 0;JMP

// (NEGATIVE)
// @R1
// A=M
// D=M
// @REF_UPDATE
// D;JLT
// @SWAP
// 0;JMP

// (POSITIVE)
// @R1
// A=M
// D=M
// @REF_UPDATE
// D;JGE
// @SKIP
// 0;JMP




// ArrSort.asm
// This program sorts an array in ascending order using Selection Sort algorithm.

// Inputs:
// R1 contains the RAM address of the first element in the array
// R2 contains the length of the array

// Outputs:
// Write your True (-1) to R0 when your program finishes.

@R2
D=M         // D = length of the array
@END
D;JEQ       // If length is 0, we don't need to sort, jump to END

@R1
D=M         // D = base address of the array
@start
M=D         // Initialize start address

// Outer loop for each element in the array
(OUTER_LOOP)
    @R2
    D=M         // D = length of the array
    @start
    D=D-M       // D = length - start index
    @LOOP_EXIT
    D;JLE       // If D <= 0, exit loop (no more elements to sort)
    
    // Set minIndex to the current index
    @start
    D=M         // D = start index
    @minIndex
    M=D         // minIndex = start index

    @start
    D=M         // D = start index
    @R2
    D=D+M       // D = start index + length (just to handle boundary)

    // Inner loop to find the minimum element
    (INNER_LOOP)
        @minIndex
        D=M         // D = minIndex
        @R1
        A=M
        @D
        D=D+M       // Address of minIndex element
        
        // Load element at minIndex
        A=D
        D=M         // D = element at minIndex
        
        // Check if the current element is less than the element at minIndex
        @current
        A=M
        D=D-M       // D = current element - minIndex element
        @SWAP
        D;JLT       // If D < 0, current element is smaller, so swap

        // Move to the next element
        @current
        M=M+1       // current index += 1
        @INNER_LOOP
        0;JMP       // Continue inner loop

    (SWAP)
        @minIndex
        A=M         // Address of minIndex
        D=M         // D = element at minIndex
        
        @start
        D=D-M       // Address of start (swapping values)
        @current
        A=M
        D=M         // D = current element
        
        @R1
        A=M         // Base address
        @start
        D=D-M       // Swap the two elements
        @SWAP_DONE
        D;JGE       // If D >= 0, done swapping
        
        // Finish swapping
        (SWAP_DONE)
        @start
        M=M+1       // Increment start index
        @OUTER_LOOP
        0;JMP       // Continue outer loop

(LOOP_EXIT)
    // Done sorting, set R0 to True (-1)
    @R0
    M=-1        // Set R0 to True (-1)

(END)
    @END
    0;JMP       // Infinite loop to end the program
