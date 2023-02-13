				AREA asm_functions, CODE, READONLY				
                EXPORT  find_best_3 
					
find_best_3
				; save current SP for a faster access 
				; to parameters in the stack
				MOV   r12, sp
				; save volatile registers
				STMFD sp!,{r4-r8,r10-r11,lr}
				mov r4, r1
				mov r5, #0
				mov r6, #0
				mov r11, #0
				
order

				ldr r7, [r0,r6] ; temp max
				mov r5, r6

max   
				ldr r8, [r0, r5] ; get VET[j]
				cmp r7, r8
				addlt r7, r8, #0 ; new max
				addlt r10, r5, #0 ; save max pos
				add r5, r5, #4
				cmp r5, r1, lsl #2
				blt max
				
				mov r5, #0
				ldr r9, [r0, r6] ; k=VETT[i]
				str r7, [r0, r6] ; VETT[i] = max
				str r9, [r0, r10] ; VETT[pos max] = k
				add r6, r6, #4
				cmp r6, r1, lsl #2
				blt order
				
				mov r6, #0
				mov r9, #3
				
set_3_best_into_best_3

				ldr r7, [r0, r6]
				str r7, [r2, r6]
				add r6, r6, #4
				cmp r6, r9, lsl #2
				blt set_3_best_into_best_3


				mov r0, r1		
				
				; restore volatile registers
				LDMFD sp!,{r4-r8,r10-r11,pc}
				
                END