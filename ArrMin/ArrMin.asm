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






@32767
D=A
@R0
M=D

@R1
D=M-1
@R2
M=M+D

(LOOP)
    @R1
    D=M
    @R2
    D=D-M
    @END
    D;JGT
    @R1
    A=M
    D=M
    @NEG
    D;JLT
    @R0
    D=M
    @NEG_POS
    D;JLT
    @R1
    A=M
    D=M
    @R0
    D=D-M
    @PASS
    D;JGE

(REASSIGN_R0)
    @R1
    A=M
    D=M
    @R0
    M=D

(PASS)
    @R1
    M=M+1
    @LOOP
    0;JMP

(POS)
    @PASS
    D;JLT

(NEG)
    @R0
    D=M
    @NEG_NEG
    D;JLT
    @R1
    A=M
    D=M
    @R0
    D=D+M
    @REASSIGN_R0_NEG
    D;JLT
    @REASSIGN_R0
    0;JMP

(NEG_NEG)
    @R1
    A=M
    D=M
    @R0
    D=D-M
    @REASSIGN_R0_NEG
    D;JLT
    @PASS
    0;JMP

(NEG_POS)
    @PASS
    0;JMP

(REASSIGN_R0_NEG)
    @R1
    A=M
    D=M
    @R0
    M=D
    @PASS
    0;JMP

(END)
    @END
    0;JMP