                .text
                .align     2
                .global    main

/*  i (loop counter)        x20
    pflag                   x21
*/
main:          # preserve registers for later
                stp                x29, x30, [sp, -16] !
                stp                x20, x21, [sp, -16] !


                mov                x20, -1        // initializing i as 0
                 
top:            add                x20, x20, 1
                cmp                x20, 100       // starting for loop comparing 100 to 0
                bge                bottom         // branch is greater than 100 in the for loop
                mov                x21, xzr       // intializing pflag as 0
                mov                x1, 3
                mov                x0, x20
                udiv	           x2, x0, x1
	            msub 	           x3, x2, x1, x0
                cbnz               x3, ProcessFive  // if statement to compare i % 

ProcessThree:          
                ldr                 x0, =fizz // if its divisble by 3, it will load fizz
            	bl                  printf   // print off fizz
            	mov                 x21, 1  // intializing the pflag as 1 in the if statement
 


ProcessFive:
                mov                 x1, 5
                mov                 x0, x20
                udiv	               x2, x0, x1
	            msub 	           x3, x2, x1, x0
                cbnz                x3, Printnum  // compare and branch on zero   
                ldr                 x0, =buzz
                bl                  printf
                mov                 x21, 1     // intializing pflag as 1 in the if statement 

Printnum:             
                cmp                   x21, 1
                beq                   lf
                ldr                   x0, =fmt
                mov                   x1, x20
                bl                    printf

lf:            	ldr                   x0, =newline
               	bl                    printf
               	b                     top                  
                 
                 
                             
                    
bottom:         ldp                 x20, x21, [sp], 16
                ldp                 x29, x30, [sp], 16
                mov                 x0, xzr
                ret


                .data
                
        


fizz:         .asciz        "Fizz"
buzz:         .asciz        "Buzz"
fmt:           .asciz        "%d"
newline:    .asciz "\n"
endloop:       .asciz       "endloop"

                    .end
                    