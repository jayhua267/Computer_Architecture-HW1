.data
array: .word 9, 28, 63, 88, 52, 9, 75, 6, 26,7
range: .word 10 # range of the array
str1:     .string "The largest number in array of "
str2:     .string " is "

.text 
#s1 = Base address of current array 
#s2 = i
#s3 = Range of compare (10)
#t0 = Flag
#t1 = Current Address
main:
		la	s1, array  # s1 = base address of array
		add s2, x0, x0 # i = 0
		add t0, x0, x0 # define Flag
		lw 	s3, range # 
        jal ra,forloop # Jump-and-link to the 'forloop' label


        # Exit program
        li a7, 10
        ecall		

forloop:
		addi	s2, s2, 1		#i++
		lw 		t1,0(s1)		#t1 = next value of the array
		addi	s1, s1, 4		#update new position of the next address
#if - else+++++++++++++++++++++++++++++++++++++++++++++
		bge		t0, t1, then 	#if Flag >= A[i] jump to then
		add		t0, x0, t1		#else Flag = A[i]
		beq 	s2, s3, printResult	#if i = 10 => stop
		j 		forloop			#back to for loop
then:
		beq 	s2, s3, printResult	#if i = 10 => stop
		j		forloop			#else continue run for loop
printResult:
		la a0, str1
        li a7, 4
        ecall 
		mv a0, s3
        li a7, 1
        ecall
		la a0, str2
        li a7, 4
        ecall
        mv a0, t0
        li a7, 1
        ecall
        ret
	