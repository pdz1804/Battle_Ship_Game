# ---------------------------------------------------------------------------------------------------------------------------
# 2252621 - NGUYEN QUANG PHU
# ---------------------------------------------------------------------------------------------------------------------------
#                          #######      #########      ##                       ######        ###                                                           
#                          ##     ##        ##         ##                     ##      ##     ##  ##                                          
#                          ##     ##        ##         ##                    ##             #     ##                                        
#                          #######          ##         ##                    ##            ##########                                          
#                          ##     ##        ##         ##                    ##            ##      ##                                       
#                          ##     ##        ##         ##                     ##      ##   ##      ##                                         
#                          #######          ##         ########                 ######     ##      ##                                                       
# ---------------------------------------------------------------------------------------------------------------------------
#                                        #####         ######         #####       #####                                                                    
#                                      ##     ##     ##      ##     ##     ##   ##     ##                                                   
#                                     ##       ##    ##      ##    ##       ##         ##                                                  
#                                              ##    ##      ##            ##          ##                                                
#                                             ##     ##      ##           ##      #####                                                 
#                                            ##      ##      ##          ##            ##                                      
#                                          ##        ##      ##        ##              ##                                              
#                                        ##          ##      ##      ##         ##     ##                                                 
#                                     ############     ######      ###########    #####                                                                          
# ---------------------------------------------------------------------------------------------------------------------------
# MEMORY
# ---------------------------------------------------------------------------------------------------------------------------
.data
# Specify whose turn to play (0: player 1, 1: player 2)
whose_turn: 			.word		0

# SPECIFY GAME RULES
startRule: 			.asciiz		"THIS IS THE RULE FOR THE BATTLESHIP GAME.\n1. THE SETTING STAGE\n-  Player 1 takes the turn to place the ship.\n-  When Player 1 finishes placing the ships, Player 2 takes turn.\n-  Each Player has 3 ship 2x1, 2 ship 3x1, 1 ship 4x1.\n-  Enter the ship using the format this format:\n   <row_head> <col_head> <row_tail> <col_tail>\n-  Player can place any ship in any order (except that there is still enough to place).\n"
playRule:			.asciiz		"THIS IS THE RULE FOR THE BATTLESHIP GAME.\n2. THE HITTING TARGET STAGE\n-  Each player takes turn to place the hitting target.\n-  Player inputs the row of the target, then the column of the target.\n-  If Player hits the target before, Player is allowed to take another hit.\n-  If the target is MISS or HIT, swap the turn, other Player takes turn to play.\n"

# string output
# 106
divide1: 			.asciiz 	"#########################################################################################################\n"
divide2: 			.asciiz		"---------------------------------------------------------------------------------------------------------\n"
divide3:			.asciiz		"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
# 1
xuongdong: 			.asciiz		"\n"
xuongdong20:			.asciiz 	"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
xuongdong11:			.asciiz 	"\n\n\n\n\n\n\n\n\n\n\n"

# 106
outputGameStart:		.asciiz	 	"|                                          THE GAME STARTS!                                             |\n"
outputGameEnd:			.asciiz 	"|                                           THE GAME ENDS!                                              |\n"

# 24
outputPlayer1Board:		.asciiz		"This is player 1 board.\n"
outputPlayer2Board:		.asciiz	 	"This is player 2 board.\n"

# 106
startInitializeBoard:		.asciiz 	"|                                       START PLACE YOUR SHIP.                                          |\n"
endInitializeBoard:		.asciiz		"|                                        END PLACE YOUR SHIP.                                           |\n"
player1InputBoard:		.asciiz		"#                              Hello player 1, please place your ship!                                  #\n"
player2InputBoard: 		.asciiz		"#                              Hello player 2, please place your ship!                                  #\n"

# 26
inputRowOfHead:			.asciiz		"Input the row of head:    "
inputColOfHead:			.asciiz		"Input the column of head: "
inputRowOfTail: 		.asciiz		"Input the row of tail:    "
inputColOfTail:			.asciiz		"Input the column of tail: "

# 67
inputOverlap:			.asciiz		"The ship you input is overlapping. Please reinput.                \n"
shipInvalidSize:		.asciiz		"The ship you input has invalid size. Please reinput.              \n"
shipInvalidDirection:		.asciiz		"The ship you input must be horizontal or vertical. Please reinput.\n"
inputPlaceSize2:		.asciiz		"Success place ship of size 2.                                     \n"
inputPlaceSize3: 		.asciiz		"Success place ship of size 3.                                     \n"
inputPlaceSize4:		.asciiz		"Success place ship of size 4.                                     \n"
outOfSize2:			.asciiz		"There is no more ship of size 2! Please reinput.                  \n"
outOfSize3: 			.asciiz		"There is no more ship of size 3! Please reinput.                  \n"
outOfSize4:			.asciiz		"There is no more ship of size 4! Please reinput.                  \n"

# 106
player1Play:			.asciiz		"|                                        PLAYER 1 TAKES TURN.                                           |\n"
player2Play:			.asciiz		"|                                        PLAYER 2 TAKES TURN.                                           |\n"

# 34
enterShot:			.asciiz		"Enter the position for your shot.\n"

# 32
enterRow:			.asciiz		"Enter the row for your shot:    "
enterCol:			.asciiz		"Enter the column for your shot: "

# 42
hitBefore:			.asciiz		"You have hit this before. Please reinput.\n"

# 6
hitSuccess: 			.asciiz		"HIT! \n"
hitFail:			.asciiz		"MISS!\n"

# 106
player1Win: 			.asciiz		"#                                           PLAYER 1 WINS!                                              #\n"
player2Win:			.asciiz		"#                                           PLAYER 2 WINS!                                              #\n"

strDoubleSpace:			.asciiz		"  "
strSpace:			.asciiz		" "

# ADDING EXTRA THINGS FOR EASIER CHECK WHEN INPUT THE COORDINATE !!!!!!!!!!
strRemain2:			.asciiz		"The remaining ship of size 2 = "
strRemain3:			.asciiz		"size 3 = "
strRemain4:			.asciiz		"size 4 = "
strSemiSpace:			.asciiz		"; "

# ADDING NEW THINGS FOR INPUTTING A STRING AS COORDINATES
# 84
strInput: 			.asciiz		"Please input a string of coordinates (<row_head> <col_head> <row_tail> <col_tail>): "
				.align 		2
buffer: 			.space 		200
strError:			.asciiz		"Invalid input! Please input again!\n"
				.align 		2

# ADDING NEW THINGS FOR INPUTTING A STRING AS THE TARGET
targetInput:			.space 		200

# ADDING OUTSOURCE A FILE
file_out: 			.asciiz		"CA_output.txt"
char1:				.asciiz		"1"  # 49
char0:				.asciiz		"0"  # 48
charDash:			.asciiz 	"-"  # 45
charO:				.asciiz		"O"  # 79
charX:				.asciiz		"X"  # 88
charSpace:			.asciiz		" "  # 32
charNewLine:			.asciiz		"\n" # 10

