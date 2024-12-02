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
	#shared colors
	.eqv	black	0x00000000
	#season menu colors
	.eqv	RED 	0x00FF0000	
	.eqv	GREEN 	0x0000FF00	
	.eqv	BLUE	0x000000FF
	.eqv	sback	0x00cfdb72 
	#animal menu colors
	.eqv	aback	0x00cdf1f4

.text

main:
	jal seasonbackground
	
	#lettering & numbers for seasons
	jal lettersS
	
	li $v0, 10	#exit safely
	syscall
seasonbackground:
	li $a0, sback #store color for bakground
	li $s1, DISPLAY
		#set s2 = last memory address of the display
	li $s2, WIDTH
	mul $s2, $s2, HEIGHT
	mul $s2, $s2, 4		#word
	add $s2, $s1, $s2
	
backgroundLoop:
	sw $a0, 0($s1)
	addiu $s1, $s1, 4
	ble $s1, $s2, backgroundLoop
	
	jr $ra
	
lettersS:#first row pixel by pixel, second using stack to test leghth between each method
	li $a2, black

	li $a0, 4
	li $a1, 2	#row 1
	jal draw_pixel
	li $a0, 5
	jal draw_pixel
	li $a0, 6
	jal draw_pixel
	li $a0, 14
	jal draw_pixel
	li $a0, 15
	jal draw_pixel
	li $a0, 18
	jal draw_pixel
	li $a0, 21
	jal draw_pixel
	li $a0, 26
	jal draw_pixel
	li $a0, 27
	jal draw_pixel
	li $a0, 33
	jal draw_pixel
	li $a0, 34
	jal draw_pixel
	li $a0, 35
	jal draw_pixel
	li $a0, 37
	jal draw_pixel
	li $a0, 38
	jal draw_pixel
	li $a0, 39
	jal draw_pixel
	li $a0, 40
	jal draw_pixel
	li $a0, 43
	jal draw_pixel
	li $a0, 44
	jal draw_pixel
	li $a0, 48
	jal draw_pixel
	li $a0, 49
	jal draw_pixel
	li $a0, 50
	jal draw_pixel
	li $a0, 53
	jal draw_pixel
	li $a0, 54
	jal draw_pixel
	li $a0, 57
	jal draw_pixel
	li $a0, 60
	jal draw_pixel
	
	#row 2 grouping stack
	
	li $t1, 1024
	
	li $t0, black
	sw $t0, display($t1)
	
	li $t0, black
	addi $t1, $t1, 12
	sw $t0, display($t1)
	# try to do it using a loop now
	jal draw_pixel
	
	jr $ra

#preconditions: 
#	$a0 = x position (columns)
#	$a1 = y position (row)
#	$a2 = color you want to print
#postconditions:
draw_pixel:
	# s1 = address = DISPLAY + 4 * (x + (y * WIDTH))
	mul $s1, $a1, WIDTH	#(y * WIDTH))
	add $s1, $s1, $a0	# (x + (y * WIDTH))
	mul $s1, $s1, 4		#4 * (x + (y * WIDTH))
	sw $a2, DISPLAY($s1)
	
	jr $ra
