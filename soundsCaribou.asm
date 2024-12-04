.text
.globl soundsCaribou

soundsCaribou: 
	subi $sp, $sp, 4
	sw $ra, 0($sp)

# Instrument and volume setup
li $a2, 10       # instrument
li $a3, 60       # medium volume 

# jingle bells (chorus + 1 verse )
    li $a0, 64   # Note: E 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E 
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
    
# rest
    li $a0 95    	#rest for 1/8 second
    li $v0 32    
    syscall        	#do it
    
# jingle bells
    li $a0, 64   # Note: E 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E 
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
   
 # jingle all the way
    li $a0, 64   # Note: E 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 60   # Note: C 
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D 
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E 
    li $a1, 300  # Duration: 500 ms 
    li $v0, 33
    syscall
    
 # oh what fun 
    li $a0, 65   # Note: F
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 300  # Duration: 500 ms 
    li $v0, 33
    syscall
    
# it is to ride
    li $a0, 65   # Note: F
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
 # in a 
    li $a0, 64   # Note: E
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 64   # Note: E
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
	
# one horse open sleigh
    li $a0, 64   # Note: E 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D 
    li $a1, 150  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 64   # Note: E 
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D 
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 67   # Note: G 
    li $a1, 300  # Duration: 500 ms 
    li $v0, 33
    syscall
    
  	lw $ra, 0($sp)
	addi $sp, $sp, 4

	jr $ra

# Exit program 
#li $v0, 10
#syscall 