# HELPING PRINT BOARD
stringLine1:			.asciiz		"     0   1   2   3   4   5   6\n"
stringLine2:			.asciiz		"    --- --- --- --- --- --- ---\n"
stringLine1_2:			.asciiz		"  --- --- --- --- --- --- ---  \n"
stringBlock:			.asciiz		" | "


				.align 		2
# THE BOARD OF 2 PLAYERS
player1Board:			.byte		'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0'

				.align 		2
player2Board:			.byte		'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0',
						'0', '0', '0', '0', '0', '0', '0'
				.align 		2
# THE VIEW OF THEM
player1View:			.byte		'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-'
				.align 		2
player2View:			.byte		'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-',
						'-', '-', '-', '-', '-', '-', '-'
# ---------------------------------------------------------------------------------------------------------------------------
# CODE
# ---------------------------------------------------------------------------------------------------------------------------
# MAIN FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
.text
main:
jal setupBoard
jal playGame
j exit
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# SET UP BOARD FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# NEW: s2, s3, s4, store current number of ships of size 2 3 4
# ---------------------------------------------------------------------------------------------------------------------------
setupBoard:
addi $sp, $sp, -4
sw $ra, ($sp)

la $a0, divide1
li $v0, 4
syscall

################################################################ 
# Open (for writing) a file that does not exist
################################################################ 
li   $v0, 13       # system call for open file
la   $a0, file_out # output file name
li   $a1, 1        # Open for writing (flags are 0: read, 1: write)
li   $a2, 0        # mode is ignored
syscall            # open a file (file descriptor returned in $v0)
move $a3, $v0      # save the file descriptor 
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, startInitializeBoard
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, startInitializeBoard   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, divide1
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, player1InputBoard
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, player1InputBoard   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, divide1
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

li $s2, 3
li $s3, 2
li $s4, 1
jal setupBoardOfPlayer

la $a0, divide2
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide2   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

li $s2, 3
li $s3, 2
li $s4, 1
jal swapTurn

la $a0, xuongdong20
li $v0, 4
syscall

la $a0, divide1
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, player2InputBoard
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, player2InputBoard   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, divide1
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

jal setupBoardOfPlayer

jal swapTurn

la $a0, divide1
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
la $a0, endInitializeBoard
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, endInitializeBoard   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, divide1
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, xuongdong20
li $v0, 4
syscall

lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# SET UP BOARD OF PLAYER FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# s2, s3, s4, store current number of ships of size 2 3 4
# NEW: 
# t0, t1, t2, t3 for start_x end_x start_y end_y
# t4 = s2 + s3 + s4
# s5 store whose turn
# NOTE:
# ascii of '0' = 48 (dec), '1' = 49 (dec)
# ---------------------------------------------------------------------------------------------------------------------------
setupBoardOfPlayer:
addi $sp, $sp, -4
sw $ra, ($sp)
# ---------------------------------------------------------------------------------------------------------------------------
li $t0, 0
li $t1, 0
li $t2, 0
li $t3, 0
la $s5, whose_turn
lw $s5, ($s5)

# start the loop while (numsize2 + numsize 3 + numsize 4) => start loop for placing ships
setupBoardOfPlayer_loop1:
li $t4, 0
add $t4, $s2, $s3
add $t4, $t4, $s4                # t4 = s2 + s3 + s4

la $a0, startRule
li $v0, 4
syscall

la $a0, divide1
li $v0, 4
syscall

beqz $t4, setupBoardOfPlayer_end # IF (numsize2 + numsize 3 + numsize 4) == 0 => END LOOP

beqz $s5, setupBoardOfPlayer_print1
# SET UP THE BOARD FOR PLAYER 2
la $a0, outputPlayer2Board
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outputPlayer2Board   # address of buffer from which to write
li   $a2, 24      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a1, player2Board
jal printBoard
j setupBoardOfPlayer_finishPrePrint

# SET UP THE BOARD FOR PLAYER 1
setupBoardOfPlayer_print1:
la $a0, outputPlayer1Board
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outputPlayer1Board   # address of buffer from which to write
li   $a2, 24      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a1, player1Board
jal printBoard
# ---------------------------------------------------------------------------------------------------------------------------
# Input the start and end of head and tail to place a ship
setupBoardOfPlayer_finishPrePrint:
# ADDING EXTRA THINGS FOR EASIER CHECK !!!!!!!!!!
# s2, s3, s4, store current number of ships of size 2 3 4
la $a0, strRemain2
li $v0, 4
syscall
move $a0, $s2
li $v0, 1
syscall
la $a0, strSemiSpace
li $v0, 4
syscall

la $a0, strRemain3
li $v0, 4
syscall
move $a0, $s3
li $v0, 1
syscall
la $a0, strSemiSpace
li $v0, 4
syscall

la $a0, strRemain4
li $v0, 4
syscall
move $a0, $s4
li $v0, 1
syscall
la $a0, xuongdong
li $v0, 4
syscall
# ---------------------------------------------------------------------------------------------------------------------------
# END ADDING EXTRA THINGS FOR EASIER CHECK !!!!!!!!!!
# NEW: 
# s1: i for the loop
# t5: hasSpace, t6: hasNum, t7: num_input, t8: address of the buffer[i]
# HERE ADDING THE ADDRESS OF THE BOARD TO THE STACK, after this we load back the address later
# ---------------------------------------------------------------------------------------------------------------------------
addi $sp, $sp, -4
sw $a1, ($sp)
j loop_input

# START INITIALIZE THE BUFFER (STRING INPUT) TO ALL 0 CHAR
input_again:
la $a0, strError
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, strError   # address of buffer from which to write
li   $a2, 35      # hardcoded buffer length
syscall            # write to file
###############################################################

loop_input:
li $t5, 0
la $t6, buffer
loop_input_again:
add $t7, $t5, $t5
add $t7, $t7, $t7
add $t7, $t6, $t7
sw $zero, ($t7)
loop_input_incre:
addi $t5, $t5, 1
bne $t5, 50, loop_input_again

la $a0, strInput
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, strInput   # address of buffer from which to write
li   $a2, 84      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, buffer
# store the address of board in a1 into stack before inputting a string of coordinates (store before)
li $a1, 200
li $v0, 8
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, buffer   # address of buffer from which to write

# calculate length of strInput
li $s6, 0 # i = 0
cal_length_input:
add $s7, $s6, $a1 # strInput[i]
lb $s7, ($s7)
beq $s7, 10, cal_length_input_finish # if strInput[i] == '\n'
addi $s6, $s6, 1
j cal_length_input

cal_length_input_finish:
addi $s6, $s6, 1
move $a2, $s6
syscall            # write to file
###############################################################

