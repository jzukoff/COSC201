# towers.s - Solve the Towers of Hanoi puzzle.
# Print each move and return the total number
# of moves needed to solve the puzzle.
#
# Author:	Chris Nevison	1997/09/22
# Revised:	Tom Parks	2002/09/27

# Student:	Your Name	Date

.text 
.globl towers 

# Preconditions:	
#   1st parameter (a0) numDiscs, number of discs to move
#   2nd parameter (a1) start, starting peg
#   3rd parameter (a2) goal, ending peg
# Postconditions:
#   result (v0) steps, total number of steps required to solve puzzle

towers:	
addi $sp, $sp, -24			
sw $a0, 0($sp)				
sw $a1, 4($sp)
sw $a2, 8($sp)
sw $s0, 12($sp)
sw $s1, 16($sp)
sw $ra, 20($sp)				
		
if: 
li $t0, 2
slt $t0, $a0, $t0				# numDiscs < 2
beq $t0, $zero, else				# if not, go to else 

lw $a0, 4($sp)				# 1st parameter = start
lw $a1, 8($sp)				# 2nd parameter = goal
jal print				# call print function

li $v0, 1				# return value = 1 
j endif				# jump past else 

else:
li $s1, 6				# s1 = peg = 6
sub $s1, $s1, $a1				# peg = peg - start 
sub $s1, $s1, $a2				# peg = peg - goal = 6 - start - goal 
lw $a0, 0($sp)
addi $a0, $a0, -1			# 1st parameter = numDiscs - 1
lw $a1, 4($sp)				# 2nd parameter = start
move $a2, $s1				# 3rd parameter = peg
jal towers				# recursive call to towers 
move $s0, $v0				# s0 = steps = result

li $a0, 1				# 1st parameter = 1
lw $a1, 4($sp)				# 2nd parameter = start
lw $a2, 8($sp)				# 3rd parameter = goal
jal towers				# recursive call to towers 
add $s0, $s0, $v0				# steps = steps + result 
lw $a0, 0($sp)
addi $a0, $a0, -1				# 1st parameter = numDiscs - 1
move $a1, $s1				# 2nd parameter = peg
lw $a2, 8($sp)				# 3rd parameter = goal
jal towers				# recursive call to towers 
add $v0, $s0, $v0				# return value = steps + result

endif:		
lw $a0, 0($sp)				
lw $a1, 4($sp)
lw $a2, 8($sp)
lw $s0, 12($sp)
lw $s1, 16($sp)
lw $ra, 20($sp)	
addi $sp, $sp, 24	
jr $ra				# return 

# $Id: towers.s,v 1.2 2003/08/29 18:08:50 parks Exp $
