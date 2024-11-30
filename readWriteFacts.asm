.data 

buffer: 		.space 1000

prompt_facts: 		.asciiz "\nFacts about " 
choose_animal: 		.asciiz "Please choose an animal to view (1- caribou, 2-turtle, 3-parrot): "

caribou: 		.asciiz "Caribou: \n"
parrot: 		.asciiz "Parrots: \n"
turtle: 		.asciiz "Turtles: \n"


caribou_file_path: 	.asciiz "/Users/edenmese/Desktop/Ohlone/2024-2025/CS118_Intro to Assembly Language/Labs/team-projects-fall-2024-pie/caribouFacts.txt"
turtle_file_path: 	.asciiz "/Users/edenmese/Desktop/Ohlone/2024-2025/CS118_Intro to Assembly Language/Labs/team-projects-fall-2024-pie/turtleFacts.txt"
parrot_file_path: 	.asciiz "/Users/edenmese/Desktop/Ohlone/2024-2025/CS118_Intro to Assembly Language/Labs/team-projects-fall-2024-pie/parrotFacts"


prompt_edit: 		.asciiz "\nEdit a fact about this animal? (1 - Yes / 2 - No): "
invalid_choice:		.asciiz "Please enter a valid number"
write_fact:		.asciiz "Please write in your fact: "





.text 

main:
	li $t0, 1		# caribou 
	li $t1, 2		# turtle
	li $t2, 3		# parrot
			
# delete this later (fill in code for main)
	li $v0, 4
	la $a0, choose_animal
	syscall  

	li $v0, 5
	syscall
	
	move $a3, $v0 
# delete this after ^^
	beq $a3, $t0, caribou_path
	beq $a3, $t1, turtle_path
	beq $a3, $t2, parrot_path
	
caribou_path: 
	la $t4, caribou_file_path
	la $t3, caribou 
	
	j print_facts
	
turtle_path: 
	la $t4, turtle_file_path
	la $t3, turtle
	
	j print_facts
	
parrot_path: 
	la $t4, parrot_file_path
	la $t3, parrot
	
	j print_facts

print_facts: 
	li $v0, 4				# prompt for text "facts about "
	la $a0, prompt_facts
	syscall 
	
	move $a0, $t3				# move animal text into a0
	
	li $v0, 4				# print animal text 
	syscall 
	
	move $a0, $t4				# move animal file path into a0 
	la $a1, buffer				# load buffer
	jal read_file 				# jump and link to read_file
	
	li $v0, 4				# read in buffer
	la $a0, buffer
	syscall 
	
	jal edit_or_not
	
	li $v0, 10			# exit safely
	syscall  
	
edit_or_not: 
	li $v0, 4			# prompt to edit facts 
	la $a0, prompt_edit
	syscall 

	li $v0, 5			# yes/no
	syscall 
	
	li $t0, 1			# load 1
	li $t1, 2			# load 2
	move $t2, $v0
		
	beq $t2, $t0, yes_edit 
	beq $t2, $t1, no_edit
	
invalid_edit_choice: 
	li $v0, 4
	la $a0, invalid_choice
	syscall 
	
	j edit_or_not


# figure out write code
yes_edit:
    # Prompt the user to write the fact
    li $v0, 4              # syscall for print_string
    la $a0, write_fact     # address of the prompt
    syscall

    # Read the user's input
    li $v0, 8              # syscall for read_string
    la $a0, buffer         # address of the buffer to store input
    li $a1, 999            # maximum number of characters
    syscall

    # Open the file in append mode
    li $v0, 13             # syscall for open file
    move $a0, $t4          # filename (animal file path)
    li $a1, 9              # flags: O_WRONLY (1) | O_APPEND (8) = 9
    li $a2, 0              # mode (not used here)
    syscall
    move $s3, $v0          # store file descriptor

    # Calculate the length of the user's input
    la $a0, buffer         # address of the input string
    jal strlen             # call strlen function
    move $t0, $v0          # length of the input string

    # Write the user's input to the file
    li $v0, 15             # syscall for write to file
    move $a0, $s3          # file descriptor
    la $a1, buffer         # address of the input string
    move $a2, $t0          # length of the input string
    syscall

    # Close the file
    li $v0, 16             # syscall for close file
    move $a0, $s3          # file descriptor
    syscall

    # Re-read the updated file and print it
    move $a0, $t4          # filename (animal file path)
    la $a1, buffer         # buffer to store file content
    jal read_file          # call read_file function

    # Print the updated facts to the user
    li $v0, 4              # syscall for print_string
    la $a0, buffer         # address of the updated content
    syscall

    jr $ra                 # return from yes_edit

# Helper function to calculate the length of a string
strlen:
    move $t1, $a0          # $t1 points to the start of the string
    li $v0, 0              # initialize length to 0

strlen_loop:
    lb $t2, 0($t1)         # load byte from string
    beq $t2, $zero, strlen_done # if null terminator, end loop
    addi $v0, $v0, 1       # increment length
    addi $t1, $t1, 1       # move to next character
    j strlen_loop

strlen_done:
    	jr $ra                 # return length in $v0
	
no_edit: 
	jr $ra 

read_file: 

	move $s0, $a0
	move $s1, $a1
	
	li $v0, 13
	move $a0, $s0
	li $a1, 0
	li $a2, 0 
	syscall 


	move $s3, $v0
	
	
	li $v0, 14
	move $a0, $s3
	move $a1, $s1
	li $a2, 999
	syscall 
	
	move $s4, $v0
	
	add $s5, $s4, $s1 
	sb $zero, 0 ($s5)
	
	li $v0, 16
	move $a0, $s3
	syscall 
	
	jr $ra
	
	
	
	
	
	
	
			


	
	
	
	
	
	
	 
	   
	