# END INITIALIZE THE BUFFER (STRING INPUT) TO ALL 0 CHAR
# -------------------------------------------------------------------------------------------------------------------------------
# STRING OUTPUT: $a0: address of output string, $v0: 4.
# STRING INPUT: $a0: address of input string, $a1: max length, $v0: 8
# INTEGER OUTPUT: $a0: integer for output, $v0: 1
# INTEGER INPUT: $v0: 5, $v0: integer that u input
# CHAR OUTPUT: $a0: char to print, $v0: 11
# -------------------------------------------------------------------------------------------------------------------------------
# s2, s3, s4, store current number of ships of size 2 3 4
# t0, t1, t2, t3 for start_x end_x start_y end_y
# t4 = s2 + s3 + s4
# NEW: 
# s1: i for the loop
# t5: hasSpace, t6: hasNum, t7: num_input, t8: address of the buffer[i]
# -------------------------------------------------------------------------------------------------------------------------------
# ASCII TABLE (decimal)
# space: 32
# 0 -> 9: 48 -> 57
# dash -: 45
# -------------------------------------------------------------------------------------------------------------------------------
li $s1, 0 # i = 0
li $t5, 1 # hasSpace = true
li $t6, 0 # hasNum = false
li $t7, 0 # num input
loop_start:
la $t8, buffer # address of buffer
add $t8, $t8, $s1 # address of buffer[i]
lb $t8, ($t8)
beq $t8, 10, checkForExit    # if buffer[i] == '\n'
beq $t8, 32, hasSpace # if buffer[i] == ' '
blt $t8, 48, input_again # if buffer[i] < '0'
bgt $t8, 57, input_again # if buffer[i] > '9', both of these i would ask them to input again

# When come here, it means that buffer[i] is in range ['0', '9']
# if hasNum == true (nghia la character ngay dang truoc la 1 con so => invalid)
beq $t6, 1, input_again

# if hasNum == false
li $t6, 1 # hasNum = true

# if not hasSpace before
bne $t5, 1, input_again

# if has space before
li $t5, 0 # assign hasSpace == false

addi $t7, $t7, 1 # num input = num_input + 1 (num_input initialize with 0)

# if the number of input now is 5 => invalid
beq $t7, 5, input_again


addi $t8, $t8, -48
bgt $t8, 6, input_again

# valid number of input
beq $t7, 1, saveNum1
beq $t7, 2, saveNum2
beq $t7, 3, saveNum3
beq $t7, 4, saveNum4

saveNum1:
move $t0, $t8
j loop_incre

saveNum2:
move $t1, $t8
j loop_incre

saveNum3:
move $t2, $t8
j loop_incre

saveNum4:
move $t3, $t8
j loop_incre
# -------------------------------------------------------------------------------------------------------------------------------
# s2, s3, s4, store current number of ships of size 2 3 4
# t0, t1, t2, t3 for start_x end_x start_y end_y
# t4 = s2 + s3 + s4
# NEW: 
# s1: i for the loop
# t5: hasSpace, t6: hasNum, t7: num_input, t8: address of the buffer[i]
# -------------------------------------------------------------------------------------------------------------------------------
checkForExit:
# if comes here, it means that we are checking buffer[i] == '\0'
# if num input < 4
blt $t7, 4, input_again
j end_input_start_end_of_head_tail

hasSpace:
li $t5, 1 # hasSpace = true
beqz $t6, hasSpace_end # if hasNum == false
# if hasNum == true
li $t6, 0 # If character_before is a number, character_now is a space, assign hasNum = false
hasSpace_end:
j loop_incre


loop_incre:
addi $s1, $s1, 1
j loop_start
# End input the start and end of head and tail
# ---------------------------------------------------------------------------------------------------------------------------
end_input_start_end_of_head_tail:
# ADDING 

la $a0, divide2
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide2   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

lw $a1, ($sp)
addi $sp, $sp, 4

jal placeShipPlayer

la $a0, divide2
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide2   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

j setupBoardOfPlayer_loop1
# ---------------------------------------------------------------------------------------------------------------------------
setupBoardOfPlayer_end:
beqz $s5, setupBoardOfPlayer_printBoard_afterInput_P1
la $a0, outputPlayer2Board
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outputPlayer2Board   # address of buffer from which to write
li   $a2, 24      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a1, player2Board
j setupBoardOfPlayer_printBoard_startPrint

setupBoardOfPlayer_printBoard_afterInput_P1:
la $a0, outputPlayer1Board
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outputPlayer1Board   # address of buffer from which to write
li   $a2, 24      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a1, player1Board

setupBoardOfPlayer_printBoard_startPrint:
jal printBoard

lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# PLACE SHIP FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# s2, s3, s4, store current number of ships of size 2 3 4
# t0, t1, t2, t3 for start_x end_x start_y end_y
# s5 store whose turn
# a1 store address of board of whose turn 
# NOTE:
# t4 = s2 + s3 + s4 => can be reuse here cause it is independent 
# ascii of '0' = 48 (dec), '1' = 49 (dec)
# NEW: 
# t4: temp, after use t4 for swap, use it for calculating the size
# t5: loop
# t6 for calculating the address at board[r][end_x]
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
placeShipPlayer:
addi $sp, $sp, -4
sw $ra, ($sp)

# PRECHECK1: CHECK IF VALID DIRECTION => HORIZONTAL AND VERTICAL
# if (start_x != start_y && end_x != end_y) => invalid direction 
bne $t0, $t2, placeShip_check1    
j placeShipPlayer_finish_precheck 
placeShip_check1:
bne $t1, $t3, placeShip_invalidDirection
# FINISH PRECHECK1
# ---------------------------------------------------------------------------------------------------------------------------
# when come here, there are 3 cases:
# -There is a ship of size 1 (2 pairs the same) => This can be tackle by considering the validity of Ship Size
# -A ship is place horizontally or vertically
# Now check which pair is different 2 numbers
# t0, t1, t2, t3 for start_x end_x start_y end_y
placeShipPlayer_finish_precheck:
li $t4, 0 # temp
li $t5, 0 # temp_size

beq $t0, $t2, placeShipPlayer_check_pair_end
# ---------------------------------------------------------------------------------------------------------------------------
placeShipPlayer_check_pair_start:
# the condition when start_x != start_y
# now check if start_x > start_y, if yes, swap them, with the use of t4 (temp)
ble $t0, $t2, placeShipPlayer_check_pair_start_check_size_place_ship # if start_x <= start_y, start check size
# swap start_x (t0) and start_y (t2)
move $t4, $t0
move $t0, $t2
move $t2, $t4

# from now, can reuse the register t4 
# now reuse the reg t4 for calculating the size
placeShipPlayer_check_pair_start_check_size_place_ship:
sub $t4, $t2, $t0 # temp_size (t4) = start_y - start_x 
addi $t4, $t4, 1  # temp_size (t4) = start_y - start_x + 1
blt $t4, 2, placeShipInvalidSize
bgt $t4, 4, placeShipInvalidSize

