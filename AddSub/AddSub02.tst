// Load the AddSub.asm program
load AddSub.asm,
output-file AddSub02.out,
compare-to AddSub02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

// Set initial values for a, b, c (a + b - c)
// a = 1, b = 1, c = 3 (expecting negative result)
set PC 0,
set RAM[0] 0,  // Set R0 (output)
set RAM[1] 1,  // Set R1 (a = 1)
set RAM[2] 1,  // Set R2 (b = 1)
set RAM[3] 3;  // Set R3 (c = 3)

// Run the program for 100 clock cycles
repeat 100 {
  ticktock;
}

// Restore RAM[1], RAM[2], RAM[3] to initial values to check if program altered them
set RAM[1] 1,
set RAM[2] 1,
set RAM[3] 3,
output;  // Output result in RAM[0]
