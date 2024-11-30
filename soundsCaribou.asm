.text

# Instrument and volume setup
li $a2, 10       # instrument
li $a3, 60       # medium volume 

bubble_sound:
    li $a0, 48   # Note: C3 (Lower C)
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall

    # delay 
    li $a1, 300  # Pause for 300 ms
    li $v0, 33
    syscall

    li $a0, 52   # Note: E3
    li $a1, 100  # Duration: 400 ms
    li $v0, 33
    syscall

 
    li $a0, 55   # Note: G3
    li $a1, 150  # Duration: 450 ms
    li $v0, 33
    syscall

    # delay
    li $a1, 200  # Longer pause between bubble sets (500 ms)
    li $v0, 33
    syscall

    # Loop back 
    j bubble_sound

# Exit program 
li $v0, 10
