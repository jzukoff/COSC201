# Arraysum.s
# Compute the sum of the elements in an array.

# Student:	Your Name		Date

#	main()
#	{
#	    int k = len;
#	    do
#	    {
#	        k--;
#	        C[k] = A[k] + B[k];
#	    } while (k > 0);
#	}

# Preconditions:	
#
#   Note: addresses are for LogiSim simulator and may not work for
#         MARS. 
#   1st parameter (mem[0]) length of array
#   2nd parameter (mem[4]) start of array A of integers
#                 Arrays B and C follow immediately in memory
# Postconditions:	
#   result array C is A + B, element-by-element
#
# Code uses pointer hopping

.text
.globl main

	main:
	nop				# just in case
	la 	$t0, length		# t0 = address of word before array[0], length
	lw	$t2, 0($t0)		# t2 = length
	add	$t2, $t2, $t2		# multiply length by 4 to make t2 = length in bytes
	add	$t2, $t2, $t2		# (no sll instruction available)
	add	$t1, $t2, $t0		# t2 is length in bytes for address calculation
					# t1 is initial value for k, address of A[k-1], since base is at t0 + 4
	beq	$zero, $zero, test	# jump to test at end of loop (no j instruction available)

loop:	lw	$t3, 0($t1)		# t2 = A[k]
	add	$t4, $t1, $t2		# t4 = address of B[k]
	lw	$t5, 0($t4)		# t5 = B[k]
	add	$t5, $t5, $t3		# t5 = A[k] + B[k]
	add	$t4, $t4, $t2		# t4 = address of C[k]
	sw	$t5, 0($t4)		# C[k] = A[k] + B[k]
	addi	$t1, $t1, -4		# k--
test:	
	bne	$t1, $t0, loop		# loop test

halt:	beq	$zero, $zero, halt

.data
length:	.word	8
arrayA:	.word	9, -8, 7, -2, 5, 4, -1, 2
arrayB:	.word	-8, 10, -4, 6, 0, 2, 8, 6
arrayC:	.word	0, 0, 0, 0, 0, 0, 0, 0

# 2009/11/08 
# Author: Chris Nevison
