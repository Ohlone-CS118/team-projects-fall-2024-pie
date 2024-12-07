#this file will hold base map and migration data, for turtle
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
	#map colors
	.eqv	water	0x00588dbe
	.eqv	land	0x00fef3c0
	#migration colors
	.eqv	winter	0x00943989
	.eqv	spring	0x00e6948f
	.eqv	summer	0x0094241a
	.eqv	fall	0x00e68d3e
	#mini turtle colors
	.eqv	shell	0x008b93af
	.eqv	skin	0x00143464
.text
.globl printTurtle

printTurtle:
	subi $sp, $sp, 4
	sw $ra, 0($sp)

	jal atlantic			# call function for base map
	
	li $v0, 4
	la $a0, seasonPrompt		# read integer from user
	syscall
	
	li $v0, 5			# read integer from user
	syscall

	move $s0, $v0			# store choice
	
	li $t0, 1
	li $t1, 2
	li $t2, 3
	li $t3, 4
	
	# at this point we need to re establish our t0-t3 registers because they are overriden in turtleData << atlantic subroutine
	beq $s0, $t0, turtleWinter	# branch to proper season for parrot migration map
	beq $s0, $t1, turtleSpring
	beq $s0, $t2, turtleSummer
	beq $s0, $t3, turtleAutumn
	
	turtleWinter:
	li $a2, winter
	jal turtleSW
		#mini turtle
		li $a2, shell
		li $a0, 2504
		li $a1, 2505
		jal drawLine
	
		li $a0, 2567
		li $a1, 2570
		jal drawLine

		li $a2, skin
		li $a0, 2570
		li $a1, 2571
		jal drawLine
	
		li $a0, 2631
		li $a1, 2632
		jal drawLine
	
		li $a0, 2633
		li $a1, 2634
		jal drawLine
	j turtleEnd
	
	turtleSpring:
	jal turtleSp
	j turtleEnd
	
	turtleSummer:
	li $a2, summer
	jal turtleSW
	
		#mini turtle
		li $a2, shell
		li $a0, 661
		li $a1, 662
		jal drawLine
	
		li $a0, 724
		li $a1, 727
		jal drawLine
	
		li $a2, skin
		li $a0,727
		li $a1,728
		jal drawLine
	
		li $a0, 788
		li $a1, 789
		jal drawLine
	
		li $a0, 790
		li $a1, 791
		jal drawLine
	
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
	li $a2, land
	
	li $a0, 0
	li $a1, 22
	jal drawLine
	
	li $a0, 64
	li $a1, 87
	jal drawLine
	
	li $a0, 128
	li $a1, 152
	jal drawLine
	
	li $a0, 192
	li $a1, 208
	jal drawLine
	
	li $a0, 212
	li $a1, 216
	jal drawLine
	
	li $a0, 256
	li $a1, 271
	jal drawLine
	
	li $a0, 275
	li $a1, 279
	jal drawLine
	
	li $a0, 320
	li $a1, 334
	jal drawLine
	
	li $a0, 338
	li $a1, 342
	jal drawLine
	
	li $a0, 384
	li $a1, 397
	jal drawLine
	
	li $a0, 403
	li $a1, 405
	jal drawLine
	
	li $a0, 448
	li $a1, 461
	jal drawLine
	
	li $a0, 512
	li $a1, 524
	jal drawLine
	
	li $a0, 576
	li $a1, 588
	jal drawLine
	
	li $a0, 640
	li $a1, 653
	jal drawLine
	
	li $a0, 704
	li $a1, 717
	jal drawLine
	
	li $a0, 768
	li $a1, 782
	jal drawLine
	
	li $a0, 832
	li $a1,846
	jal drawLine
	
	li $a0, 896
	li $a1, 909
	jal drawLine
	
	li $a0, 960
	li $a1, 973
	jal drawLine
	
	li $a0, 1024
	li $a1, 1036
	jal drawLine
	
	li $a0, 1088
	li $a1, 1099
	jal drawLine
	
	li $a0, 1152
	li $a1, 1163
	jal drawLine
	
	li $a0, 1216
	li $a1, 1227
	jal drawLine
	
	li $a0, 1280
	li $a1, 1291
	jal drawLine
	
	li $a0, 1344
	li $a1, 1355
	jal drawLine
	
	li $a0, 1408
	li $a1, 1419
	jal drawLine
	
	li $a0, 1472
	li $a1, 1482
	jal drawLine
	
	li $a0, 1536
	li $a1, 1545
	jal drawLine
	
	li $a0, 1600
	li $a1, 1608
	jal drawLine
	
	li $a0, 1664
	li $a1, 1671
	jal drawLine
	
	li $a0, 1728
	li $a1, 1734
	jal drawLine
	
	li $a0, 1792
	li $a1, 1798
	jal drawLine
	
	li $a0, 1856
	li $a1, 1861
	jal drawLine
	
	li $a0, 1920
	li $a1, 1924
	jal drawLine
	
	li $a0, 1984
	li $a1, 1988
	jal drawLine
	
	li $a0, 2048
	li $a1, 2050
	jal drawLine
	
	li $a0, 2112
	li $a1, 2113
	jal drawLine
	
	li $a0, 2176
	li $a1, 2177
	jal drawLine
	
	li $a0, 2240
	li $a1, 2241
	jal drawLine
	
	li $a0, 2304
	li $a1, 2305
	jal drawLine
	
	li $a0, 2368
	li $a1, 2369
	jal drawLine
	
	li $a0, 2432
	li $a1, 2434
	jal drawLine
	
	li $a0, 2496
	li $a1, 2498
	jal drawLine
	
	li $a0, 2560
	li $a1, 2563
	jal drawLine
	
	li $a0, 2624
	li $a1, 2627
	jal drawLine
	
	li $a0, 2688
	li $a1, 2691
	jal drawLine
	
	li $a0, 2752
	li $a1, 2756
	jal drawLine
	
	li $a0, 2816
	li $a1, 2820
	jal drawLine
	
	li $a0, 2881
	li $a1, 2884
	jal drawLine
	
	#cuba
	li $a0, 3520
	li $a1, 3524
	jal drawLine
	
	li $a0, 3584
	li $a1, 3590
	jal drawLine
	
	li $a0, 3648
	li $a1, 3656
	jal drawLine
	
	li $a0, 3712
	li $a1, 3723
	jal drawLine
	
	li $a0, 3781
	li $a1, 3788
	jal drawLine
	
	li $a0, 3847
	li $a1, 3854
	jal drawLine
	
	li $a0, 3915
	li $a1, 3919
	jal drawLine
	
	li $a0, 3980
	li $a1, 3984
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

