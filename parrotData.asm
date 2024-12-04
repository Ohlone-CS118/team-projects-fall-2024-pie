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
.globl printParrot

printParrot:
	subi $sp, $sp, 4
	sw $ra, 0($sp)

	jal australia

	beq $s0, $t0, parrotWinter	# branch to proper season for parrot migration map
	beq $s0, $t1, parrotSpring
	beq $s0, $t2, parrotSummer
	beq $s0, $t3, parrotAutumn
	
	parrotWinter:
	jal parrotW
	j parrotEnd
	
	parrotSpring:
	li $a2, spring
	jal parrotSF
	j parrotEnd
	
	parrotSummer:
	jal parrotS
	j parrotEnd
	
	parrotAutumn:
	li $a2, fall
	jal parrotSF

	parrotEnd:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

australia:
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
	#australia land
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
	
	li $a0, 1672
	li $a1, 1712
	jal drawLine
	
	li $a0, 1739
	li $a1, 1773
	jal drawLine
	
	li $a0, 1804
	li $a1, 1835
	jal drawLine
	
	li $a0, 1871
	li $a1, 1898
	jal drawLine
	
	li $a0, 1936
	li $a1, 1962
	jal drawLine
	
	li $a0, 2000	#line 32
	li $a1, 2021
	jal drawLine
	
	li $a0, 2068
	li $a1, 2084
	jal drawLine
	
	li $a0, 2132
	li $a1, 2148
	jal drawLine
	
	#tasmania
	li $a0, 2539
	li $a1, 2541
	jal drawLine
	
	li $a0, 2581
	li $a1, 2583
	jal drawLine
	
	li $a0, 2604
	li $a1, 2606
	jal drawLine
	
	li $a0, 2645
	li $a1, 2647
	jal drawLine
	
	li $a0, 2668
	li $a1, 2670
	jal drawLine
	
	li $a0, 2710
	li $a1, 2711
	jal drawLine
	
	li $a0, 2733
	li $a1, 2734
	jal drawLine
	
	li $a0, 2799
	li $a1, 2800
	jal drawLine
	
	li $a0, 2862
	li $a1, 2864
	jal drawLine
	
	li $a0, 2904
	li $a1, 2906
	jal drawLine
	
	li $a0, 2969
	li $a1, 2989
	jal drawLine
	
	li $a0, 3033
	li $a1, 3053
	jal drawLine
	
	li $a0, 3098
	li $a1, 3118
	jal drawLine
	
	li $a0, 3163
	li $a1, 3182
	jal drawLine
	
	li $a0, 3227
	li $a1, 3246
	jal drawLine
	
	li $a0, 3291
	li $a1, 3310
	jal drawLine
	
	li $a0, 3355
	li $a1, 3375
	jal drawLine
	
	li $a0, 3419
	li $a1, 3440
	jal drawLine
	
	li $a0, 3483
	li $a1, 3502
	jal drawLine
	
	li $a0, 3547
	li $a1, 3566
	jal drawLine
	
	li $a0, 3611
	li $a1, 3629
	jal drawLine
	
	li $a0, 3676
	li $a1, 3693
	jal drawLine
	
	li $a0, 3741
	li $a1, 3757
	jal drawLine
	
	li $a0, 3805
	li $a1, 3821
	jal drawLine
	
	li $a0, 3870
	li $a1, 3884
	jal drawLine
	
	li $a0, 3935
	li $a1, 3947
	jal drawLine
	
	li $a0, 4000
	li $a1, 4010
	jal drawLine
	
	li $a0, 4065
	li $a1, 4074
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
parrotSF: #data for spring and fall
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a0, 832
	li $a1, 835
	jal drawLine
	
	li $a0, 896
	li $a1, 900
	jal drawLine
	
	li $a0, 961
	li $a1, 965
	jal drawLine
	
	li $a0, 1025
	li $a1, 1030
	jal drawLine
	
	li $a0, 1090
	li $a1, 1095
	jal drawLine
	
	li $a0, 1154
	li $a1, 1159
	jal drawLine
	
	li $a0, 1219
	li $a1, 1224
	jal drawLine
	
	li $a0, 1284
	li $a1, 1289
	jal drawLine
	
	li $a0, 1349
	li $a1, 1353
	jal drawLine
	
	li $a0, 1413
	li $a1, 1418
	jal drawLine
	
	li $a0, 1478
	li $a1, 1482
	jal drawLine
	
	li $a0, 1542
	li $a1, 1547
	jal drawLine
	
	li $a0, 1606
	li $a1, 1612
	jal drawLine
	
	li $a0, 1670
	li $a1, 1676
	jal drawLine
	
	li $a0, 1735
	li $a1, 1741
	jal drawLine
	
	li $a0, 1800
	li $a1, 1806
	jal drawLine
	
	li $a0, 1865
	li $a1, 1872
	jal drawLine
	
	li $a0, 1930
	li $a1, 1938
	jal drawLine
	
	li $a0, 1995
	li $a1, 2021
	jal drawLine
	
	li $a0, 2059
	li $a1, 2085
	jal drawLine
	
	li $a0, 2059
	li $a1, 2085
	jal drawLine
	
	li $a0, 2124
	li $a1, 2149
	jal drawLine
	
	li $a0, 2189
	li $a1, 2213
	jal drawLine
	
	li $a0, 2254
	li $a1, 2277
	jal drawLine
	
	li $a0, 2319
	li $a1, 2341
	jal drawLine
	
	li $a0, 2384
	li $a1, 2405
	jal drawLine
	
	li $a0, 2449
	li $a1, 2469
	jal drawLine
	
	li $a0, 2514
	li $a1, 2533
	jal drawLine
	
	li $a0, 2579
	li $a1, 2597
	jal drawLine
	
	li $a0, 2644
	li $a1, 2661
	jal drawLine
	
	li $a0, 2709
	li $a1, 2725
	jal drawLine
	
	li $a0, 2774
	li $a1, 2789
	jal drawLine
	
	li $a0, 2839
	li $a1, 2853
	jal drawLine

	li $a0, 2904
	li $a1, 2917
	jal drawLine
	
	li $a0, 2969
	li $a1, 2981
	jal drawLine
	
	li $a0, 3034
	li $a1, 3045
	jal drawLine
	
	li $a0, 3099
	li $a1, 3109
	jal drawLine
	
	li $a0, 3163
	li $a1, 3173
	jal drawLine
	
	li $a0, 3227
	li $a1, 3237
	jal drawLine
	
	li $a0, 3291
	li $a1, 3301
	jal drawLine
	
	li $a0, 3355
	li $a1, 3365
	jal drawLine
	
	li $a0, 3420
	li $a1, 3429
	jal drawLine
	
	li $a0, 3485
	li $a1, 3493
	jal drawLine
	
	li $a0, 3550
	li $a1, 3557
	jal drawLine
	
	li $a0, 3615
	li $a1, 3621
	jal drawLine
	
	li $a0, 3680
	li $a1, 3685
	jal drawLine
	
	li $a0, 3745
	li $a1, 3749
	jal drawLine
	
	li $a0, 3810
	li $a1, 3813
	jal drawLine
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra
	
	
parrotW: #data for winter
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, winter
	
	li $a0, 512
	li $a1, 516
	jal drawLine
	
	li $a0, 576
	li $a1, 582
	jal drawLine
	
	li $a0, 640
	li $a1, 647
	jal drawLine
	
	li $a0, 704
	li $a1, 712
	jal drawLine
	
	li $a0, 768
	li $a1, 777
	jal drawLine
	
	li $a0, 833
	li $a1, 841
	jal drawLine
	
	li $a0, 899
	li $a1, 906
	jal drawLine
	
	li $a0, 964
	li $a1, 971
	jal drawLine
	
	li $a0, 1029
	li $a1, 1036
	jal drawLine
	
	li $a0, 1094
	li $a1, 1101
	jal drawLine
	
	li $a0, 1159
	li $a1, 1166
	jal drawLine
	
	li $a0, 1223
	li $a1, 1230
	jal drawLine
	
	li $a0, 1288
	li $a1, 1295
	jal drawLine
	
	li $a0, 1352
	li $a1, 1360
	jal drawLine
	
	li $a0, 1417
	li $a1, 1425
	jal drawLine
	
	li $a0, 1431
	li $a1, 1440
	jal drawLine
	
	li $a0, 1482
	li $a1, 1506
	jal drawLine
	
	li $a0, 1546
	li $a1, 1571
	jal drawLine
	
	li $a0, 1611
	li $a1, 1636
	jal drawLine
	
	li $a0, 1676
	li $a1, 1701
	jal drawLine
	
	li $a0, 1741
	li $a1, 1765
	jal drawLine
	
	li $a0, 1808
	li $a1, 1819
	jal drawLine
	
	li $a0, 1824
	li $a1, 1829
	jal drawLine
	
	li $a0, 1873
	li $a1, 1881
	jal drawLine
	
	li $a0, 1889
	li $a1, 1893
	jal drawLine
	
	li $a0, 1938
	li $a1, 1943
	jal drawLine
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

parrotS: #data for summer
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $a2, summer
	
	li $a0, 3875 
	li $a1, 3881
	jal drawLine
	
	li $a0, 3939 
	li $a1, 3945
	jal drawLine
	
	li $a0, 4003 
	li $a1, 4009
	jal drawLine
	
	li $a0, 4067 
	li $a1, 4073
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