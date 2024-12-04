.text

# Instrument and volume setup
li $a2, 23       # instrument
li $a3, 60       # medium volume 


# the chicken dance - parrots
# F F(-12) F F(-12) FFGGDDF(longer) FFGGDDF(long) FFGGBbBbA(long) rest EbEbFF C4C4Eb(long) EbEb FFCCEb(long) EbEbFFGGF(long)
    li $a0, 65   # Note: F
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 53   # Note: F
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 53   # Note: F
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
     li $a0, 65   # Note: F
    li $a1, 200  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 53   # Note: F
    li $a1, 500  # Duration: 500 ms 
    li $v0, 33
    syscall
    
   # round 1 FFGGDDF(longer)
    
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
  
    # Round 2 FFGGDDF(longer)
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 62   # Note: D
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 250  # Duration: 250 ms 
    li $v0, 33
    syscall
    
    
   # FFGGBbBbA(long)
    li $a0, 65   # Note: F
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: Bb
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: Bb
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 69   # Note: A
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
    

    # rest
    li $a0 95    	#rest for 1/8 second
    li $v0 32    
    syscall        	#do it
    
    
    
   # EbEbFFC4C4Eb(long)
   
    li $a0, 63   # Note: Eb
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 63   # Note: Eb
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall 
   
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 60   # Note: C4
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 60   # Note: C4
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 63   # Note: Eb
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    
   # EbEbFFC4C4Eb(long)
   
    li $a0, 63   # Note: Eb
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 63   # Note: Eb
    li $a1, 70  # Duration: 500 ms 
    li $v0, 33
    syscall 
   
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 60   # Note: C4
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 60   # Note: C4
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 63   # Note: Eb
    li $a1, 250  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 63   # Note: Eb
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 63   # Note: Eb
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 65   # Note: F
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 67   # Note: G 
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 69   # Note: A
    li $a1, 55  # Duration: 500 ms 
    li $v0, 33
    syscall
    
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 60  # Duration: 500 ms 
    li $v0, 33
    syscall
    li $a0, 70   # Note: Bb
    li $a1, 700  # Duration: 500 ms 
    li $v0, 33
    syscall

    
    
# Exit program 
li $v0, 10
syscall 