# if comes here, it means that the size is valid (2 -> 4)
# s2, s3, s4, store current number of ships of size 2 3 4
# now check if the nunmber of ship at that size still available
# temp_size = 2
beq $t4, 2, placeShip_start_check_size_2
beq $t4, 3, placeShip_start_check_size_3
beq $t4, 4, placeShip_start_check_size_4

placeShip_start_check_size_2:
bnez $s2, placeShip_start_ok_to_place
la $a0, outOfSize2
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outOfSize2   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

placeShip_start_check_size_3:
bnez $s3, placeShip_start_ok_to_place
la $a0, outOfSize3
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outOfSize3   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

placeShip_start_check_size_4:
bnez $s4, placeShip_start_ok_to_place
la $a0, outOfSize4
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outOfSize4   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

# ---------------------------------------------------------------------------------------------------------------------------
# CHECK OVERLAP SHIP
# if comes here, it is ok to place a ship, start place a ship VERTICALLY
# t0, t1, t2, t3 for start_x end_x start_y end_y
# s5 store whose turn
# a1 store address of board of whose turn 
# ascii of '0' = 48 (dec), '1' = 49 (dec)
placeShip_start_ok_to_place:
move $t5, $t0     # t5 = start_x
placeShip_start_loop_checkoverlap:
add $t6, $t5, $0  # t6 = t5
mul $t6, $t6, 7   # t5 x 7 => address of board[t5] (chua cong address board)
add $t6, $t6, $t1 # t5 x 7 + end_x => address of board[t5][end_x] (chua cong address board)
add $t6, $t6, $a1 # address of board[t5][end_x] (chua cong address board)

lb $t6, ($t6)     # use t6 to load the byte at that address, check if is a '0' or '1', if '1' => overlap
beq $t6, 49, placeShip_overlap_ship

# if comes here, it means that the ship is not overlap, continue check
placeShip_start_loop_checkoverlap_incre:
addi $t5, $t5, 1
ble $t5, $t2, placeShip_start_loop_checkoverlap # while t5 <= start_y, continue the loop

# ---------------------------------------------------------------------------------------------------------------------------
# OK TO PLACE SHIP
# if comes here, it is ok to place a ship, start place a ship VERTICALLY
# t0, t1, t2, t3 for start_x end_x start_y end_y
# s5 store whose turn
# a1 store address of board of whose turn 
# ascii of '0' = 48 (dec), '1' = 49 (dec)
move $t5, $t0     # t5 = start_x
placeShip_start_loop_placeShip:
add $t6, $t5, $0  # t6 = t5
mul $t6, $t6, 7   # t5 x 7 => address of board[t5] (chua cong address board)
add $t6, $t6, $t1 # t5 x 7 + end_x => address of board[t5][end_x] (chua cong address board)
add $t6, $t6, $a1 # address of board[t5][end_x] (chua cong address board)
li $t7, 0
addi $t7, $t7, 49
sb $t7, ($t6)

placeShip_start_loop_placeShip_incre:
addi $t5, $t5, 1
ble $t5, $t2, placeShip_start_loop_placeShip # while t5 <= start_y, continue the loop

j placeShip_decrease_ship_used
# ---------------------------------------------------------------------------------------------------------------------------
# the condition when end_x != end_y
placeShipPlayer_check_pair_end:
# the condition when end_x != end_y
# now check if end_x > end_y, if yes, swap them, with the use of t4 (temp)
ble $t1, $t3, placeShipPlayer_check_pair_end_check_size_place_ship # if end_x <= end_y, start check size
# swap end_x (t0) and end_y (t2)
move $t4, $t1
move $t1, $t3
move $t3, $t4

# from now, can reuse the register t4 
# now reuse the reg t4 for calculating the size
placeShipPlayer_check_pair_end_check_size_place_ship:
sub $t4, $t3, $t1 # temp_size (t4) = end_y - end_x 
addi $t4, $t4, 1  # temp_size (t4) = end_y - end_x + 1
blt $t4, 2, placeShipInvalidSize
bgt $t4, 4, placeShipInvalidSize

# if comes here, it means that the size is valid (2 -> 4)
# s2, s3, s4, store current number of ships of size 2 3 4
# now check if the nunmber of ship at that size still available
# temp_size = 2
beq $t4, 2, placeShip_end_check_size_2
beq $t4, 3, placeShip_end_check_size_3
beq $t4, 4, placeShip_end_check_size_4

placeShip_end_check_size_2:
bnez $s2, placeShip_end_ok_to_place
la $a0, outOfSize2
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outOfSize2   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

placeShip_end_check_size_3:
bnez $s3, placeShip_end_ok_to_place
la $a0, outOfSize3
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outOfSize3   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

placeShip_end_check_size_4:
bnez $s4, placeShip_end_ok_to_place
la $a0, outOfSize4
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outOfSize4   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out
# ---------------------------------------------------------------------------------------------------------------------------
# CHECK OVERLAP SHIP
# if comes here, it is ok to place a ship, start place a ship HORIZONTALLY
# t0, t1, t2, t3 for start_x end_x start_y end_y
# s5 store whose turn
# a1 store address of board of whose turn 
# ascii of '0' = 48 (dec), '1' = 49 (dec)

placeShip_end_ok_to_place:
move $t5, $t1 # t5 = end_x
placeShip_end_loop_checkoverlap:
add $t6, $t0, $0  # t6 = start_x
mul $t6, $t6, 7   # t6 x 7 => address of board[t5] (chua cong address board)
add $t6, $t6, $t5 # t6 x 7 + t5 => address of board[start_x][t6] (chua cong address board)
add $t6, $t6, $a1 # address of board[start_x][t6] (cong address board)
lb $t6, ($t6)     # use t6 to load the byte at that address, check if is a '0' or '1', if '1' => overlap
beq $t6, 49, placeShip_overlap_ship

# if comes here, it means that the ship is not overlap, continue check
placeShip_end_loop_checkoverlap_incre:
addi $t5, $t5, 1
ble $t5, $t3, placeShip_end_loop_checkoverlap # while t5 <= end_y, continue the loop
# ---------------------------------------------------------------------------------------------------------------------------
# OK TO PLACE SHIP
# if comes here, it is ok to place a ship, start place a ship VERTICALLY
# t0, t1, t2, t3 for start_x end_x start_y end_y
# s5 store whose turn
# a1 store address of board of whose turn 
# ascii of '0' = 48 (dec), '1' = 49 (dec)

move $t5, $t1     # t5 = end_x
placeShip_end_loop_placeShip:
add $t6, $t0, $0  # t6 = start_x
mul $t6, $t6, 7   # t6 x 7 => address of board[t5] (chua cong address board)
add $t6, $t6, $t5 # t6 x 7 + t5 => address of board[start_x][t6] (chua cong address board)
add $t6, $t6, $a1 # address of board[start_x][t6] (cong address board)
li $t7, 0
addi $t7, $t7, 49
sb $t7, ($t6)

placeShip_end_loop_placeShip_incre:
addi $t5, $t5, 1
ble $t5, $t3, placeShip_end_loop_placeShip # while t5 <= end_y, continue the loop

