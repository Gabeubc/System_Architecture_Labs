				
				; DEFINE CONST CHAR N = 5 
;				AREA asm_dat, DATA, READONLY	
;				EXPORT  N
					
;N DCB 40

;				END 
					
					
				; DEFINE DATA_IN[N]
				AREA asm_data, DATA, READWRITE			
;                EXPORT  DATA_IN
				EXPORT BEST_3
					
BEST_3          space 12
					
;DATA_IN         space N

				END 
					