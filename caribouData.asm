#this file will hold base map and migration data, for caribou
.data
seasonPrompt:	.asciiz "Enter an integer from 1-4: "
# set display to:
#	Pixels width and height to 4x4
#	Display width and height to 256x256
#	Base address = 0x10010000
# This will make our screen width 64x64 (256/4 = 64)
#	64 * 64 * 4 = 16384
	
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
.globl printCaribou

printCaribou:
	subi $sp, $sp, 4
	sw $ra, 0($sp)

	jal alaska
	
	li $v0, 4
	la $a0, seasonPrompt 		# read integer from user
	syscall
	#
	li $v0, 5		# read integer from user
	syscall

	move $s0, $v0		# store choice

	beq $s0, $t0, caribouWinter	# branch to proper season for parrot migration map
	beq $s0, $t1, caribouSpring
	beq $s0, $t2, caribouSummer
	beq $s0, $t3, caribouAutumn
	
	caribouWinter:
	li $a2, winter
	jal caribouWS
	j caribouEnd
	
	caribouSpring:
	jal caribouS
	j caribouEnd
	
	caribouSummer:
	li $a2, summer
	jal caribouWS
	j caribouEnd
	
	caribouAutumn:
	jal caribouF

	caribouEnd:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
#base map
alaska:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, land #store color for bakground
	li $s1, DISPLAY
		#set s2 = last memory address of the display
	li $s2, WIDTH
	mul $s2, $s2, HEIGHT
	mul $s2, $s2, 4		#word
	add $s2, $s1, $s2
	jal backgroundLoop
	#alaska water cutouts
	li $a2, water
	
	li $a0, 0
	li $a1, 15
	jal drawLine
	
	li $a0, 52
	li $a1, 76
	jal drawLine
	
	li $a0, 117
	li $a1, 139
	jal drawLine
	
	li $a0, 181
	li $a1, 202
	jal drawLine
	
	li $a0, 247
	li $a1, 265
	jal drawLine
	
	li $a0, 320
	li $a1, 329
	jal drawLine
	
	li $a0, 384
	li $a1, 392
	jal drawLine
	
	li $a0, 448
	li $a1, 456
	jal drawLine
	
	li $a0, 512
	li $a1, 518
	jal drawLine
	
	li $a0, 576
	li $a1, 581
	jal drawLine
	
	li $a0, 640
	li $a1, 643
	jal drawLine
	
	li $a0, 704
	li $a1, 705
	jal drawLine
	
	li $a0, 1088
	li $a1, 1089
	jal drawLine
	
	li $a0, 1152
	li $a1, 1154
	jal drawLine
	
	li $a0, 1216
	li $a1, 1218
	jal drawLine
	
	li $a0, 1280
	li $a1, 1283
	jal drawLine
	
	li $a0, 1344
	li $a1, 1347
	jal drawLine
	
	li $a0, 1408
	li $a1, 1412
	jal drawLine
	
	li $a0, 1472
	li $a1, 1476
	jal drawLine
	
	li $a0, 1536
	li $a1, 1541
	jal drawLine
	
	li $a0, 1600
	li $a1, 1605
	jal drawLine
	
	li $a0, 1664
	li $a1, 1669
	jal drawLine
	
	li $a0, 1728
	li $a1, 1734
	jal drawLine
	
	li $a0, 1792
	li $a1, 1798
	jal drawLine
	
	li $a0, 1856
	li $a1, 1862
	jal drawLine
	
	li $a0, 1920
	li $a1, 1926
	jal drawLine
	
	li $a0, 1984
	li $a1, 1990
	jal drawLine
	
	li $a0, 2048
	li $a1, 2054
	jal drawLine
	
	li $a0, 2112
	li $a1, 2119
	jal drawLine
	
	li $a0, 2176
	li $a1, 2187
	jal drawLine
	
	li $a0, 2240
	li $a1, 2252
	jal drawLine
	
	li $a0, 2304
	li $a1, 2316
	jal drawLine
	
	li $a0, 2368
	li $a1, 2381
	jal drawLine
	
	li $a0, 2432
	li $a1, 2446
	jal drawLine
	
	li $a0, 2496
	li $a1, 2511
	jal drawLine

	li $a0, 2560
	li $a1, 2576
	jal drawLine
	
	li $a0, 2624
	li $a1, 2641
	jal drawLine
	
	li $a0, 2688
	li $a1, 2695
	jal drawLine
	
	li $a0, 2699
	li $a1, 2705
	jal drawLine
	
	li $a0, 2752
	li $a1, 2756
	jal drawLine
	
	li $a0, 2763
	li $a1, 2769
	jal drawLine
	
	li $a0, 2816
	li $a1, 2817
	jal drawLine
	
	li $a0, 2827
	li $a1, 2831
	jal drawLine
	
	li $a0, 3264
	li $a1, 3265
	jal drawLine
	
	li $a0, 3328
	li $a1, 3331
	jal drawLine
	
	li $a0, 3392
	li $a1, 3396
	jal drawLine
	
	li $a0, 3456
	li $a1, 3461
	jal drawLine
	
	li $a0, 3472
	li $a1, 3474
	jal drawLine
	
	li $a0, 3520
	li $a1, 3525
	jal drawLine
	
	li $a0, 3535
	li $a1, 3539
	jal drawLine
	
	li $a0, 3584
	li $a1, 3590
	jal drawLine
	
	li $a0, 3598
	li $a1, 3603
	jal drawLine
	
	li $a0, 3648
	li $a1, 3655
	jal drawLine
	
	li $a0, 3660
	li $a1, 3668
	jal drawLine
	
	li $a0, 3712
	li $a1, 3732
	jal drawLine
	
	li $a0, 3776
	li $a1, 3796
	jal drawLine
	
	li $a0, 3840
	li $a1, 3859
	jal drawLine
	
	li $a0, 3904
	li $a1, 3923
	jal drawLine
	
	li $a0, 3968
	li $a1, 3986
	jal drawLine
	
	li $a0, 4032
	li $a1, 4048
	jal drawLine

	lw $ra, 0($sp)
	addi $sp, $sp, 4
		
	jr $ra
	
