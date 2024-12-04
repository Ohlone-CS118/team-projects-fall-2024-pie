#this file will hold base map and migration data, have loop in here that displays each migration data on top of base map based on user choice
#code for jumping for each animal will be outside this file
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

printTurtle:
	jal atlantic
	#jal turtleWinter
	
	#jal turtuleSpring

	#jal turtleSummmer
	
	#jal #turtleFall
	#if user picks 
	li $v0, 10	#exit safely
	syscall

atlantic:
