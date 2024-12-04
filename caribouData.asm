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

printCaribou:
	jal alaska
	#li $a2, winter
	#jal caribuWS
	
	#jal caribuSpring
	
	#li $a2, summer
	#jal caribuWS
	
	#jal caribu fall
	#if user picks 
	li $v0, 10	#exit safely
	syscall

alaska:

caribuWS:
	
	li $a0, 854
	li $a1,	861
	jal drawLine
	
	li $a0, 918
	li $a1,	925
	jal drawLine
	
	li $a0, 982
	li $a1,	989
	jal drawLine
	
	li $a0, 1046
	li $a1,	1054
	jal drawLine
	
	li $a0, 1110
	li $a1,	1118
	jal drawLine
	
	li $a0, 1174
	li $a1,	1182
	jal drawLine
	
	li $a0, 1238
	li $a1,	1246
	jal drawLine
	
	li $a0, 1302
	li $a1,	1310
	jal drawLine
	
	li $a0, 1366
	li $a1,	1375
	jal drawLine
	
	li $a0, 1430
	li $a1,	1439
	jal drawLine
	
	li $a0, 1494
	li $a1,	1503
	jal drawLine
	
	li $a0, 1558
	li $a1,	1567
	jal drawLine
	
	li $a0, 1622
	li $a1,	1631
	jal drawLine
	
	li $a0, 1686
	li $a1,	1696
	jal drawLine
	
	li $a0, 1749
	li $a1,	1760
	jal drawLine
	
	li $a0, 1813
	li $a1,	1824
	jal drawLine
	
	li $a0, 1877
	li $a1,	1888
	jal drawLine
	
	li $a0, 1941
	li $a1,	1953
	jal drawLine
	
	li $a0, 2005
	li $a1,	2017
	jal drawLine
	
	li $a0, 2005
	li $a1,	2017
	jal drawLine
	
	li $a0, 2069
	li $a1,	2081
	jal drawLine
	
	li $a0, 2133
	li $a1,	2145
	jal drawLine
	
	li $a0, 2197
	li $a1,	2209
	jal drawLine
	
	li $a0, 2261
	li $a1,	2273
	jal drawLine
	
	li $a0, 2325
	li $a1,	2337
	jal drawLine
	
	li $a0, 2389
	li $a1,	2401
	jal drawLine
	
	li $a0, 2453
	li $a1,	2465
	jal drawLine
	
	li $a0, 2517
	li $a1,	2529
	jal drawLine
	
	li $a0, 2581
	li $a1,	2593
	jal drawLine
	
	li $a0, 2645
	li $a1,	2657
	jal drawLine
	
	li $a0, 2709
	li $a1,	2721
	jal drawLine
	
	li $a0, 2773
	li $a1,	2785
	jal drawLine
	
	li $a0, 2837
	li $a1,	2849
	jal drawLine
	
	li $a0, 2901
	li $a1,	2913
	jal drawLine
	
	li $a0, 2965
	li $a1,	2977
	jal drawLine
	
	li $a0, 3029
	li $a1,	3041
	jal drawLine
	
	li $a0, 3093
	li $a1,	3105
	jal drawLine
	
	li $a0, 3157
	li $a1,	3169
	jal drawLine
	
	li $a0, 3221
	li $a1,	3233
	jal drawLine
	
	li $a0, 3285
	li $a1,	3297
	jal drawLine
	
	li $a0, 3349
	li $a1,	3361
	jal drawLine
	
	jr $ra
	
caribuSpring:

caribuFall:

#drawing loops	
#preconditions: a2 is color
backgroundLoop:
	sw $a2, 0($s1)
	addiu $s1, $s1, 4
	ble $s1, $s2, backgroundLoop
	
	jr $ra

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
    j    forLoop             # Repeat the loop

drawDone:
    jr   $ra                  # Return from the function
