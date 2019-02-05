.data 
buffer: .space 256
file: .asciiz "input_hw1.txt"

.text
main:
	jal openReadFromFile
	
	la $a0, buffer
	jal alterString
	
	li $v0, 10      # Finish the Program
	syscall
	
alterString:
	la $s0, ($a0) # Set temporary register to first string adress

	# Save caller return ad
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	addi $s1, $zero, 0 # loop counter variable i
	stringIterator:
		add $t1, $s0, $s1 # index of char in string
		lb $t2, ($t1)
		beqz $t2, endIterator # String end condition
		
		# Check if number
		li $t3, '0'
		blt $t2, $t3, print
		li $t3, '9'
		bgt $t2, $t3, print
		
		# If number, check if number is convertible or not
		add $a0, $zero, $t1
		add $a1, $zero, $s1
		jal checkIfConvert
		add $s1, $s1, $v0
		beqz $v0, next
		add $a0, $zero, $t1
		add $a1, $zero, $v0
		jal printInteger

		j next
		
	print:	add $a0, $zero, $t2 # Set Argument 0 character value for syscall
		jal printChar
		
	next:	addi $s1, $s1, 1 # loop counter increment
		j stringIterator
	endIterator:
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
printInteger:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $t1, $zero, 0
	add $t2, $zero, $a0
	integerLoop:
		bgt $t1, $a1, endIntegerLoop
		lb $a0, ($t2)
		jal printChar
		addi $t2, $t2, 1
		addi $t1, $t1, 1
		j integerLoop
	endIntegerLoop:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
checkIfConvert:
	addi $sp, $sp, -16
	sw $ra, 12($sp)
	sw $t1, 8($sp)
	sw $t2, 4($sp)
	sw $t3, 0($sp)
	
	addi $s2, $zero, 1
	add $s3, $zero, $a0
	addi $v0, $zero, 0
	numberIterator:
		addi $s3, $s3, 1
		lb $t1, ($s3) # Load next char to check if its number or not.
		li $t3, '0'
		blt $t1, $t3, convert
		li $t3, '9'
		bgt $t1, $t3, convert
		addi $v0, $v0, 1
		
		j numberIterator
	
	convert:
	bnez $v0, abortConvert
	add $t7, $zero, $a0
	
	li $t3, '.'
	lb $t1, -1($t7)
	beq $t1, $t3, decimal
	lb $t1, 1($t7)
	bne $t1, $t3, notDecimal
	lb $t1, 2($t7)
	li $t3, '0'
	blt $t1, $t3, notDecimal
	li $t3, '9'
	bgt $t1, $t3, notDecimal
decimal:	addi $v0, $v0, 1
	j abortConvert
	notDecimal:
	lb $a0, ($a0) # Load number to arg register for function call
	add $t6, $zero, $a1
	li $a1, 0 # Load 0 to arg register to check if its sentence beginning or not
	beqz $t6, resumeConvert
	li $a1, 1
	addi $t7, $t7, -1
	lb $t4, ($t7) # Char before number
	addi $t7, $t7, -1
	lb $t5, ($t7) # Char before that
	li $t3, ' '
	bne $t4, $t3, resumeConvert
	li $t3, '.'
	bne $t5, $t3, resumeConvert
	li $a1, 0
	resumeConvert:
	jal convertDigit
	addi $v0, $zero, 0
	
	abortConvert:
	lw $t3, 0($sp)
	lw $t2, 4($sp)
	lw $t1, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	jr $ra
	
convertDigit:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $t1, '0'
	beq $a0, $t1, zero
	li $t1, '1'
	beq $a0, $t1, one
	li $t1, '2'
	beq $a0, $t1, two
	li $t1, '3'
	beq $a0, $t1, three
	li $t1, '4'
	beq $a0, $t1, four
	li $t1, '5'
	beq $a0, $t1, five
	li $t1, '6'
	beq $a0, $t1, six
	li $t1, '7'
	beq $a0, $t1, seven
	li $t1, '8'
	beq $a0, $t1, eight
	li $t1, '9'
	beq $a0, $t1, nine
	
	zero:	
	li $a0, 'Z'
	beqz $a1, resumeZero
	li $a0, 'z'
	resumeZero: jal printChar
	li $a0, 'e'
	jal printChar
	li $a0, 'r'
	jal printChar
	li $a0, 'o'
	jal printChar	
	j exitCD
	
	one:	
	li $a0, 'O'
	beqz $a1, resumeOne
	li $a0, 'o'
	resumeOne: jal printChar
	li $a0, 'n'
	jal printChar
	li $a0, 'e'
	jal printChar
	j exitCD
	
	two:
	li $a0, 'T'
	beqz $a1, resumeTwo
	li $a0, 't'
	resumeTwo: jal printChar
	li $a0, 'w'
	jal printChar
	li $a0, 'o'
	jal printChar
	j exitCD
	
	three:
	li $a0, 'T'
	beqz $a1, resumeThree
	li $a0, 't'
	resumeThree: jal printChar
	li $a0, 'h'
	jal printChar
	li $a0, 'r'
	jal printChar
	li $a0, 'e'
	jal printChar
	jal printChar
	j exitCD
	
	four:
	li $a0, 'F'
	beqz $a1, resumeFour
	li $a0, 'f'
	resumeFour: jal printChar
	li $a0, 'o'
	jal printChar
	li $a0, 'u'
	jal printChar
	li $a0, 'r'
	jal printChar
	j exitCD
	
	five:
	li $a0, 'F'
	beqz $a1, resumeFive
	li $a0, 'f'
	resumeFive: jal printChar
	li $a0, 'i'
	jal printChar
	li $a0, 'v'
	jal printChar
	li $a0, 'e'
	jal printChar
	j exitCD
	
	six:
	li $a0, 'S'
	beqz $a1, resumeSix
	li $a0, 's'
	resumeSix: jal printChar
	li $a0, 'i'
	jal printChar
	li $a0, 'x'
	jal printChar
	j exitCD
	
	seven:
	li $a0, 'S'
	beqz $a1, resumeSeven
	li $a0, 's'
	resumeSeven: jal printChar
	li $a0, 'e'
	jal printChar
	li $a0, 'v'
	jal printChar
	li $a0, 'e'
	jal printChar
	li $a0, 'n'
	jal printChar
	j exitCD
	
	eight:
	li $a0, 'E'
	beqz $a1, resumeEight
	li $a0, 'e'
	resumeEight: jal printChar
	li $a0, 'i'
	jal printChar
	li $a0, 'g'
	jal printChar
	li $a0, 'h'
	jal printChar
	li $a0, 't'
	jal printChar
	j exitCD
	
	nine:
	li $a0, 'N'
	beqz $a1, resumeNine
	li $a0, 'n'
	resumeNine: jal printChar
	li $a0, 'i'
	jal printChar
	li $a0, 'n'
	jal printChar
	li $a0, 'e'
	jal printChar
	j exitCD
	
	exitCD:	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
printChar:
	li $v0, 11
	syscall
	jr $ra
	
openReadFromFile:
 	li   $v0, 13          # system call for open file
	la   $a0, file      # input file name
	li   $a1, 0           # flag for reading
	syscall               # open a file 
	move $s0, $v0
	
	li   $v0, 14 # Read File Operator

	# Function arguments
	move $a0, $s0
	la   $a1, buffer
	li   $a2,  256
	syscall
	
	jr $ra
