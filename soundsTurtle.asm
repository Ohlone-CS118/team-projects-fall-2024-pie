.text

# Instrument and volume setup
li $a2, 10       # instrument
li $a3, 60       # medium volume 



# F A#/Bb, D, D, D ,C, D#/Eb, D, F, A#/Bb, A#/Bb, A#/Bb, A, C, A#/Bb 
    li $a0, 65   # Note: F
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: A#/Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    # F A#/Bb, D, D, D ,C, D#/Eb, D, F, A#/Bb, A#/Bb, A#/Bb, A, C, A#/Bb 

    li $a0, 60   # Note: C
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 63   # Note: D#/Eb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: A#/Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: A#/Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: A#/Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 69   # Note: A#/Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 60   # Note: A#/Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: A#/Bb
    li $a1, 100  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    
    
    
    
    
    
    
# Exit program 
li $v0, 10
syscall 
