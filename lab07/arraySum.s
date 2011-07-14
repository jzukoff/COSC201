# ArraySum
# 
# Takes the array in data memory from location 0 to n-1 and replaces
# it with the array of partial sums
# 

.data
A:	.word 0x3, 0xf, 0x14, 0x2

.text
.globl main

main:

	la $t4, A			# t4 is base address of array A
nop
nop
nop
nop
nop
	addi $t1, $t4, 16		# set last value as 16 past base
nop
nop 
nop
nop
nop
	add $t0, $zero, $t4		# set k = base
nop
nop	
nop
nop
nop	
add $t2, $zero, $zero		# set sum = 0
nop
nop
nop
nop
nop
loop: nop
nop
nop
nop
nop	
beq $t0, $t1, endprg		# branch to end of program
nop
nop
nop
nop
nop	
lw $t3, 0($t0)			# t3 = A[k]
nop
nop
nop
nop
nop
	add $t2, $t2, $t3		# sum = sum + A[k]
nop
nop
nop
nop
nop
	sw $t2, 0($t0)			# A[k] = sum
nop
nop
nop
nop
nop
	addi $t0, $t0, 4		# k = k+4
nop
nop
nop
nop
nop
	j loop				# jump to top of loop
nop
nop
nop
nop
nop
	
endprg:	beq $zero, $zero, endprg	# "stop" -- loop here forever
nop
nop
nop
nop
nop
