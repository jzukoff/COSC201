# posrun.s 
# An assembly language outline of the C++ program posrun.cpp

# Student:	Josh Zukoff	September 13 2010

.text
.globl	posrun

# Preconditions:
#   1st parameter (a0) address of the first element of the array
#   2nd parameter (a1) size of the array
# Postconditions:	
#   result (v0) length of the longest consecutive run of positive
#     numbers in the array

posrun:	li $t0, 0		
li $v0, 0			
add $t4, $a0, $zero
add $t5, $a1, $zero
ble $t5, $zero, endfor			
for: lw $t3, 0($t4)								
ble $t3, $zero, else1				
if1: addi $t0, $t0, 1				
j endif1				
else1: li $t0, 0				
endif1:	blt $t0, $v0, endif2				
if2: add $v0, $zero, $t0 				
endif2: addi $t5, $t5, -1
addi $t4, $t4, 4
beq $t5, $zero, endfor				
j for				
endfor:	jr	$ra		

# $Id: posrun.s,v 1.3 2006/05/25 13:59:26 parks Exp $
# Authors: Chris Nevison and Thomas M. Parks
