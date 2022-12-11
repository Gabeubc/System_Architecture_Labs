
Stack_Size EQU 0x00000200
	
				AREA STACK, NOINIT, READWRITE, ALIGN=3
					
					EXPORT Stack_Process;
					
						SPACE Stack_Size/2
Stack_Process SPACE Stack_Size/2
__initial_sp



				AREA ASM_RW, DATA, READWRITE
					
				EXPORT Opt_M_Coordinates
					
Opt_M_Coordinates SPACE 242	



					AREA ASM_data, DATA, READONLY,  ALIGN=2
						
						
					EXPORT _Matrix_Coordinates
					EXPORT _ROWS
					EXPORT _COLUMNS
						
_Matrix_Coordinates DCD -5,5,-4,5,-3,5,-2,5,-1,5,0,5,1,5,2,5,3,5,4,5,5,5
			DCD -5,4,-4,4,-3,4,-2,4,-1,4,0,4,1,4,2,4,3,4,4,4,5,4
			DCD -5,3,-4,3,-3,3,-2,3,-1,3,0,3,1,3,2,3,3,3,4,3,5,3
			DCD -5,2,-4,2,-3,2,-2,2,-1,2,0,2,1,2,2,2,3,2,4,2,5,2
			DCD -5,1,-4,1,-3,1,-2,1,-1,1,0,1,1,1,2,1,3,1,4,1,5,1
			DCD -5,0,-4,0,-3,0,-2,0,-1,0,0,0,1,0,2,0,3,0,4,0,5,0
			DCD -5,-1,-4,-1,-3,-1,-2,-1, 1,-1 ,0,-1,1,-1,2,-1,3,-1,4,-1,5,-1
			DCD -5,-2,-4,-2,-3,-2,-2,-2,-1,-2,0,-2,1,-2,2,-2,3,-2,4,-2,5,-2
			DCD -5,-3,-4,-3,-3,-3,-2,-3,-1,-3,0,-3,1,-3,2,-3,3,-3,4,-3,5,-3
			DCD -5,-4,-4,-4,-3,-4,-2,-4,-1,-4,0,-4,1,-4,2,-4,3,-4,4,-4,5,-4
			DCD -5,-5,-4,-5,-3,-5,-2,-5,-1,-5,0,-5,1,-5,2,-5,3,-5,4,-5,5,-5
				
_ROWS 			DCB 11

_COLUMNS 		DCB 22
				
				
				
				END