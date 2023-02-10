				AREA asm_functions, CODE, READONLY				
                EXPORT  get_and_sort 
					
get_and_sort
				; save current SP for a faster access 
				; to parameters in the stack
				MOV   r12, sp
				; save volatile registers
				STMFD sp!,{r4-r8,r10-r11,lr}
				mov r4, r2
				mov r5, #0 ; j=0
				mov r6, #0 ; i=0
				strb r1, [r0, r2]
				add r2, r2, #1
				
order

				ldrb r7, [r0,r6] ; temp max
				mov r5, r6

max   
				ldrb r8, [r0, r5] ; get VET[j]
				cmp r7, r8
				addlt r7, r8, #0 ; new max
				addlt r10, r5, #0 ; save max pos
				add r5, r5, #1
				cmp r5, r2
				blt max
				
				mov r5, #0
				ldrb r9, [r0, r6] ; k=VETT[i]
				strb r7, [r0, r6] ; VETT[i] = max
				strb r9, [r0, r10] ; VETT[pos max] = k
				add r6, r6, #1
				cmp r6, r2
				blt order			
				
				
				mov r0, r1		
				
				; restore volatile registers
				LDMFD sp!,{r4-r8,r10-r11,pc}
				
                END