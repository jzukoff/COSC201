# Test
# 
# Takes the array in data memory from location 0 to n-1 and replaces
# it with the array of partial sums
# 

.data

store: .word 0

.text
.globl main

main:
loop:
	addi $t0, $zero, 1
	addi $t1, $zero, 4
	add  $t2, $t0, $t1
	slt  $t3, $t0, $t1
	la   $t1, store
	sw   $t2, 0($t1)
	lw   $t4, 0($t1)
	beq  $t3, $zero, loop
stop:	beq  $zero, $zero, stop

