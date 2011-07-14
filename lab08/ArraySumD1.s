# Arraysum.s
# Compute the sum of the elements in an array.

# Student: Josh Zukoff 11/15/10

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
	addi	$t0, $zero, 0		lw	$t2, 0($t0)		# t1 = length
	nop
	add	$t2, $t2, $t2		# multiply length by 4 to make t2 = length in bytes
	add	$t2, $t2, $t2		# (no sll instruction available)
	add	$t1, $t2, $t0		# t2 is length for address calculation
	beq	$t1, $t0, halt		lw	$t3, 0($t1)
	



loop:	
	add	$t4, $t1, $t2		lw	$t5, 0($t4)		# t5 = B[k]
	nop
	add	$t5, $t5, $t3		# t5 = A[k] + B[k]
	beq	$t1, $t0, halt		# loop test (bne not available)
	addi	$t1, $t1, -4
	beq	$zero, $zero, loop	lw	$t3, 0($t1)		# t2 = A[k]
	add	$t4, $t4, $t2		sw	$t5, 0($t4)		# C[k] = A[k] + B[k]
	

halt:	beq	$zero, $zero, halt


.data
length:	.word	8
arrayA:	.word	9, -8, 7, -2, 5, 4, -1, 2
arrayB:	.word	-8, 10, -4, 6, 0, 2, 8, 6
arrayC:	.word	0, 0, 0, 0, 0, 0, 0, 0

# 2009/11/08
# Author: Chris Nevison
