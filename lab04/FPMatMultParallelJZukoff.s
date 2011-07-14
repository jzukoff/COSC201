		# void MatMult(double x[][], double y [][], double z[][]
		# int i. j. k
		# 
		# for(i=0; i != 4; i++)
		#	for(j=0; j != 4; j++
		#		for(k=0; k != 4; k++)
		#			x[i][j] = x[i][j] + y[i][k]*z[k][j];
		#
		# $a0 is base address for array x
		# $a1 is base address for array y
		# $a2 is base address for array z
		# $a3 is address for job counter
		# results stored into memory for x

.text
.globl MatMult

MatMult:
		addi $sp, $sp, -16	# increment stack for four values
		sw $ra, 12($sp)		# store return address
		sw $s0, 8($sp)		# store $s0
		sw $s1, 4($sp)		# store $s1
		sw $s2, 0($sp)		# store $s2

		li $t1, 4 		# $t1 = 4, row size, loop end

	# replace this code with atomic fetch and increment of job counter
	# use job counter to determine i, j indices
	# place constants for use in registers
	# control job loop appropriately
	#
	#li $s0, 0 		# i = 0, init first for loop
	#Loop1:	li $s1, 0 		# j = 0, init first for loop
Loop1:
ll $t7, 0($a3)
li $t5, 3
and $s1, $t5, $t7
srl $t2, $t7, 2
and $s0, $t5, $t2





	# end of first segment of new code

		li $s2, 0 			# k = 0, init first for loop

		sll $t2, $s0, 2		# $t2 = 4*i (4 = size of row)
		addu $t2, $t2, $s1	# $t2 = 4*i + j
		sll $t2, $t2, 3		# $t2 = 8-byte offset of above
		addu $t2, $t2, $a0	# $t2 = address of x[i][[j]
		l.d $f4, 0($t2)		# $f4/5 = x[i][j]o

Loop3:	sll $t0, $s2, 2		# $t0 = 4*k (4 = size of row)
		addu $t0, $t0, $s1	# $t0 = 4*k + j
		sll $t0, $t0, 3		# $t0 = 8-byte offset of above
		addu $t0, $t0, $a2	# $t0 = address of z[k][[j]
		l.d $f16, 0($t0)	# $f16/17 = z[i][j]

		sll $t0, $s0, 2		# $t0 = 4*i (4 = size of row)
		addu $t0, $t0, $s2	# $t0 = 4*i + k
		sll $t0, $t0, 3		# $t0 = 8-byte offset of above
		addu $t0, $t0, $a1	# $t0 = address of y[k][[j]
		l.d $f18, 0($t0)	# $f18/19 = y[i][j]

		mul.d $f16, $f16, $f18	# $f16 = y[i][k]*z[k][j]
		add.d $f4, $f4, $f16	# $f4 = x[i]j[] + y[i][k]*z[k][j]

		addiu $s2, $s2, 1	# k = k+1
		bne $s2, $t1, Loop3	# continue Loop3 if k != 4, end of row
		s.d $f4, 0($t2)		# end of loop, store $f4 to x[i][j]

	# This code controls the i and j loops and should be replaced 
	# with code to control the job loop, going back to get a new 
	# job if any exists
	#
	#		addiu $s1, $s1, 1	# j = j+1
	#		bne $s1, $t1, Loop2	# continue Loop2 if j != 4
	#		addiu $s0, $s0, 1	# i = i+1
	#		bne $s0, $t1, Loop1	# continue Loop2 if j != 4
addi $t7, $t7, 1
move $t6, $t7
sc $t7, 0($a3)
beq $t7, $zero, Loop1
beq $t6, 16, End
j Loop1




	# end of second segment of new code
End:		lw $ra, 12($sp)		# restore return address
		lw $s0, 8($sp)		# restore $s0
		lw $s1, 4($sp)		# restore $s1
		lw $s2, 0($sp)		# restore $s2
		addi $sp, $sp, 16

		jr $ra
