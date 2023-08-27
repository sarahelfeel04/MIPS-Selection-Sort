# MIPS-Selection-Sort

# University Project: MIPS Array Manipulation Procedures

This repository contains the implementation of MIPS assembly procedures to perform various operations on an array of student grades. The procedures implemented in this project include sorting the array using the Selection Sort algorithm, finding the maximum grade, and identifying students eligible for a semester abroad based on their grades.

## Selection Sort - Sel_Sort
The procedure `Sel_Sort` takes as input the address of the first element of an array and the number of elements in the array. It sorts the array using the Selection Sort algorithm, arranging the elements in ascending order.

### Usage
1. Load the address of the first element of the array into a register (`$a0`).
2. Load the number of elements in the array into a register (`$a1`).
3. Call the `Sel_Sort` procedure.

```assembly
# Example Usage
la $a0, array    # Load address of the first element of the array
li $a1, size     # Load number of elements in the array
jal Sel_Sort     # Call Sel_Sort procedure
```

## Top Rank - Top_rank
The procedure `Top_rank` takes as input the address of the first element of an array and the number of elements in the array. It returns the maximum grade present in the array.

### Usage
1. Load the address of the first element of the array into a register (`$a0`).
2. Load the number of elements in the array into a register (`$a1`).
3. Call the `Top_rank` procedure.

```assembly
# Example Usage
la $a0, array    # Load address of the first element of the array
li $a1, size     # Load number of elements in the array
jal Top_rank     # Call Top_rank procedure
```

## Semester Abroad Eligibility - Sem_abroad
The procedure `Sem_abroad` takes as input the address of the first element of an array and the number of elements in the array. It identifies students who are eligible for a semester abroad based on their grades (70% or more) and returns an array of their grades along with the number of eligible students.

### Usage
1. Load the address of the first element of the array into a register (`$a0`).
2. Load the number of elements in the array into a register (`$a1`).
3. Call the `Sem_abroad` procedure.
4. The procedure returns the address of the eligible students' grades array in register `$v0` and the number of eligible students in register `$v1`.

```assembly
# Example Usage
la $a0, array    # Load address of the first element of the array
li $a1, size     # Load number of elements in the array
jal Sem_abroad   # Call Sem_abroad procedure
```
