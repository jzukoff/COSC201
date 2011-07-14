# main.s	Test the posrun function using several test cases.

.data	

list1:		.word		3, 0, 1, 2, 6, -2, 4, 7, 3, 7 
list2:		.word		0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
list3:		.word		-1, -2, -3, -4, -5, -6, -7, -8, -9, -10 
list4:		.word		1, 2, 3, 4, 5, 6, 7, 8, 9, 10 
list5:		.word		1, 5, 0, 3, 4, 0, 6, -7, 8, 9, 10 

newline:	.asciiz		"\n" 

.text

.globl main

main:	addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)	# Save return address

	la	$a0, list1	# 1st parameter: address of list[0]
	li	$a1, 10		# 2nd parameter: size of list
	jal	test		# call function

	la	$a0, list2	# 1st parameter: address of list[0]
	li	$a1, 10		# 2nd parameter: size of list
	jal	test		# call function

	la	$a0, list3	# 1st parameter: address of list[0]
	li	$a1, 10		# 2nd parameter: size of list
	jal	test		# call function

	la	$a0, list4	# 1st parameter: address of list[0]
	li	$a1, 10		# 2nd parameter: size of list
	jal	test		# call function

	la	$a0, list5	# 1st parameter: address of list[0]
	li	$a1, 10		# 2nd parameter: size of list
	jal	test		# call function

	la	$a0, list1	# 1st parameter: address of list[0]
	li	$a1, 5		# 2nd parameter: size of list
	jal	test		# call function

	la	$a0, list1	# 1st parameter: address of list[0]
	li	$a1, 50		# 2nd parameter: size of list
	jal	test		# call function

	la	$a0, list1	# 1st parameter: address of list[0]
	li	$a1, -1		# 2nd parameter: size of list
	jal	test		# call function

return:
	li	$v0, 17		# Return value
	li	$a0, 0
	syscall			# Return



.globl	test

test:	addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)	# Save return address

	jal	posrun		# call function
				# Print result
	move	$a0, $v0	# a0 = result, for printing 
	li	$v0, 1		# Load the system call number 
	syscall	 
				# Print newline 
	la	$a0, newline	# Load the address of the string 
        li	$v0, 4		# Load the system call number
	syscall 

	lw	$ra, 0($sp)	# Restore return address
	addi	$sp, $sp, 4	# Restore stack pointer
	jr $ra			# Return

# $Id: main.s,v 1.2 2006/05/25 13:59:26 parks Exp $
# Author: Thomas M. Parks
