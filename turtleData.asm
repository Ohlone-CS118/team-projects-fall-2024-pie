#this file will hold base map and migration data, for turtle
.data

# set display to:
#	Pixels width and height to 4x4
#	Display width and height to 256x256
#	Base address = 0x10010000
# This will make our screen width 64x64 (256/4 = 64)
#	64 * 64 * 4 = 16384
display:	.space 16384
	
define:
# screen information
	.eqv PIXEL_SIZE 4
	.eqv WIDTH 64
	.eqv HEIGHT 64
	.eqv DISPLAY 0x10010000
#store all colors here so we can just call on them
# colors
	.eqv	water	0x00588dbe
	.eqv	land	0x00fef3c0
	.eqv	winter	0x00943989
	.eqv	spring	0x00e6948f
	.eqv	summer	0x0094241a
	.eqv	fall	0x00e68d3e
.text
.globl printTurtle

printTurtle:
	subi $sp, $sp, 4
	sw $ra, 0($sp)

	jal atlantic

	beq $s0, $t0, turtleWinter	# branch to proper season for parrot migration map
	beq $s0, $t1, turtleSpring
	beq $s0, $t2, turtleSummer
	beq $s0, $t3, turtleAutumn
	
	turtleWinter:
	jal turtleW
	j turtleEnd
	
	turtleSpring:
	jal turtleSp
	j turtleEnd
	
	turtleSummer:
	jal turtleS
	j turtleEnd
	
	turtleAutumn:
	jal turtleF

	turtleEnd:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
#base map
atlantic:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, water #store color for bakground
	li $s1, DISPLAY
		#set s2 = last memory address of the display
	li $s2, WIDTH
	mul $s2, $s2, HEIGHT
	mul $s2, $s2, 4		#word
	add $s2, $s1, $s2
	jal backgroundLoop
	
	#land elements
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra
	
backgroundLoop:
	
	sw $a2, 0($s1)
	addiu $s1, $s1, 4
	ble $s1, $s2, backgroundLoop
	jr $ra
	
#migration data
turtleW:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

turtleSp:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

turtleS:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

turtleF:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

#draw loops

#preconditions: a0:start pix, a1:end pix, $a2: color
drawLine:
    # Calculate the starting address of the row (DISPLAY + a0 * PIXEL_SIZE)
    li   $t0, DISPLAY        # Base address of the display
    mul  $t1, $a0, PIXEL_SIZE  # Starting pixel * PIXEL_SIZE (4 bytes per pixel)
    add  $t0, $t0, $t1       # $t0 now holds the starting address

    # Calculate the ending address (DISPLAY + a1 * PIXEL_SIZE)
    mul  $t2, $a1, PIXEL_SIZE  # Ending pixel * PIXEL_SIZE
    add  $t2, $t2, DISPLAY    # $t2 now holds the ending address

forLoop:
    bge  $t0, $t2, drawDone  # Exit if start >= end
    sw   $a2, 0($t0)          # Store the color in memory
    addiu $t0, $t0, PIXEL_SIZE # Move to the next pixel (4 bytes forward)
    j    forLoop             	# Repeat the loop

drawDone:
	jr   $ra                  # Return from the function