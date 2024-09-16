// // Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// // (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// // Put your code here.
// // Inputs:

// //R1 contains the RAM address of the first element in the array
// //R2 contains the length of the array
// //Outputs:

// //Write your final answer to R0

// //initialise the smallest value with the first element of the array
//     @R1
//     A=M //get the address stored in R1
//     D=M //D= value of first element
//     @min
//     M=D //initialise R0 with the smallest value so far

// //set up loop
//     @i
//     M=1

// (LOOP) 
//     @i
//     D=M
//     @R2
//     D=D-M // i > R2 -->stop
//     @STOP
//     D;JGE

//     //load the next element from the array
//     @R1
//     D=M // get the base address of the array
//     @i
//     A=D+M //go to the address of the array element at index i 
//     D=M // D store the value of that element array[i]

//     //check if the element is unitialised
//     @UNITIALISED


//     //compare array[i] with the current minimum value in R0
//     @min
//     D=D-M // array[i] - min
//     @UPDATE_MIN
//     D;JLE

//     //increse loop counter
//     @i
//     M=M+1
//     @LOOP
//     0;JMP

// (UPDATE_MIN)
//     @R1
//     D=M //D = base address
//     @i
//     A=D+M
//     D=M //D = array[i] current element

//     @min
//     M=D // update R0 with the new minimum
//     @i
//     M=M+1
//     @LOOP
//     0;JMP

// (STOP)
//     @min
//     D=M
//     @R0
//     M=D
    
// (END)
//     @END
//     0;JMP





// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Initialize R0 with a large value
@32767
D=A
@R0
M=D

// Initialize loop counter i
@R1
D=M // Load base address
@R1
A=M // Access the first element of the array
D=M // Store the first element value
@R0
M=D // Initialize R0 with the first element (current minimum)

// Set loop counter i
@i
M=1

(LOOP)
    @R2
    D=M // D = length of the array
    @i
    A=M // Get current index
    D=D-A // D = R2 - i (check if i >= R2)
    @END
    D;JGE // If i >= R2, jump to END

    // Load the next element from the array
    @R1
    D=M // Get base address
    @i
    A=D+M // Go to the address of array element at index i
    D=M // D = array[i]

    // Compare array[i] with the current minimum in R0
    @R0
    D=D-M // D = array[i] - min
    @UPDATE_MIN
    D;JLT // If array[i] < min, jump to UPDATE_MIN

    // Increment loop counter i
    @i
    M=M+1
    @LOOP
    0;JMP // Repeat loop

(UPDATE_MIN)
    @R1
    D=M // Get base address
    @i
    A=D+M // Address of array element at index i
    D=M // D = array[i]
    @R0
    M=D // Update R0 with the new minimum value

    // Increment loop counter i
    @i
    M=M+1
    @LOOP
    0;JMP // Repeat loop

(END)
    @R0
    D=M // Load the final minimum value
    @R0
    M=D // Store it in R0
    @END
    0;JMP // Halt execution
