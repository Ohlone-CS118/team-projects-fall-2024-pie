.data 
buffer: 		.space 2000		# buffer for file contents
input_buffer:		.space 1000		# buffer for input contents
result:			.space 3000		# buffer for final result to print ot txt file after editing

prompt_facts: 		.asciiz "\nFacts about " 
choose_animal: 		.asciiz "\nPlease choose an animal to view (1- caribou, 2-turtle, 3-parrot, 4 - exit): "

caribou: 		.asciiz "Caribou: \n"
parrot: 		.asciiz "Parrots: \n"
turtle: 		.asciiz "Turtles: \n"


caribou_file_path: 	.asciiz "/Users/edenmese/Desktop/Ohlone/2024-2025/CS118_Intro to Assembly Language/Labs/team-projects-fall-2024-pie/caribouFacts.txt"
turtle_file_path: 	.asciiz "/Users/edenmese/Desktop/Ohlone/2024-2025/CS118_Intro to Assembly Language/Labs/team-projects-fall-2024-pie/turtleFacts.txt"
parrot_file_path: 	.asciiz "/Users/edenmese/Desktop/Ohlone/2024-2025/CS118_Intro to Assembly Language/Labs/team-projects-fall-2024-pie/parrotFacts"


prompt_edit: 		.asciiz "\nEdit a fact about this animal? (1 - Yes / 2 - No): "
invalid_choice:		.asciiz "Please enter a valid number\n"
write_fact:		.asciiz "Please write in your fact: "

.text 

.globl WriteTo3

WriteTo3:
	#j main_loop
	subi $sp, $sp, 4
	sw $ra, 0($sp)
main_loop: 		
# delete this later (fill in code for main)
	#li $v0, 4
	#la $a0, choose_animal
	#syscall  

	#li $v0, 5
	#syscall
	#move $a3, $v0 
# delete this after ^^

	# users choie
	
	li $t0, 1		# caribou 
	li $t1, 2		# turtle
	li $t2, 3		# parrot
	li $t3, 4		# exit

	beq $a3, $t0, caribou_path
	beq $a3, $t1, turtle_path
	beq $a3, $t2, parrot_path
	beq $a3, $t3, exit_program 
	
invalid_menu_choice: 
	li $v0, 4
	la $a0, invalid_choice 
	syscall 
	j main_loop
	
caribou_path: 
	la $t4, caribou_file_path	# t4 = file path 
	la $t5, caribou 		# t5= animal name
	j print_facts
	
	#j main_loop
turtle_path: 
	la $t4, turtle_file_path
	la $t5, turtle
	j print_facts
	
	#j main_loop
parrot_path: 
	la $t4, parrot_file_path
	la $t5, parrot
	#j print_facts
	
	#j main_loop

print_facts: 
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $v0, 4				# prompt for text "facts about "
	la $a0, prompt_facts
	syscall 
	
	# print animal name
	move $a0, $t5				# move animal text into a0
	li $v0, 4				# print animal text 
	syscall 
	
	
	# read & display facts
	move $a0, $t4				# move animal file path into a0 
	la $a1, buffer				# load buffer
	jal read_file 				# jump and link to read_file
	
	# print file content
	li $v0, 4				# read in buffer
	la $a0, buffer
	syscall 
	
	# ask if user wants to edit
	jal edit_or_not
	
	#j main_loop
	
	
	
	#jr $ra
	
exit_program: 

	lw $ra, 0($sp)
	addi $sp, $sp, 4

	jr $ra
	
# appends new facts user enters to previous ones in file
appendFact:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	la $s0, buffer				# load addresses of old facts, new facts, and buffer to hold result
	la $s1, input_buffer
	la $s2, result
copy_buffer:
	lb $s3,	0($s0)		# load byte from buffer
	beqz $s3, copy_input	# if null copy input
	sb $s3, 0($s2)		# store byte into result
	addi $s0, $s0, 1	# increment to next byte in buffer
	addi $s2, $s2, 1	# increment to next byte in result
	j copy_buffer
copy_input:
	lb $s3,	0($s1)		# load byte from buffer
	beqz $s3, end_copy	# if null copy input
	sb $s3, 0($s2)		# store byte into result
	addi $s1, $s1, 1	# increment to next byte in buffer
	addi $s2, $s2, 1	# increment to next byte in result
	j copy_input
end_copy:
	sb $zero, 0($s2)	# append null terminating char
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
# User can choose to edit fun facts or not
edit_or_not: 
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $v0, 4			# prompt to edit facts 
	la $a0, prompt_edit
	syscall 

	li $v0, 5			# yes/no
	syscall 
	move $t6, $v0
	
	li $t0, 1			# option 1: yes
	li $t1, 2			# option 2: no 

		
	beq $t6, $t0, yes_edit 
	beq $t6, $t1, no_edit
	
invalid_edit_choice: 
	li $v0, 4
	la $a0, invalid_choice
	syscall 
	
	j edit_or_not


# figure out write code
yes_edit: 
	# check if existing file has new line - if not add new line
	move $a0, $t4			# file name into a0
	la $a1, buffer			# buffer to store file
	jal read_file 			# call read_file
	
	#   buffer contains updated txtfile 'hello\0' with null terminator
	
	la $a0, buffer  
	jal check_last_char
	beqz $v0, add_newline
	
	j write_fact_label
	
add_newline:
	la $a0, buffer			# address of buffer
	jal strlen 			# get current len of buffer 'hello\0'
	move $t7, $v0			# len to t7
	add $t8, $a0, $t7		# t8 = buffer + len
	li $t9, 10
	sb $t9, 0($t8)			# store newline at teh end 'hello\n\0'
	addi $t7, $t7, 1		# len + 1 for newline 