j placeShip_decrease_ship_used
# ---------------------------------------------------------------------------------------------------------------------------
# PLACE SHIP SUCCESS => NOW UPDATE CURRENT NUMBER OF SHIPS
# t0, t1, t2, t3 for start_x end_x start_y end_y
# s2, s3, s4, store current number of ships of size 2 3 4
# s5 store whose turn
# a1 store address of board of whose turn 
# ascii of '0' = 48 (dec), '1' = 49 (dec)
# t4, temp size
# ---------------------------------------------------------------------------------------------------------------------------
placeShip_decrease_ship_used:
beq $t4, 2, placeShip_decrease2
beq $t4, 3, placeShip_decrease3

# success place ship size 4
addi $s4, $s4, -1
la $a0, inputPlaceSize4
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, inputPlaceSize4   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShip_decrease_ship_used_end

# success place ship size 2
placeShip_decrease2:
addi $s2, $s2, -1
la $a0, inputPlaceSize2
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, inputPlaceSize2   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShip_decrease_ship_used_end

# success place ship size 3
placeShip_decrease3:
addi $s3, $s3, -1
la $a0, inputPlaceSize3
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, inputPlaceSize3   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShip_decrease_ship_used_end

placeShip_decrease_ship_used_end:
j placeShipPlayer_Out
# ---------------------------------------------------------------------------------------------------------------------------
# SHIP INVALID DIRECTION, INVALID SIZE, OVERLAP
placeShip_invalidDirection:
la $a0, shipInvalidDirection
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, shipInvalidDirection   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

placeShipInvalidSize:
la $a0, shipInvalidSize
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, shipInvalidSize   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

placeShip_overlap_ship:
la $a0, inputOverlap
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, inputOverlap   # address of buffer from which to write
li   $a2, 67      # hardcoded buffer length
syscall            # write to file
###############################################################
j placeShipPlayer_Out

placeShipPlayer_Out:
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# PLAY GAME FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# a1 store address of board of whose turn 
# NOTE:
# ascii of '0' = 48 (dec), '1' = 49 (dec)
# NEW: 
# s5 store whose turn
# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# ---------------------------------------------------------------------------------------------------------------------------
playGame:
addi $sp, $sp, -4
sw $ra, ($sp)

la $a0, divide3
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide3   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a0, outputGameStart
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outputGameStart   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a0, divide3
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide3   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

# THE GAME START HERE
li $s0, 0 # winner check, initialize s0 -> 0 == WINNER = NONE

playGame_loop_checkWinner:

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

la $a0, divide2
li $v0, 4
syscall 

la $a0, playRule
li $v0, 4
syscall

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $s5, whose_turn
lw $s5, ($s5)

jal playTurn
jal checkWinner 

bnez $s0, check_imme # while winner == NONE

#la $a0, xuongdong20
la $a0, xuongdong11
li $v0, 4
syscall

j playGame_loop_checkWinner 

# If comes here, it means that there is a winner
# CHECK THE WINNER
check_imme:
la $a0, divide1
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide1   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

beq $s0, 1, playGame_player1_win
# Player 2 Wins
la $a0, player2Win
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, player2Win   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
j playGame_end

# Player 1 Wins
playGame_player1_win:
la $a0, player1Win
li $v0, 4
syscall

################################################################ 
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, player1Win   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
j playGame_end

# THE GAME ENDS HERE
playGame_end:
la $a0, divide3
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide3   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, outputGameEnd
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, outputGameEnd   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

la $a0, divide3
li $v0, 4
syscall

###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide3   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################

lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# PLAY TURN FUNCTION 
# ---------------------------------------------------------------------------------------------------------------------------
# NOTE:
# s5 store whose turn
# a1 store address of board of whose turn 
# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# NEW: 
# s1: row_play; s2: col_play
# s3: hitStatus
# s4: NOT USE YET
# s6: address of their board, s7: address of our_view
# 'X': 88; 'O': 79 (ascii in decimal)
# '-': 45 (ascii in decimal)
# ---------------------------------------------------------------------------------------------------------------------------
playTurn:
addi $sp, $sp, -4
sw $ra, ($sp)

la $s5, whose_turn
lw $s5, ($s5)
# PLAYER PLAYS
beqz $s5, playTurn_printView_P1 # if s5 == 0 => player 1 Turn
# PLAYER 2 PLAYS
la $a0, divide2
li $v0, 4
syscall 

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide2   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a0, player2Play
li $v0, 4
syscall 

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, player2Play   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a0, divide2
li $v0, 4
syscall 

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide2   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a1, player2View
jal printBoard
j playTurn_input_shot

# PLAYER 1 PLAYS
playTurn_printView_P1:
la $a0, divide2
li $v0, 4
syscall 

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide2   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a0, player1Play
li $v0, 4
syscall 

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, player1Play   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a0, divide2
li $v0, 4
syscall 

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, divide2   # address of buffer from which to write
li   $a2, 106      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

la $a1, player1View
jal printBoard
# ---------------------------------------------------------------------------------------------------------------------------
# INPUT THE SHOT
# NOTE:
# s5 store whose turn
# a1 store address of board of whose turn 
# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# NEW: 
# s1: row_play; s2: col_play
# s3: hitStatus
# s4: NOT USE YET
# s6: address of their board, s7: address of our_view
# 'X': 88; 'O': 79 (ascii in decimal)
# '-': 45 (ascii in decimal)
# t0 = i
playTurn_input_shot:
la $a0, enterShot
li $v0, 4
syscall 

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, enterShot   # address of buffer from which to write
li   $a2, 34      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4
###############################################################

# Input the row of the shot
# store a1 to stack first
addi $sp, $sp, -4
sw $a1, ($sp)
j playTurn_here_input_row

playTurn_input_row:
la $a0, strError
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, strError   # address of buffer from which to write
li   $a2, 35      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4
###############################################################
playTurn_here_input_row:
la $a0, enterRow
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, enterRow   # address of buffer from which to write
li   $a2, 32      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4
###############################################################

# before inputting the row of target to targetInput, refresh the string targetInput to all '0'
la $a0, targetInput
li $t0, 0
playTurn_input_row_refresh_start:
add $t1, $t0, $t0
add $t1, $t1, $t1 # t1 = i x 4
add $t1, $t1, $a0 # t1 = i x 4 + address
sw $zero, ($t1)
playTurn_input_row_refresh_incre:
addi $t0, $t0, 1
bne $t0, 50, playTurn_input_row_refresh_start

la $a0, targetInput
li $a1, 200
li $v0, 8
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $a2, ($sp)

addi $sp, $sp, -4
sw $s6, ($sp)

addi $sp, $sp, -4
sw $s7, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, targetInput   # address of buffer from which to write

