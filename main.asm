.data
	welcome:	.asciiz "Hello fellow Adventurer!\n"
	message:	.asciiz "We are PIE, and this is our Endangered Animal Migration Game.\nYou are going to be able to pick between 3 endangered animals, and learn more about them.\nIf you know anything about any of the animals feel free to add some fun facts,\nand share your knowledge witht the rest of the world!\n"
	choices:	.asciiz "\nPlease pick an animal.\n|-------------|---------------------------|---------------------------|\n| (1) Caribou | (2) Leatherback Sea Turle | (3) Orange Bellied Parrot |\n|-------------|---------------------------|---------------------------|"
	prompt:		.asciiz "\nEnter an integer from 1-3: "
	repeat:		.asciiz "\nPlease enter (1) to pick another animal or (0) to exit: "
	seasonChoices:	.asciiz "\nPlease pick a season.\n|-----------|-----------|-----------|-----------|\n|(1) Winter |(2) Spring |(3) Summer |(4) Autumn |\n|-----------|-----------|-----------|-----------|\n"
	seasonPrompt:	.asciiz "Enter an integer from 1-4: "
	invalid_choice:	.asciiz "Please enter a valid number\n"

.text
.globl main
main:
	li $v0, 4		# welcome the user
	la $a0, welcome
	syscall
	
	li $v0, 4		# print our groups mesage
	la $a0, message
	syscall
	
	move $fp, $sp		# set up stack
mainMenu:
	# set values for user options
	li $t0, 1
	li $t1, 2
	li $t2, 3
	li $t3, 4

	# display the 3 animal options (1,2,3)
	
	# prompt user to enter an integer from 1-3
	li $v0, 4
	la $a0, choices
	syscall
	
	li $v0, 4
	la $a0, prompt
	syscall
	
	# read integer from user
	li $v0, 5
	syscall
	move $a3, $v0		# store response
	
	# jump to correct option
	beq $a3, $t0, option1
	beq $a3, $t1, option2
	beq $a3, $t2, option3
# user selected animal 1
option1:
	jal animal1
	j loop
# user selected animal 2
option2:
	jal animal2
	j loop
# user selected animal 3
option3:
	jal animal3
loop:
	# prompt user to choose another animal or exit
	li $v0, 4
	la $a0, repeat
	syscall
	# repeat if choice == 1
	li $v0, 5
	syscall
	beq $v0, $t0, mainMenu
	beqz $v0, end
	
	li $v0, 4			# error checking
	la $a0, invalid_choice
	syscall 
	
	j loop
	
end:
	li $v0, 10	# exit safely
	syscall
	
# function for facts//seasons/graphics for first aniaml
animal1:
	subi $sp, $sp, 4
	sw $ra, 0($sp)

	# read file based on animal option
	# jal print caribou funfacts 
	#move $s5, $a3
	#jal soundsCaribou
	#move $a3,$s5
	jal Write2
	# print txt file
	#jal WriteTo3   
	
	jal pickSeason		# prompt user to pick a seaon
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
# function for facts//seasons/graphics for second aniaml
animal2:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	# read file based on animal option
	# jal print turtle fun facts
	#jal factMain
	jal Write2

	# print txt file
	#jal WriteTo3   
	jal pickSeason		# prompt user to pick a seaon
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# function for facts//seasons/graphics for third aniaml
animal3:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	# read file based on animal option

	# jal print parrot fun facts
	#jal factMain
	jal Write2
	# print txt file
	#jal WriteTo3   
	jal pickSeason		# prompt user to pick a seaon
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
# function that asks user for  the migration season to view
# precondition: $a3 ocntains animal option
pickSeason:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	# set values for user options
	li $t0, 1
	li $t1, 2
	li $t2, 3
	li $t3, 4
	
	li $v0, 4		# print season options for user
	la $a0, seasonChoices
	syscall
getSeason:
	li $v0, 4		# prompt user to enter option for season
	la $a0, seasonPrompt
	syscall
	
	li $v0, 5		# read integer from user
	syscall

	move $s0, $v0		# store choice
	
	beq $a3, $t0, caribouMigration		# branch to proper animal's migration data
	beq $a3, $t1, turtleMigration		
	beq $a3, $t2, parrotMigration	
	
# displays Caribou migration map based on season choice
caribouMigration:
	beq $s0, $t0, caribouWinter	# branch to proper season for caribou migration map
	beq $s0, $t1, caribouSpring
	beq $s0, $t2, caribouSummer
	beq $s0, $t3, caribouAutumn
	
	li $v0, 4			# error checking
	la $a0, invalid_choice
	syscall 
	
	j getSeason
	caribouWinter:
	# code to print Winter map for caribou
	j seasonEnd
	
	caribouSpring:
	# code to print Spring map for caribou
	j seasonEnd
	
	caribouSummer:
	# code to print Summer map for caribou
	j seasonEnd
	
	caribouAutumn:
	# code to print Autumnn map for caribou
	j seasonEnd	

# displays turtle migration map based on  season choice
turtleMigration:
	beq $s0, $t0, turtleWinter	# branch to proper season for turtle migration map
	beq $s0, $t1, turtleSpring
	beq $s0, $t2, turtleSummer
	beq $s0, $t3, turtleAutumn
	
	li $v0, 4			# error checking
	la $a0, invalid_choice
	syscall 
	
	j getSeason
	turtleWinter:
	# code to print Winter map for turtle
	j seasonEnd
	
	turtleSpring:
	# code to print Spring map for turtle
	j seasonEnd
	
	turtleSummer:
	# code to print Summer map for turtle
	j seasonEnd
	
	turtleAutumn:
	# code to print Autumnn map for turtle
	j seasonEnd
# displays parrot migration map based on season choice
parrotMigration:
	beq $s0, $t0, parrotWinter	# branch to proper season for parrot migration map
	beq $s0, $t1, parrotSpring
	beq $s0, $t2, parrotSummer
	beq $s0, $t3, parrotAutumn
	
	li $v0, 4			# error checking
	la $a0, invalid_choice
	syscall 
	
	j getSeason
	parrotWinter:
	# code to print Winter map for parrot
	j seasonEnd
	
	parrotSpring:
	# code to print Spring map for parrot
	j seasonEnd
	
	parrotSummer:
	# code to print Summer map for parrot
	j seasonEnd
	
	parrotAutumn:
	# code to print Autumnn map for parrot
seasonEnd:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
