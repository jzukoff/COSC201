		# MatMultDriver
		#
		# Sets up three 4x4 matrices of doubles in memory
		#
		# Calls MatMult
		#
		# results replace xmat in memory

.data

xmat:	.double	1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 2.0, -1.0, -1.0, -1.0, -1.0, 3.0, 3.0, 3.0, 3.0
ymat:	.double	2.0, -1.5, 3.5, 2.0, 1.5, -2.5, 3.0, 5.0, 4.0, 6.0, -2.0, 3.5, 2.0, 3.5, 1.0, -1.0
zmat:	.double	1.0, 2.0, 2.0, 1.0, 2.0, 3.0, 3.0, 2.0, 1.0, 2.0, 1.0, 2.0, 2.0, 2.0, 1.0, 1.0
count:	.word	0

newline:	.asciiz		"\n" 
space:		.asciiz		" "

.text
.globl main
.globl printMat

main:
		la $a0, xmat
		li $a1, 4
		jal printMat
		
		la $a0, ymat
		li $a1, 4
		jal printMat
		
		la $a0, zmat
		li $a1, 4
		jal printMat
		
		la $a0, xmat
		la $a1, ymat
		la $a2, zmat
		la $a3, count
		
		jal MatMult

		la $a0, xmat
		li $a1, 4
		jal printMat
		

return:
		li	$v0, 17		# Return value
		li	$a0, 0
		syscall			# Return
		
		
printMat:
		add $s0, $a0, $zero 
		add $s1, $a1, $zero 
		
		la	$a0, newline	# Load the address of the string 
	        li	$v0, 4		# Load the system call number
		syscall 

		add $t0, $s0, $zero
		sll $t1, $s1, 3  	# t1 is row length
		add $t2, $t0, $t1	# t2 terminates row
		mul $t3, $t1, $s1	# t3 total bytes in array
		add $t3, $t3, $t0	# address after end of array

colLoop:
		la	$a0, space	# Load the address of the string 
	        li	$v0, 4		# Load the system call number
		syscall 

		l.d $f12, ($t0)
		li $v0, 3
		syscall
		addi $t0, $t0, 8
		bne $t0, $t2, colLoop
		
					# Print newline 
		la	$a0, newline	# Load the address of the string 
	        li	$v0, 4		# Load the system call number
		syscall 

		add 	$t2, $t2, $t1
		bne	$t0, $t3, colLoop
		
		jr $ra
		
		
		
		
		











