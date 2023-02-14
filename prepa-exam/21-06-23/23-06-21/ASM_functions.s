				AREA asm_functions, CODE, READONLY				
                EXPORT  sopra_la_media 
					
sopra_la_media
				; save current SP for a faster access 
				; to parameters in the stack
				MOV   r12, sp
				; save volatile registers
				STMFD sp!,{r4-r8,r10-r11,lr}
				mov r4, r1
				mov r5, #0
				mov r6, #0
				
sum_all_elt_vector
				ldrb r7, [r0, r6]
				add r5, r5, r7
				add r6, r6, #1
				cmp r6, r1
				blt sum_all_elt_vector ;r5 is sum of all elt element in the unsigned char vett
				
				mov r6, #0
				
division
				subs r5, r5, r1
				addgt r6, r6, #1
				bgt division   ; r6 is the result of the division of the sum
				
				mov r5, #0
				mov r8, #0
				
cmp_all_elt_vector_with_one_value ;the value here is r6
				ldrb r7, [r0]
				cmp r6, r7
				addlt r8, r8, #1
				add r0, r0, #1
				add r5, r5, #1
				cmp r5, r1
				blt cmp_all_elt_vector_with_one_value ;r5 is sum				
				
				
				mov r0, r8		
				
				; restore volatile registers
				LDMFD sp!,{r4-r8,r10-r11,pc}
				
                END