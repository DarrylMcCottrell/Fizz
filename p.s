.text
 .align     2
 .global    main




 main:  # preserve registers for later
                stp             x29, x30, [sp, -16] !
                stp             x20, x21, [sp, -16] !

                # Dictionary:
               ldr                 x20 // Registered x20 as i        
               ldr                 x21 // registered x21 as pflag
               
             //  ldr                 x3, 3 // registered x3 as 3 so I can use in udiv     
              // bl                  printf
               //ldr                 x4, 5 // registered x4 as 5 for udiv
              // bl                  printf
                # restore registers

                mov                x20, 0  // initializing i as 0
                 
 top:
                                 
  
               
                cmp                x20, 100  // starting for loop comparing 100 to 0
                bge                endloop  // branch is greater than 100 in the for loop
                ldr                x21  // loading in pflag
                mov                x21, 0    // intializing pflag as 0
            
                cmp                 x20, 3  // if statement to compare i % 3
                udiv	            x2, x0, x1
	            msub 	            x3, x2, x1, x0
                bne                 x5 // if it's not equal send to the bottom
                ldr                 x0,=fizz // if its divisble by 3, it will load fizz
                bl                  printf  // print off fizz
                mov                 x21, 1  // intializing the pflag as 1 in the if statement
                cmp                 x20, 5  // if statement to compare i to 5
                udiv	            x2, x0, x1
	            msub 	            x3, x2, x1, x0
                bne                 bottom 
                ldr                 x0, =buzz
                bl                  printf
                mov                 x21, 1 //intializing pflag as 1 in the if statement 
                cmp                 x21, 0 //If statement to compare pflag to 0
                ldr                 x0, =fmt
                bl                  printf
                ldr                 x0, =nl 
                bl                  printf   
                add                 x20, x1, 1  //Incrementing it up 1 so it's not an infinite loop
                bl                   top            
                
                
                .endloop:
                             
                    
bottom:    # gap
                ldp                 x20, x21, [sp], 16
                ldp                 x29, x30, [sp], 16
                mov                 x0, xzr
                ret


                .data
                
        


fizz:         .asciz        "Fizz"
buzz:         .asciz        "Buzz"
nl:               .asciz          "\n"
fmt:           .asciz        "%d"
i:             .asciz       "i"
pflag:         .asciz       "pflag"
//fizzbuzz:      .asciz       "FizzBuzz"
endloop:       .asciz       "endloop"

                    .end
                    