# calculate length of strInput
li $s6, 0 # i = 0
cal_length_target_row:
add $s7, $s6, $a1 # strInput[i]
lb $s7, ($s7)
beq $s7, 10, cal_length_target_row_finish # if strInput[i] == '\n'
addi $s6, $s6, 1
j cal_length_target_row

cal_length_target_row_finish:
addi $s6, $s6, 1
move $a2, $s6
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0, s6, s7                              #
###############################################################
lw $s7, ($sp)
addi $sp, $sp, 4

lw $s6, ($sp)
addi $sp, $sp, 4

lw $a2, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

# after this, a0 store address of targetInput
# space: 32, '0': 48, '9': 57, '\n': 10
li $t0, 0
li $t1, 0 # hasNum = false
playTurn_input_row_loop_start:
add $t2, $a0, $t0 # t1 = address of targetInput[i]
lb $t2, ($t2)     # t1 = targetInput[i]

bne $t2, 10, playTurn_input_row_check_next   # if targetInput[i] != '\n' => check next
beqz $t1, playTurn_input_row                 # if targetInput[i] == '\n' && hasNum == false => input again
j playTurn_input_row_loop_end                # if targetInput[i] == '\n' && hasNum == true  => input end

playTurn_input_row_check_next:
# Here targetInput[i] != '\n'
beq $t2, 32, playTurn_input_row_loop_incre   # if targetInput[i] == ' ' => next check
blt $t2, 48, playTurn_input_row # if targetInput[i] < '0' => input again
bgt $t2, 54, playTurn_input_row # if targetInput[i] > '6' => input again
# Here targetInput[i] in range ['0', '6']
# Now check, if hasNum already == true => input again
bnez $t1, playTurn_input_row                 # if hasNum == true => input again
addi $t2, $t2, -48                           # if hasNum == false => store num => hasNum = true
move $s1, $t2
li $t1, 1

playTurn_input_row_loop_incre:
addi $t0, $t0, 1
j playTurn_input_row_loop_start

playTurn_input_row_loop_end:
lw $a1, ($sp)
addi $sp, $sp, 4

# ---------------------------------------------------------------------------------------------------------------------------
# Input the column of the shot
# store a1 to stack first
addi $sp, $sp, -4
sw $a1, ($sp)
j playTurn_here_input_col

playTurn_input_col:
la $a0, strError
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, strError   # address of buffer from which to write
li   $a2, 35      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

playTurn_here_input_col:
la $a0, enterCol
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, enterCol   # address of buffer from which to write
li   $a2, 32      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

# before inputting the row of target to targetInput, refresh the string targetInput to all '0'
la $a0, targetInput
li $t0, 0
playTurn_input_col_refresh_start:
add $t1, $t0, $t0
add $t1, $t1, $t1 # t1 = i x 4
add $t1, $t1, $a0 # t1 = i x 4 + address
sw $zero, ($t1)
playTurn_input_col_refresh_incre:
addi $t0, $t0, 1
bne $t0, 50, playTurn_input_col_refresh_start

la $a0, targetInput
li $a1, 200
li $v0, 8
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)

addi $sp, $sp, -4
sw $s6, ($sp)

addi $sp, $sp, -4
sw $s7, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, targetInput   # address of buffer from which to write

# calculate length of strInput
li $s6, 0 # i = 0
cal_length_target_col:
add $s7, $s6, $a1 # strInput[i]
lb $s7, ($s7)
beq $s7, 10, cal_length_target_col_finish # if strInput[i] == '\n'
addi $s6, $s6, 1
j cal_length_target_col

cal_length_target_col_finish:
addi $s6, $s6, 1
move $a2, $s6
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0, s6, s7                              #
###############################################################
lw $s7, ($sp)
addi $sp, $sp, 4

lw $s6, ($sp)
addi $sp, $sp, 4

lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

# after this, a0 store address of targetInput
# space: 32, '0': 48, '9': 57, '\n': 10
li $t0, 0
li $t1, 0 # hasNum = false
playTurn_input_col_loop_start:
add $t2, $a0, $t0 # t1 = address of targetInput[i]
lb $t2, ($t2)     # t1 = targetInput[i]

bne $t2, 10, playTurn_input_col_check_next   # if targetInput[i] != '\n' => check next
beqz $t1, playTurn_input_col                 # if targetInput[i] == '\n' && hasNum == false => input again
j playTurn_input_col_loop_end                # if targetInput[i] == '\n' && hasNum == true  => input end

playTurn_input_col_check_next:
# Here targetInput[i] != '\n'
beq $t2, 32, playTurn_input_col_loop_incre   # if targetInput[i] == ' ' => next check
blt $t2, 48, playTurn_input_col # if targetInput[i] < '0' => input again
bgt $t2, 54, playTurn_input_col # if targetInput[i] > '6' => input again
# Here targetInput[i] in range ['0', '6']
# Now check, if hasNum already == true => input again
bnez $t1, playTurn_input_col                 # if hasNum == true => input again
addi $t2, $t2, -48                           # if hasNum == false => store num => hasNum = true
move $s2, $t2
li $t1, 1

playTurn_input_col_loop_incre:
addi $t0, $t0, 1
j playTurn_input_col_loop_start

playTurn_input_col_loop_end:
lw $a1, ($sp)
addi $sp, $sp, 4
# ---------------------------------------------------------------------------------------------------------------------------
# If it here => The shot has valid coordinates
# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# s1: row_play; s2: col_play
# s3: hitStatus
# s4: NOT USE YET
# s6: address of their board, s7: address of our_view
# s5 store whose turn
# 'X': 88; 'O': 79 (ascii in decimal)

li $s3, 0                        # reinitialize the Hit Status
bnez $s5, playTurn_p2_performHit # if s5 == 1
# PLAYER 1 TURN
# s6: address of their board, s7: address of our_view
la $s6, player2Board
la $s7, player1View
jal performHit
j playTurn_check_hitStatus
# ---------------------------------------------------------------------------------------------------------------------------
playTurn_p2_performHit:
# PLAYER 2 TURN
# s6: address of their board, s7: address of our_view
la $s6, player1Board
la $s7, player2View
jal performHit
j playTurn_check_hitStatus
# ---------------------------------------------------------------------------------------------------------------------------
# PERFORM THE SHOT STATUS ON THE VIEW => UPDATE HIT STATUS IN S3
playTurn_check_hitStatus:
beq $s3, 88, playTurn_hitStatus_hit   # 'X' (88) => HIT
beq $s3, 79, playTurn_hitStatus_miss  # 'O' (79) => MISS
# HIT INVALID => WE HIT THIS TARGET BEFORE
la $a0, hitBefore
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, hitBefore   # address of buffer from which to write
li   $a2, 42      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

j playTurn_out

# HIT SUCCESS => need to place a '0' on player board before swap turn
playTurn_hitStatus_hit:
la $a0, hitSuccess
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, hitSuccess   # address of buffer from which to write
li   $a2, 6      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

