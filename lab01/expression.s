# expression.s 
# Evaluate the expression (10 + 9) and print the result.
# Equivalent C++ statement:	cout << (10 + 9) << endl; 
# Equivalent Java statement:	System.out.println(10+9); 

# Student:	Name	Date

# There are four parts to this program.
#      Evaluate the expression. 
#      Print the result. 
#      Print endl. 
#      Return. 

.text
.globl	main

main: 
	# Evaluate the expression.
	# Put the final result in a0 to prepare for the syscall.
	li	$t0, 10		# Put 10 in a register 
	li	$t1, 9		# Put 9 in a register
	li	$t2, 8		# Put 8 in a register
	li	$t3, 7		# Put 7 in a register 
	add	$a0, $t0, $t1	# a0 = t0 + t1
	add $a1, $t2, $t3	# a1 = t0 + t2
	sub $a0, $a0, $a1	# a0 = a0 - a1 

	# Print the integer result in a0
	li	$v0, 1		# Load the system call number 
	syscall 

	# Print endl.
	la	$a0, endl	# Load the address of the string 
	li	$v0, 4		# Load the system call number 
	syscall 

	# Return.
	li	$v0, 17		# Load 17 into v0 to exit the program
	li	$a0, 0		# Load 0 into a0 (this will be the return value)
	syscall

.data 

endl:	.asciiz	"\n" 

# $Id: expression.s,v 1.3 2006/05/25 13:42:10 parks Exp $
# Authors: Chris Nevison and Thomas M. Parks
