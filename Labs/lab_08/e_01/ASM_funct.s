				
				
				AREA asm_functions, CODE, READONLY				
                EXPORT  ASM_funct
				EXPORT CHECK_SQUARE
				EXPORT MY_DIVISION
				IMPORT __aeabi_fdiv
				IMPORT _fflt
					
				
ASM_funct
				; save current SP for a faster access 
				; to parameters in the stack
				MOV   r12, sp
				; save volatile registers
				STMFD sp!,{r4-r8,r10-r11,lr}				
				; extract argument 4 and 5 into R4 and R5
				LDR   r4, [r12]
				LDR   r5, [r12,#4]
				
				add	  r5, r4, r5
				; setup a value for R0 to return
				
				MOV	  r0, r5
				; restore volatile registers
				LDMFD sp!,{r4-r8,r10-r11,pc}
				
				
				
CHECK_SQUARE				
			
				MOV R12, SP
				STMFD SP!, {LR}
				MUL R0, R0, R0
				MUL R1, R1, R1
				MUL R2, R2, R2
				ADD R0, R0, R1
				CMP R0, R2
				MOVEQ R0, #1
				MOVLT R0, #1
				MOVGT R0, #0
				LDMFD SP!, {PC}
				
				
MY_DIVISION
	
			MOV R12, SP
			STMFD SP!, {R4-R5, R6-R7,LR}
			BL __aeabi_fdiv
			LDMFD SP!, {R4-R5, R6-R7,PC}
			
				



                END