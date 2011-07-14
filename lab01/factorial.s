# factorial.s 
# Compute n! recursively.

.text
.globl factorial
.globl main

# Prompt for a nonnegative integer
# and invoke the factorial function.

main:
	addi	$sp, $sp, -4	# Make space on stack.
	sw	$ra, 0($sp)	# Save return address.

	la	$a0, prompt
	li	$v0, 4
	syscall			# Display prompt.

	li	$v0, 5
	syscall			# Get integer response.

	move	$a0, $v0	# Call factorial function.
	jal	factorial

	move	$a0, $v0
	li	$v0, 1
	syscall			# Print integer result.

	la	$a0, endl
	li	$v0, 4
	syscall			# Print endl.

	li	$v0, 0		# Return zero.
	lw	$ra, 0($sp)	# Restore return address.
	addi	$sp, $sp, 4	# Restore stack pointer.

	# end program
	li	$v0, 17
	li	$a0, 0
	syscall

# Preconditions:	
#   1st parameter (a0) non-negative integer, n
# Postconditions:
#   result (v0) n factorial

factorial:
	addi	$sp, $sp, -8	# Make space on stack.
	sw	$ra, 0($sp)	# Save return address.
	
	li	$v0, 1		# 0! = 1	
	beqz	$a0, zero	# Special case for 0!

	sw	$a0, 4($sp)	# Save our argument.
	addi	$a0, $a0, -1	# Calculate (n-1)!
	jal	factorial	# Result in v0.
	lw	$a0, 4($sp)     # Restore our argument.
	mul	$v0, $a0, $v0	# n! = n * (n-1)!
zero: 
	lw	$ra, 0($sp)	# Restore return address.
	addi	$sp, $sp, 8	# Restore stack pointer.
	jr	$ra		# Return.

.data

prompt: .asciiz "Enter a non-negative integer: "
endl:	.asciiz "\n"

# $Id: factorial.s,v 1.3 2006/05/25 13:42:10 parks Exp $
# Authors: Chris Nevison and Thomas M. Parks