backgroundLoop:
	
	sw $a2, 0($s1)
	addiu $s1, $s1, 4
	ble $s1, $s2, backgroundLoop
	jr $ra

#migration data
caribouWS: #migration data for winter and summer
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
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
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
caribouS: #data for spring
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, spring
	
	li $a0, 212
	li $a1, 222
	jal drawLine
	
	li $a0, 276
	li $a1, 286
	jal drawLine
	
	li $a0, 340
	li $a1, 350
	jal drawLine
	
	li $a0, 404
	li $a1, 414
	jal drawLine
	
	li $a0, 468
	li $a1, 478
	jal drawLine
	
	li $a0, 532
	li $a1, 542
	jal drawLine
	
	li $a0, 596
	li $a1, 606
	jal drawLine
	
	li $a0, 660
	li $a1, 670
	jal drawLine
	
	li $a0, 724
	li $a1, 734
	jal drawLine
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	
caribouF: #data for fall
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, fall
	
	li $a0, 3014
	li $a1, 3036
	jal drawLine
	
	li $a0, 3078
	li $a1, 3100
	jal drawLine
	
	li $a0, 3142
	li $a1, 3164
	jal drawLine
	
	li $a0, 3206
	li $a1, 3228
	jal drawLine
	
	li $a0, 3270
	li $a1, 3292
	jal drawLine
	
	li $a0, 3334
	li $a1, 3356
	jal drawLine
	
	li $a0, 3398
	li $a1, 3420
	jal drawLine
	
	li $a0, 3480
	li $a1, 3496
	jal drawLine
	
	li $a0, 3544
	li $a1, 3560
	jal drawLine
	
	li $a0, 3608
	li $a1, 3624
	jal drawLine
	
	li $a0, 3672
	li $a1, 3688
	jal drawLine
	
	li $a0, 3736
	li $a1, 3752
	jal drawLine
	
	li $a0, 3800
	li $a1, 3816
	jal drawLine
	
	li $a0, 3864
	li $a1, 3880
	jal drawLine
	
	li $a0, 3928
	li $a1, 3944
	jal drawLine
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	

#drawing loops	

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
