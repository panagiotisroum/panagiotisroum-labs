# Calculate the population count of an array
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 

main:
        # These are for providing input and testing, don't change in your
        #  final submission
        li    $v0, -1   # non-zero v0 to catch code dependent on zeroed regs

        li    $a0, 0xa5ca3695
        jal   popc
        addu  $s0, $v0, $zero   # Move the result to s0 for tester to check

        li    $a0, 0x0
        jal   popc
        addu  $s1, $v0, $zero   # Move the result to s1 for tester to check

        # Try it with an array
        la    $a0, array
        li    $a1, 4
        jal   sum_popc
        addu  $s2, $v0, $zero   # Move the result to s2 for tester to check

        # Try it with 1 item 
        la    $a0, array
        addi  $a0, $a0, 12
        li    $a1, 1
        jal   sum_popc
        addu  $s3, $v0, $zero   # Move the result to s3 for tester to check

        # ----- Try with 0
        la    $a0, array
        li    $a1, 0
        jal   sum_popc
        addu  $s4, $v0, $zero   # Move the result to s4 for tester to check


        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.

 
########################################################################
 #  Write your code here. Leave main as is.
########################################################################

popc:
	
	add 	$t1, $zero ,$zero	#o t1 einai o i
	addi 	$t2, $zero ,32		#o t2 einai 32
	add	$t6,$zero,$zero		#to sum einai 0
loop:
	
	andi	$t7, $a0,1		#o t7 eiani to teleutaio stoixeio 
	beq	$t7, $zero,skip		#an t7 einai 0 kan skip
	addiu 	$t6, $t6,1		#alliws kane sum+=1
skip:
	srl	$a0,$a0,1		#kanei aristeri olis8isi
	addi	$t1,$t1,1		#kai kanei i+=1
	bne	$t1,$t2,loop		#otan teliwsei to 32abito teliwse
	add	$v0,$zero,$t6	
        jr     $ra
	



#TREXEI SWSTA MEXRI ENA SIMIO KAI META PETAEI ERROR
sum_popc:

	add $v0,$zero,$zero
	beq $a1, $zero,end
	
	
	addi $sp,$sp,-8
	sw   $ra,4($sp)
	sw   $a0,0($sp)
	
	
	add $t5,$zero,$a0
	lw $a0,0($a0)
	
	jal popc
	
	addi $a0,$t5,4
	addi $a1,$a1,-1
	

	add  $v1,$v0,$v1
	jal sum_popc
	
end:
	

	lw   $a0,0($sp)
	lw   $ra,4($sp)
	addi $sp,$sp,8
	
	
	add  $v0,$v1,$zero
        jr    $ra

        

        

###############################################################################
# Data input.
###############################################################################
       .data
array: .word 0xa5ca3691, 0x5a3695ca, 0x36a9ca55, 0xc55a36a9
		#15	         16		16	      16     
