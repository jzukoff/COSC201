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
	nop				
	addi	$t0, $zero, 0	lw	$t2, 0($t0)		
	nop
	add	$t2, $t2, $t2		
	add	$t2, $t2, $t2		
	add	$t1, $t2, $t0		
	addi 	$t0, $t0, 4
	beq	$t1, $t0, halt		
	addi 	$t1, $t1, -12
	add	$t4, $t1, $t2		
	



loop:				lw	$t3, 0($t1)		
				lw	$t5, 0($t4)		
	add	$t5, $t5, $t3	lw	$t6, 4($t1)		
	add	$t4, $t4, $t2	sw	$t5, 0($t4)	
	add	$t4, $t1, $t2	lw	$t5, 4($t4)		
	add	$t5, $t5, $t6	lw	$t3, 8($t1)			
	add	$t4, $t4, $t2	sw	$t5, 4($t4)	
	add	$t4, $t1, $t2	lw	$t5, 8($t4)
	add	$t5, $t5, $t3	lw	$t6, 12($t1)		
	add	$t4, $t4, $t2	sw	$t5, 8($t4)	
	add	$t7, $t1, $t2	lw	$t8, 12($t7)	
	add	$t8, $t8, $t6		
	add	$t7, $t7, $t2	sw	$t8, 12($t7)		
	beq	$t1, $t0, halt		
	addi	$t1, $t1, -16		
	beq	$zero, $zero, loop	
	add	$t4, $t1, $t2		
	

halt:	beq	$zero, $zero, halt


.data
length:	.word	8
arrayA:	.word	9, -8, 7, -2, 5, 4, -1, 2
arrayB:	.word	-8, 10, -4, 6, 0, 2, 8, 6
arrayC:	.word	0, 0, 0, 0, 0, 0, 0, 0

# 2009/11/08
# Author: Chris Nevison