turtleSp:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, spring
	
	li $a0, 2437
	li $a1, 2445
	jal drawLine
	
	li $a0, 2501
	li $a1, 2509
	jal drawLine
	
	li $a0, 2565
	li $a1, 2573
	jal drawLine
	
	li $a0, 2629
	li $a1, 2637
	jal drawLine
	
	li $a0, 2693
	li $a1, 2701
	jal drawLine
	
	li $a0, 2757
	li $a1, 2765
	jal drawLine
	
	li $a0, 2821
	li $a1, 2829
	jal drawLine
	
	li $a0, 2885
	li $a1, 2893
	jal drawLine
	
	#mini turtle
	li $a2, shell
	li $a0, 2632
	li $a1, 2633
	jal drawLine
	
	li $a0, 2695
	li $a1, 2698
	jal drawLine

	li $a2, skin
	li $a0, 2698
	li $a1, 2699
	jal drawLine
	
	li $a0, 2759
	li $a1, 2760
	jal drawLine
	
	li $a0, 2761
	li $a1, 2762
	jal drawLine
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

turtleSW:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a0, 531
	li $a1, 537
	jal drawLine
	
	li $a0, 595
	li $a1, 601
	jal drawLine
	
	li $a0, 658
	li $a1, 665
	jal drawLine
	
	li $a0, 722
	li $a1, 729
	jal drawLine
	
	li $a0, 786
	li $a1, 793
	jal drawLine
	
	li $a0, 849
	li $a1, 857
	jal drawLine
	
	li $a0, 913
	li $a1, 921
	jal drawLine
	
	li $a0, 976
	li $a1, 984
	jal drawLine
	
	li $a0, 1040
	li $a1, 1048
	jal drawLine
	
	li $a0, 1103
	li $a1, 1111
	jal drawLine
	
	li $a0, 1167
	li $a1, 1175
	jal drawLine
	
	li $a0, 1231
	li $a1, 1239
	jal drawLine
	
	li $a0, 1295
	li $a1, 1303
	jal drawLine
	
	li $a0, 1359
	li $a1, 1367
	jal drawLine
	
	li $a0, 1423
	li $a1, 1431
	jal drawLine
	
	li $a0, 1486
	li $a1, 1495
	jal drawLine
	
	li $a0, 1549
	li $a1, 1558
	jal drawLine
	
	li $a0, 1612
	li $a1, 1622
	jal drawLine
	
	li $a0, 1675
	li $a1, 1685
	jal drawLine
	
	li $a0, 1738
	li $a1, 1748
	jal drawLine
	
	li $a0, 1801
	li $a1, 1811
	jal drawLine
	
	li $a0, 1864
	li $a1, 1874
	jal drawLine
	
	li $a0, 1927
	li $a1, 1938
	jal drawLine
	
	li $a0, 1991
	li $a1, 2001
	jal drawLine
	
	li $a0, 2055
	li $a1, 2064
	jal drawLine
	
	li $a0, 2118
	li $a1, 2127
	jal drawLine

	li $a0, 2181
	li $a1, 2190
	jal drawLine
	
	li $a0, 2244
	li $a1, 2253
	jal drawLine
	
	li $a0, 2308
	li $a1, 2317
	jal drawLine
	
	li $a0, 2372
	li $a1, 2380
	jal drawLine
	
	li $a0, 2436
	li $a1, 2444
	jal drawLine
	
	li $a0, 2500
	li $a1, 2508
	jal drawLine
	
	li $a0, 2564
	li $a1, 2572
	jal drawLine
	
	li $a0, 2628
	li $a1, 2636
	jal drawLine
	
	li $a0, 2692
	li $a1, 2700
	jal drawLine
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

turtleF:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, fall
	
	li $a0, 527
	li $a1, 536
	jal drawLine
	
	li $a0, 591
	li $a1, 600
	jal drawLine
	
	li $a0, 655
	li $a1, 664
	jal drawLine
	
	li $a0, 719
	li $a1, 728
	jal drawLine

	li $a0, 783
	li $a1, 792
	jal drawLine
	
	li $a0, 847
	li $a1, 856
	jal drawLine
	
	li $a0, 911
	li $a1, 920
	jal drawLine
	
	#mini turtle
	li $a2, shell
	li $a0, 659
	li $a1, 660
	jal drawLine
	
	li $a0, 722
	li $a1, 725
	jal drawLine
	
	li $a2, skin
	li $a0,725
	li $a1,726
	jal drawLine
	
	li $a0, 786
	li $a1, 787
	jal drawLine
	
	li $a0, 788
	li $a1, 789
	jal drawLine
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

#draw loops

#preconditions: a0:start pix, a1:end pix, $a2: color
drawLine:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
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
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra
	#jr   $ra                  # Return from the function
