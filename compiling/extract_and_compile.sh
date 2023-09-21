#!/bin/bash

# Check there is only 1 argument 
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Argument: the number for NthPrime
number="$1"

# Step 1: Extract the tar archive
tar -xzf NthPrime.tgz

# Step 2: Change into the NthPrime directory
cd NthPrime || exit 1

# Step 3: Compile the C program
gcc -o NthPrime main.c nth_prime.c -lm

# Step 4: Run the compiled program
./NthPrime "$number"

# Return to the original directory
cd ..

# Exit the script
exit 0
    
    
