# Find longest word in a string
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, string         # The address of the string
        addu       $v1, $zero, $a0     # The address of longest word

        ########################################################################
#  Write your code here
# NOTE: Don't print out the results! Automatic testing will get the final
#  value of $v1 and check if it is correct

	add	$s0 , $zero ,$zero	#TotalMax=0
	add	$s1 , $zero ,$zero	#Counter=0
	addi	$s2 , $zero ,32		#s2 einai 32
	addu 	$t9, $zero,$a0
#gia ka8e stoixeio tis protasis
loop1:
	lb	$a1 ,0($a0)		#diabazei to stoixeio tou a0 
	beq 	$a1, $zero ,loop2	#an to stoixeio einai '0'(telos) 
	beq 	$a1, $s2 ,loop2		#'h an to stoixeio einai 32(keno) tote elenkse h leksi eiani max(sto loop2)
	
		
	addi 	$s1 , $s1 ,1		#alliws auksanei ton counter kata 1
	addi 	$a0, $a0, 1		#kai psaxnei sto epomeno stoixeio
	j 	loop1			#epanalambanei tin diadikasia 

#otan teliwsei ka8e leksi
loop2:
	slt 	$t1 , $s1 , $s0
	beq	$t1 , $zero,loop3	#an to mikos counter einai meg tou mikous max antika8ista to max(sto loop3)

					#alliws
	beq 	$a1, $zero ,End		#an teliwse h protasi termatizei 
					#alliws sunexizei
	add 	$s1 , $zero , $zero	#midenizei ton counter
	addi 	$a0 , $a0, 1		#psaxnei sto epomeno stoixeio
	addu 	$t9, $zero,$a0
	j 	loop1			#epanalambanei tin diadikasia 

#an max<counter
loop3:
	add 	$s0 , $s1 , $zero	#bazei ston max(s0) ton counter(s1)
	addu    $v1, $zero, $t9 	#dixnei tin arxi tis leksis tou neou max soixeiou		
	
	
	beq 	$a1, $zero ,End		#an teliwse h protasi termatizei 
		
					#alliws	
	add	$s1 , $zero , $zero	#midenizei ton counter
	addi 	$a0, $a0, 1		#pigenei sto epomeno stoixeio
	j 	loop1

End:


        ########################################################################
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
string: .asciiz "small  equal long atTheEnd"