# s1: row_play; s2: col_play
bnez $s5, playTurn_p2_set_0 # (if s5 != 0) === (if s5 == 1)
# PLAYER 1 TURN => set 0 on player2 board
la $t0, player2Board
move $t1, $s1     # t1 = row_play
mul $t1, $t1, 7   # t1 = row_play x 7
add $t1, $t1, $s2 # address of board[row_play][col_play] (no add address board)
add $t1, $t1, $t0 # address of board[row_play][col_play] (add address board)
li $t2, 48        # ascii of '0'
sb $t2, ($t1)
j playTurn_set0_end

# PLAYER 2 TURN => set 0 on player1 board
playTurn_p2_set_0:
la $t0, player1Board
move $t1, $s1     # t1 = row_play
mul $t1, $t1, 7   # t1 = row_play x 7
add $t1, $t1, $s2 # address of board[row_play][col_play] (no add address) board
add $t1, $t1, $t0 # address of board[row_play][col_play] (add address board)
li $t2, 48        # ascii of '0'
sb $t2, ($t1)
j playTurn_set0_end

playTurn_set0_end:
jal swapTurn
j playTurn_out

# HIT MISS => just swap turn
playTurn_hitStatus_miss:
la $a0, hitFail
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)

addi $sp, $sp, -4
sw $a1, ($sp)
###############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, hitFail   # address of buffer from which to write
li   $a2, 6      # hardcoded buffer length
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4

lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

jal swapTurn
j playTurn_out

# ---------------------------------------------------------------------------------------------------------------------------
playTurn_out:
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# PERFORM HIT FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# NOTE:
# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# s1: row_play; s2: col_play
# s3: hitStatus
# s4: NOT USE YET
# s5 store whose turn
# s6: address of their board, s7: address of our_view
# 'X': 88; 'O': 79 (ascii in decimal)
# '-': 45 (ascii in decimal)
# NEW:
# t0, address of our_view[row_play][col_play]
# t1, value at t0 => then can be reuse to calculate address of their_board[row_play][col_play]
# t2, value at t1 (after calculate address at t1)
# ---------------------------------------------------------------------------------------------------------------------------
performHit:
addi $sp, $sp, -4
sw $ra, ($sp)
# ---------------------------------------------------------------------------------------------------------------------------
# if (our_view[row_play][col_play] != EMPTY_VIEW)
# ---------------------------------------------------------------------------------------------------------------------------
move $t0, $s1     # t1 = row_play
mul $t0, $t0, 7   # t1 = row_play x 7
add $t0, $t0, $s2 # address of our_view[row_play][col_play] (no add address) board
add $t0, $t0, $s7 # address of our_view[row_play][col_play] (add address board)
lb $t1, ($t0)     # load byte at our_view[row_play][col_play]

la $s5, whose_turn
lw $s5, ($s5)

# if value at our_view[row_play][col_play] == '-' => CHECK THEIR BOARD TO PERFORM THE HIT
beq $t1, 45, performHit_hit_success_fail
# HIT BEFORE ('X': 88) => set hitStatus to INVALID (-1)
li $s3, -1
j performHit_end
# ---------------------------------------------------------------------------------------------------------------------------
performHit_hit_success_fail:
# ---------------------------------------------------------------------------------------------------------------------------
# if their_board[row_play][col_play] != EMPTY_PART
# s6: address of their board, s7: address of our_view
# s1: row_play; s2: col_play
# ---------------------------------------------------------------------------------------------------------------------------
move $t1, $s1     # t1 = row_play
mul $t1, $t1, 7   # t1 = row_play x 7
add $t1, $t1, $s2 # address of their_board[row_play][col_play] (no add address) board
add $t1, $t1, $s6 # address of their_board[row_play][col_play] (add address board)
lb $t2, ($t1)
beq $t2, 48, performHit_fail # if (their_board[row_play][col_play] == '0') => NO SHIP AT THE TARGET BOARD => HIT FAIL

# HIT SUCCESS
li $t2, 88        # X (hit) has ascii 88 in decimal
sb $t2, ($t0)     # assign hit back to our view
li $s3, 88
j performHit_end

performHit_fail:
# HIT FAIL
li $t2, 79        # O (MISS) has ascii 79 in decimal
sb $t2, ($t0)     # assign hit back to our view
li $s3, 79

j performHit_end
# ---------------------------------------------------------------------------------------------------------------------------
performHit_end:
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# CHECK WINNER FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# NOTE:
# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# s5 store whose turn
# 'X': 88; 'O': 79 (ascii in decimal)
# '-': 45 (ascii in decimal)
# '0': 48, '1': 49
# NEW: 
# t8: store the result value of checkPlayerWinner
# t9: store address of the board need check
# ---------------------------------------------------------------------------------------------------------------------------
checkWinner:
addi $sp, $sp, -4
sw $ra, ($sp)
li $s0, 0 # initialize WINNER to NONE

# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# t9: store address of the board need check
# t8: store the result value of checkPlayerWinner
# '0': 48, '1': 49

# if checkPlayerWin(player1Board) == 1
la $t9, player2Board
jal checkPlayerWin
bne $t8, 1, checkWinner_checkP2
li $s0, 1
j checkWinner_end

# if checkPlayerWin(player2Board) == 1
checkWinner_checkP2:
la $t9, player1Board
jal checkPlayerWin
bne $t8, 1, checkWinner_noWinner
li $s0, 2
j checkWinner_end

# WINNER == NONE
checkWinner_noWinner:
li $s0, 0
j checkWinner_end

checkWinner_end:
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# CHECK PLAYER WIN FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# NOTE:
# s0: winner_store (0: no winner, 1: player 1 wins, 2: player 2 wins)
# s5 store whose turn
# 'X': 88; 'O': 79 (ascii in decimal)
# '-': 45 (ascii in decimal)
# '0': 48, '1': 49
# t8: store the result value of checkPlayerWin
# t9: store address of the board need check
# ---------------------------------------------------------------------------------------------------------------------------
checkPlayerWin:
addi $sp, $sp, -4
sw $ra, ($sp)
li $t8, 0 # initialize with 0

li $t1, 0 # i = 0
checkPlayerWin_loop1: 

	li $t2, 0 # j = 0
	checkPlayerWin_loop2:
	mul $t3, $t1, 7   # i x 7
	add $t3, $t3, $t2 # i x 7 + j => address of board[i][j]
	add $t3, $t3, $t9
	lb $t3, ($t3)     # load value at board[i][j]

	# if board[i][j] == '1' => still contains part of a ship on the board => NOT THE WINNER
	beq $t3, 49, checkPlayerWin_end

	checkPlayerWin_loop2_incre:
	addi $t2, $t2, 1
	bne $t2, 7, checkPlayerWin_loop2

checkPlayerWin_loop1_incre:
beq $t1, 7, checkPlayerWin_update_return_val
addi $t1, $t1, 1
bne $t1, 7, checkPlayerWin_loop1

checkPlayerWin_update_return_val:
li $t8, 1

