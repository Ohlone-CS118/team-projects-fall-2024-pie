.text

# Instrument and volume setup
li $a2, 10       # instrument
li $a3, 60       # medium volume 

    li $a0, 62   # Note: D 
    li $a1, 130  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 130  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: Bb
    li $a1, 130  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: D 
    li $a1, 300  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: D 
    li $a1, 300  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: Bb
    li $a1, 230  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: D 
    li $a1, 230  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 130  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    
    
    
    
    
    
    
    
# Exit program 
li $v0, 10
syscall 
