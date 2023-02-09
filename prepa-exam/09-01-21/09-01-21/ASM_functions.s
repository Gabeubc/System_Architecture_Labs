				AREA asm_functions, CODE, READONLY				
                EXPORT  count_negative_and_odd 
					
count_negative_and_odd
				; save current SP for a faster access 
				; to parameters in the stack
				MOV   r12, sp
				; save volatile registers
				STMFD sp!,{r4-r8,r10-r11,lr}
				mov r4, #0
				mov r6, #0
				mov r7, #0
				
				
find_odd_and_negative
				ldr r5, [r0, r4]
				cmp r5, #0
				blt check_if_odd
				add r4, r4, #4
				add r6, r6, #1
				cmp r6, r1
				blt find_odd_and_negative
				nop
				b end_find_odd_and_negative
				
check_if_odd
				adds r5, r5, #2
				blt check_if_odd
				cmp r5, #0
				addeq r7, r7, #1
				add r4, r4, #4
				add r6, r6, #1
				cmp r6, r1
				blt find_odd_and_negative
				
end_find_odd_and_negative
				mov r0, r7
				
				; restore volatile registers
				LDMFD sp!,{r4-r8,r10-r11,pc}
				
                END