# Towers of Hanoi
# Author:	Chris Nevison	1997/09/22
# Revised:	Tom Parks	2002/09/27

.text 
.globl	main 
.globl	print

	
# main:	Test the towers function.
main:	
	la	$a0, prompt	# first parameter = prompt
	li	$v0, 4		# load the "print string" syscall number 
	syscall

	li	$v0, 5		# load the "read integer" syscall number 
	syscall
	move	$s0, $v0	# numDiscs = s0 = value returned 

	li	$s1, 1		# start = s1 = 1
	li	$s2, 3		# goal = s2 = 3

	move	$a0, $s0	# first parameter = numDiscs 
	move	$a1, $s1	# second parameter = start
	move	$a2, $s2	# third parameter = goal
	jal	towers
	move	$s3, $v0	# steps = s3 = value returned

	la	$a0, endl	# first parameter = endl
	li	$v0, 4		# load the "print string" syscall number 
	syscall

	move	$a0, $s0	# first parameter = numDiscs 
	li	$v0, 1		# load the "print integer" syscall number
	syscall

	la	$a0, str1	# first parameter = str1
	li	$v0, 4		# load the "print string" syscall number
	syscall

	move	$a0, $s1	# first parameter = start
	li	$v0, 1		# load the "print integer" syscall number
	syscall

	la	$a0, str2	# first parameter = str2
	li	$v0, 4		# load the "print string" syscall number
	syscall

	move	$a0, $s2	# first parameter = goal
	li	$v0, 1		# load the "print integer" syscall number
	syscall

	la	$a0, str3	# first parameter = str3
	li	$v0, 4		# load the "print string" syscall number
	syscall

	move	$a0, $s3	# first parameter = steps
	li	$v0, 1		# load the "print integer" syscall number
	syscall

	la	$a0, str4	# first parameter = str4
	li	$v0, 4		# load the "print string" syscall number
	syscall

	la	$a0, endl	# first parameter = endl
	li	$v0, 4		# load the "print string" syscall number 
	syscall

	li	$v0, 0		# return value

return:
	li	$v0, 17		# set codes
	li	$a0, 0
	syscall			# end program


# print: Print a move.
# Preconditions:	
#   1st parameter (a0) from, starting peg
#   2nd parameter (a1) to, ending peg
# Postconditions:
#   Prints a message on the screen describing a move from one peg to another

print:	addi	$sp, $sp, -4	# make space on stack
	sw	$a0, 0($sp)	# preserve first parameter

	la	$a0, str5	# first parameter = str5
	li	$v0, 4		# load the "print string" syscall number
	syscall

	lw	$a0, 0($sp)	# first parameter = from
	li	$v0, 1		# load the "print integer" syscall number
	syscall

	la	$a0, str2	# first parameter = str2
	li	$v0, 4		# load the "print string" syscall number
	syscall

	move	$a0, $a1	# first parameter = to
	li	$v0, 1		# load the "print integer" syscall number
	syscall

	la	$a0, endl	# first parameter = endl
	li	$v0, 4		# load the "print string" syscall number
	syscall

	lw	$a0, 0($sp)	# restore first parameter
	addi	$sp, $sp, 4	# restore stack pointer

	jr	$ra		# return

	
.data 
prompt:	.asciiz	"Enter number of discs to be moved: " 
str1:	.asciiz	" discs moved from peg " 
str2:	.asciiz	" to peg " 
str3:	.asciiz	" in " 
str4:	.asciiz	" steps." 
str5:	.asciiz	"Move from peg "
endl:	.asciiz	"\n" 
