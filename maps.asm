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
	.eqv	RED 	0x00FF0000	
	.eqv	GREEN 	0x0000FF00	
	.eqv	BLUE	0x000000FF

.text

main:
	jal australia
	
	li $v0, 10	#exit safely
	syscall
australia:
	li $a0, water #store color for bakground
	li $s1, DISPLAY
		#set s2 = last memory address of the display
	li $s2, WIDTH
	mul $s2, $s2, HEIGHT
	mul $s2, $s2, 4		#word
	add $s2, $s1, $s2
	jal backgroundLoop
	
	#row by row land
	li $a2, land
	
	li $a0, 0
	li $a1, 447
	jal drawLine
	
	li $a0, 448
	li $a1, 511
	jal drawLine
	
	li $a0, 512
	li $a1, 575
	jal drawLine
	
	li $a0, 576
	li $a1, 638
	jal drawLine
	
	li $a0, 640
	li $a1, 702 
	jal drawLine
	
	li $a0, 704
	li $a1, 765
	jal drawLine
	
	li $a0, 768
	li $a1, 829
	jal drawLine
	
	li $a0, 832
	li $a1, 892
	jal drawLine
	
	li $a0, 896
	li $a1, 956
	jal drawLine
	
	li $a0, 960
	li $a1, 1020
	jal drawLine
	
	li $a0, 1026
	li $a1, 1084
	jal drawLine
	
	li $a0, 1092
	li $a1, 1148
	jal drawLine
	
	li $a0, 1157
	li $a1, 1212
	jal drawLine
	
	li $a0, 1221
	li $a1, 1277
	jal drawLine
	
	li $a0, 1286
	li $a1, 1341
	jal drawLine
	
	li $a0, 1350
	li $a1, 1405
	jal drawLine
	
	li $a0, 1414
	li $a1, 1468
	jal drawLine
	
	li $a0, 1480
	li $a1, 1531
	jal drawLine
	
	li $a0, 1544
	li $a1, 1594
	jal drawLine
	
	li $a0, 1608
	li $a1, 1657
	jal drawLine
backgroundLoop:
	sw $a0, 0($s1)
	addiu $s1, $s1, 4
	ble $s1, $s2, backgroundLoop
	
	jr $ra

#preconditions: 
#	$a0 = x position (columns)
#	$a1 = y position (row)
#	$a2 = color you want to print
#postconditions:
drawPixel:
	# s1 = address = DISPLAY + 4 * (x + (y * WIDTH))
	mul $s1, $a1, WIDTH	#(y * WIDTH))
	add $s1, $s1, $a0	# (x + (y * WIDTH))
	mul $s1, $s1, 4		#4 * (x + (y * WIDTH))
	sw $a2, DISPLAY($s1)
	
	jr $ra
#a0: start pixel
#a1: end pixel
#a2: color to print
    
drawLine:
    # Calculate the starting address of the row (DISPLAY + a0 * PIXEL_SIZE)
    li   $t0, DISPLAY        # Base address of the display
    mul  $t1, $a0, PIXEL_SIZE  # Starting pixel * PIXEL_SIZE (4 bytes per pixel)
    add  $t0, $t0, $t1       # $t0 now holds the starting address

    # Calculate the ending address (DISPLAY + a1 * PIXEL_SIZE)
    mul  $t2, $a1, PIXEL_SIZE  # Ending pixel * PIXEL_SIZE
    add  $t2, $t2, DISPLAY    # $t2 now holds the ending address

for_loop:
    bge  $t0, $t2, draw_done  # Exit if start >= end
    sw   $a2, 0($t0)          # Store the color in memory
    addiu $t0, $t0, PIXEL_SIZE # Move to the next pixel (4 bytes forward)
    j    for_loop             # Repeat the loop

draw_done:
    jr   $ra                  # Return from the function