checkPlayerWin_end:
li $t1, 0
li $t2, 0
li $t3, 0

lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# PRINT BOARD FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
# NEW: use argument a1 to store the address of the board that will be printed
# NOTE:
# s5 store whose turn
# a1 store address of board of whose turn 
# ---------------------------------------------------------------------------------------------------------------------------
printBoard:
addi $sp, $sp, -4
sw $ra, ($sp)

# ---------------------------------------------------------------------------------------------------------------------------
# start loop print the index of column
la $a0, stringLine1
li $v0, 4
syscall

la $a0, stringLine2
li $v0, 4
syscall

###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)
addi $sp, $sp, -4
sw $a1, ($sp)
##############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, stringLine1_2   # address of buffer from which to write
li   $a2, 32      # hardcoded buffer 
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4
lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################
# ---------------------------------------------------------------------------------------------------------------------------
#stringLine1:			.asciiz		"     0   1   2   3   4   5   6 \n" # 32
#stringLine2:			.asciiz		"    --- --- --- --- --- --- ---\n" # 32
#stringBlock:			.asciiz		" | " # 3
#stringLine1_2:			.asciiz		"  --- --- --- --- --- --- ---  \n"
# ---------------------------------------------------------------------------------------------------------------------------
move $t0, $a1

printBoard_start:

li $t1, 0 # i = 0
printBoard_loop1: 
move $a0, $t1
li $v0, 1
syscall

li $a0, 32
li $v0, 11
syscall

la $a0, stringBlock
li $v0, 4
syscall
###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)
addi $sp, $sp, -4
sw $a1, ($sp)
##############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, stringBlock   # address of buffer from which to write
li   $a2, 3      # hardcoded buffer 
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4
lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################

	li $t2, 0 # j = 0
	printBoard_loop2:
	mul $t3, $t1, 7   # i x 7
	add $t3, $t3, $t2 # i x 7 + j => address of player1Board[i][j]
	add $t3, $t3, $t0
	lb $t3, ($t3)
	move $a0, $t3
	li $v0, 11 # print char
	syscall
	
	###############################################################
	# Store a0, a1, a2, v0                                        #
	###############################################################
	addi $sp, $sp, -4
	sw $a0, ($sp)

	addi $sp, $sp, -4
	sw $a1, ($sp)
	###############################################################
	# Write to file just opened
	li   $v0, 15       # system call for write to file
	move $a0, $a3      # file descriptor 
	beq $t3, 49, printChar1
	beq $t3, 48, printChar0
	beq $t3, 45, printCharDash
	beq $t3, 79, printCharO
	beq $t3, 88, printCharX
	beq $t3, 32, printCharSpace
	beq $t3, 10, printCharNLine
	
printChar1:
	la   $a1, char1   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	j endCheckPrintChar
	
printChar0:
	la   $a1, char0   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	j endCheckPrintChar
	
printCharDash:
	la   $a1, charDash   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	j endCheckPrintChar
	
printCharO:
	la   $a1, charO   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	j endCheckPrintChar

printCharX:
	la   $a1, charX   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	j endCheckPrintChar
	
printCharSpace:
	la   $a1, charSpace   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	j endCheckPrintChar
	
printCharNLine:
	la   $a1, charNewLine   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	j endCheckPrintChar
	
endCheckPrintChar:
	syscall            # write to file
	###############################################################
	# Restore a0, a1, a2, v0                                      #
	###############################################################
	lw $a1, ($sp)
	addi $sp, $sp, 4

	lw $a0, ($sp)
	addi $sp, $sp, 4
	###############################################################
	###############################################################
	
	###############################################################
	###############################################################
	# Store a0, a1, a2, v0                                        #
	###############################################################
	addi $sp, $sp, -4
	sw $a0, ($sp)

	addi $sp, $sp, -4
	sw $a1, ($sp)
	###############################################################
	# Write to file just opened
	li   $v0, 15       # system call for write to file
	move $a0, $a3      # file descriptor 
	la   $a1, stringBlock   # address of buffer from which to write
	li   $a2, 3      # hardcoded buffer 
	syscall            # write to file
	###############################################################
	# Restore a0, a1, a2, v0                                      #
	###############################################################
	lw $a1, ($sp)
	addi $sp, $sp, 4

	lw $a0, ($sp)
	addi $sp, $sp, 4
	###############################################################
	printBoard_loop2_incre:
	addi $t2, $t2, 1
	
	#la $a0, stringBlock
	#li $v0, 4
	#syscall
	
	la $a0, stringBlock
	li $v0, 4
	syscall
	
	bne $t2, 7, printBoard_loop2
	li $a0, 10 # make a new line
	li $v0, 11
	syscall 
	###############################################################
	# Store a0, a1, a2, v0                                        #
	###############################################################
	addi $sp, $sp, -4
	sw $a0, ($sp)

	addi $sp, $sp, -4
	sw $a1, ($sp)
	###############################################################
	# Write to file just opened
	li   $v0, 15       # system call for write to file
	move $a0, $a3      # file descriptor 
	la   $a1, charNewLine   # address of buffer from which to write
	li   $a2, 1      # hardcoded buffer 
	syscall            # write to file
	###############################################################
	# Restore a0, a1, a2, v0                                      #
	###############################################################
	lw $a1, ($sp)
	addi $sp, $sp, 4

	lw $a0, ($sp)
	addi $sp, $sp, 4
	###############################################################

printBoard_loop1_incre:
addi $t1, $t1, 1
la $a0, stringLine2
li $v0, 4	
syscall
###############################################################
# Store a0, a1, a2, v0                                        #
###############################################################
addi $sp, $sp, -4
sw $a0, ($sp)
addi $sp, $sp, -4
sw $a1, ($sp)
##############################################################
# Write to file just opened
li   $v0, 15       # system call for write to file
move $a0, $a3      # file descriptor 
la   $a1, stringLine1_2   # address of buffer from which to write
li   $a2, 32      # hardcoded buffer 
syscall            # write to file
###############################################################
# Restore a0, a1, a2, v0                                      #
###############################################################
lw $a1, ($sp)
addi $sp, $sp, 4
lw $a0, ($sp)
addi $sp, $sp, 4
###############################################################
bne $t1, 7, printBoard_loop1

li $t1, 0
li $t2, 0
li $t3, 0

lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# SWAP TURN FUNCTION
# ---------------------------------------------------------------------------------------------------------------------------
swapTurn:
addi $sp, $sp, -4
sw $ra, ($sp)

la $t0, whose_turn
lw $t1, ($t0)
beqz $t1, swapToP1
li $t1, 0
j end_swapTurn
swapToP1:
li $t1, 1
end_swapTurn:
sw $t1, ($t0)

lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Exit
# ---------------------------------------------------------------------------------------------------------------------------
exit:
###############################################################
# Close the file 
li   $v0, 16       # system call for close file
move $a0, $a3      # file descriptor to close
syscall            # close file
###############################################################

li $v0, 10
syscall