write_fact_label: 
	li $v0, 4			# prompt user to write fact
	la $a0, write_fact
	syscall 
	
	li $v0, 8			# syscall read string
	la $a0, input_buffer 		# store input in buffer
	li $a1, 999
	syscall 
	
	# trim newline charachter
	la $a0, input_buffer
	jal trim 
	
	# append a newline char to input 'fun\n'
	add $t8, $a0, $t7	# t8 = buffer + len
	li $t9, 10
	sb $t9, 0($t8)		# store newline char at the end
	addi $t7, $t7, 1	# increment len to include newline
	# append trimmed input + buffer
	jal appendFact		# add new fact to old facts, $s4 will hold address of buffer with result
	
	# calculate len of result 'fun\0'
	la $a0, result		# address of result
	jal strlen 
	move $t7, $v0 			# store length of input
	
	# append input buffer to txt file
	li $v0, 13		# syscall to open file
	move $a0, $t4		# filepath in a0  
	li $a1, 1		# flag : append
	li $a2, 0
	syscall 
	move $s3, $v0 		# file descriptor
	
	 # write users input to file
	 li $v0, 15			# syscall write to file
	 move $a0, $s3			# file descriptor to a0
	 la $a1, result			# buffer with user input 
	 move $a2, $t7			# length of input
	 syscall  
	 
	 # close file
	 li $v0, 16
	 move $a0, $s3
	 syscall 
	 
	 # re read updated file
	 move $a0, $t4		# filename to read
	 la $a1, buffer		# buffer to store file content 
	 jal read_file 		# read_file(filename,buffer)
	 
	 # print updated file # there is an error here when reading the buffer
	 li $v0, 4
	 la $a0, buffer
	 syscall 
	
no_edit: 
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra 

# Preconditions:
#   $a0 - Address of the file path (null-terminated string).
#   $a1 - Address of the buffer where the file contents will be stored.
#
# Postconditions:
#   The file contents are loaded into the buffer pointed to by $a1.
#   The buffer is null-terminated at the end of the read content.
#   If the file cannot be opened or read, appropriate system behavior will occur.

read_file: 
	subi $sp, $sp, 4
	sw $ra, 0($sp)
    # Save input values into saved registers
    move $s0, $a0            # Save file path address from $a0 into $s0
    move $s1, $a1            # Save buffer address from $a1 into $s1
    
    # Open the file
    li $v0, 13               # Syscall 13: Open file
    move $a0, $s0            # File path (source address) from $s0
    li $a1, 0                # Flags: O_RDONLY (read-only mode)
    li $a2, 0                # Mode (not used here)
    syscall                  # Perform the system call
    move $s3, $v0            # Store file descriptor in $s3

    # Read file contents
    li $v0, 14               # Syscall 14: Read file
    move $a0, $s3            # File descriptor
    move $a1, $s1            # Buffer address for reading file content
    li $a2, 1999             # Maximum number of bytes to read (leaving room for null terminator)
    syscall                  # Perform the read system call
    move $s4, $v0            # Store the number of bytes read into $s4

    # Null-terminate the buffer
    add $s5, $s4, $s1        # Calculate the address of the null terminator: buffer start + bytes read
    sb $zero, 0($s5)         # Store a null terminator at the calculated address

    # Close the file
    li $v0, 16               # Syscall 16: Close file
    move $a0, $s3            # File descriptor to close
    syscall                  # Perform the close system call
    
	lw $ra, 0($sp)
	addi $sp, $sp, 4
    # Return to caller
    jr $ra                   # Return to the calling function
	
	
# strlen: calculate the length of a null terminated string 
# preconditions: 
#	a0 - address of the string
# postconditions: 
# v0 - length of the string 

strlen: 
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	move $t0, $a0		# pointer to string
	li $v0, 0		# counter for length 
	
strlen_loop: 
	lb $t1, 0($t0)		# load byte from string where t0 points
	beqz $t1, strlen_done	# if null terminator, end_loop 
	addi $v0, $v0, 1	# increment length couunter
	addi $t0, $t0, 1	# move to next charactar
	j strlen_loop 
	
strlen_done:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra 



# preconditions: a0 - address of string
# output: modified string in buffer (newline replaced with '\0')
trim:
	subi $sp, $sp, 4
	sw $ra, 0($sp)

    move $t0, $a0            # Pointer to start of the string
trim_loop:
    lb $t1, 0($t0)           # Load current character
    li $t2, 10               # ASCII value of newline ('\n')
    beq $t1, $t2, trim_done  # If newline, replace with '\0'
    beqz $t1, trim_end       # If end of string (null terminator), done
    addi $t0, $t0, 1         # Move to next character
    j trim_loop

trim_done:
    sb $zero, 0($t0)         # Replace newline with null terminator
trim_end:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
    jr $ra                   # Return
	
# error here: 1 - check_done jr ra will leave me in a loop between check_last_char
# 	      2 - when reading the file it shows that the buffer is empty when not true 
# check if last char in buffer is newline
	# input: a0 - address of buffer
	# output: v0 - 1 if last charactar is a new line otherwise 0 
check_last_char: 
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	la $t0, buffer			# start of the buffer
	jal strlen			# len of string
	move $t1, $v0			# store len in t1
	beqz $t1, check_done		# if buffer empty, return 0
	
	add $t2, $t0, $t1		# t2 = buffer = len 
	addi $t2, $t2, -1		# move to a last char
	lb $t3, 0($t2)			# load last char into t3
	li $t5, 10			# ascii for '\n'
	beq $t3, $t5, is_newline	# if newline return 1
	li $v0, 0 			# not newline
	jr $ra
	
is_newline:
	li $v0, 1
	jr $ra

check_done:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	li $v0, 0 			# buffer empty
	jr $ra
