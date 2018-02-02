# Perfect num

    .data
Begin:      .asciiz "n = "
True:       .asciiz "perfect num"
False:      .asciiz "not perfect num"
Newline:    .asciiz "\n"

    .text

    .globl main 
main:
    # begin
    li		$v0, 4		# $v0 = 4
    la		$a0, Begin	# load Begin
    syscall

    # get n input
    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t0, $v0	# n

    # loop ready
    li		$t1, 0		# i = 0
    li		$t2, 0		# sum = 0

loop:
    addi	$t1, $t1, 1		# i = i + 1
    
    beq		$t1, $t0, out	# if i == n then out
    div		$t0, $t1		# n / i
    mfhi	$t3				# $t3 = $t0 mod $t1 
    beq		$t3, 0, sum	    # if $t3 == 0 then sum
    j		loop			# jump to loop

sum:
    add		$t2, $t2, $t1	# sum = sum + i
    j		loop			# jump to loop

out:
    # \n
    li		$v0, 4		# $v0 = 1
    la		$a0, Newline		
    syscall

    # bool
    beq		$t2, $t0, bt	# if sum == n then bt
    bne		$t2, $t0, bf	# if $t2 != $t0 then bf

bt:
    li		$v0, 4		# $v0 = 1
    la		$a0, True		# load address True
    syscall
    j		exit			# jump to exit

bf:
    li		$v0, 4		# $v0 = 1
    la 	    $a0, False		# load address False
    syscall
    j		exit			# jump to exit

exit:
    li		$v0, 10		# $v0 = 10
    syscall
